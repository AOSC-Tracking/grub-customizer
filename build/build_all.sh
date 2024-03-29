#!/bin/bash
if [ "$#" -ne 1 ] && [ "$#" -ne 2 ] ; then
	echo "build_all.sh [project_root] [base_source_package.orig.tar.gz]"
fi

projectRoot="$1"
baseSourcePackage="$2"
basedir=`pwd`
builddir="$basedir/release"
releasedir="$basedir/releases"

if [ ! -f $baseSourcePackage ] ; then echo 'invalid base source package given'; exit 1; fi;

if [ ! -e "$builddir" ]   ; then mkdir "$builddir";   fi
sudo umount "$builddir" 2> /dev/null
sudo mount none "$builddir" -t tmpfs
	
if [ ! -e "$releasedir" ] ; then mkdir "$releasedir"; fi

# copy $baseSourcePackage away to make sure it wont be deleted when deleting old release
if [ "$baseSourcePackage" != "" ]; then
	cp "$baseSourcePackage" "$builddir/tmp_base_source_package"
	baseSourcePackage="$builddir/tmp_base_source_package"
fi

cd "$projectRoot";
projectRoot=`pwd`; # make projectRoot absolute

version=`cat debian/changelog.d | head -n 3 | grep -o '[0-9]*\.[0-9]*\.*[0-9]*'`
rev=`cat debian/changelog.d | head -n 3 | grep -o 'ppa[0-9]*' | grep -o '[0-9]*'`

if [ "$rev" = "1" ]; then
	subdir="$version"
else
	subdir="$version-$rev"
fi

mkdir "$builddir/grub-customizer-$version"
cp -r * "$builddir/grub-customizer-$version"


cd "$builddir/grub-customizer-$version"

if [ $? -ne 0 ] ; then echo 'directory change failed'; exit 1; fi

rm -r debian/changelog.d debian/changelog.revu.d debian/changelog.mentors.d src/config.h build 2> /dev/null

if [ -d "$releasedir/$subdir" ] ; then rm -r "$releasedir/$subdir"; fi;

mkdir "$releasedir/$subdir";

mv debian ../;
find -type f -print | xargs chmod -x;

if [ "$baseSourcePackage" = "" ]; then
	tar -C .. -c grub-customizer-$version | gzip > "$releasedir/$subdir/grub-customizer_$version.orig.tar.gz"
else
	cp "$baseSourcePackage" "$releasedir/$subdir/grub-customizer_$version.orig.tar.gz"
fi

rm -rf "grub-customizer-$version"
mv ../debian ./

mkdir "$releasedir/$subdir/launchpad-source"
cp "$releasedir/$subdir/grub-customizer_$version.orig.tar.gz" "$releasedir/$subdir/launchpad-source/grub-customizer_$version.tar.gz"
gpg --armor --sign --detach-sig "$releasedir/$subdir/launchpad-source/grub-customizer_$version.tar.gz"

function build() {
	versionSuffix="$1"
	distribution="$2"
	
	cp "$releasedir/$subdir/grub-customizer_$version.orig.tar.gz" "$builddir/grub-customizer_$version.orig.tar.gz"

	$projectRoot/debian/changelog.d "$versionSuffix" "$distribution" > debian/changelog
	debuild -S;
	mkdir "$releasedir/$subdir/$distribution"
	mv "$builddir"/grub-customizer_* "$releasedir/$subdir/$distribution"
	
	uploadFile="$releasedir/$subdir/$distribution/upload.sh"
	
	rm "$uploadFile";
	echo '#!/bin/sh' >> "$uploadFile";
	echo 'dput ppa:danielrichter2007/grub-customizer "'$releasedir'/'$subdir'/'$distribution'/grub-customizer_'$version'-0ubuntu1~ppa'$rev$versionSuffix'_source.changes"' >> "$uploadFile";
	
	compileFile="$releasedir/$subdir/$distribution/compile.sh"
	
	echo '#!/bin/sh' >> "$compileFile"
	echo 'cd "'$releasedir/$subdir/$distribution'" && export BD=build_`date +%s` && mkdir $BD && sudo mount none $BD -t tmpfs && tar -xf *.orig.tar.*z -C $BD && tar -xf *.debian.tar.*z -C $BD/* && cp *.orig.tar.*z $BD/ && cd $BD/* && dpkg-buildpackage && cd ../.. && mv $BD/*.deb ./ && sudo umount $BD && rm -rf $BD' >> "$compileFile";
	
	chmod +x "$releasedir/$subdir/$distribution"/*.sh
}

build b bionic
build f focal
build j jammy
build k kinetic
build l lunar
build m mantic


echo '#!/bin/sh
'$releasedir'/'$subdir'/bionic/upload.sh
'$releasedir'/'$subdir'/focal/upload.sh
'$releasedir'/'$subdir'/jammy/upload.sh
'$releasedir'/'$subdir'/kinetic/upload.sh
'$releasedir'/'$subdir'/lunar/upload.sh
'$releasedir'/'$subdir'/mantic/upload.sh
' > $releasedir/$subdir/upload_ppas.sh

chmod +x "$releasedir/$subdir/upload_ppas.sh"

# <revu>
cp "$releasedir/$subdir/grub-customizer_$version.orig.tar.gz" "$builddir/grub-customizer_$version.orig.tar.gz"
"$projectRoot/debian/changelog.revu.d" $version precise > debian/changelog
debuild -S;
mkdir "$releasedir/$subdir/revu"
mv "$builddir"/grub-customizer_* "$releasedir/$subdir/revu"
echo '#!/bin/sh
dput revu '$releasedir'/'$subdir'/revu/grub-customizer_'$version'-0ubuntu1_source.changes' > $releasedir/$subdir/revu/upload.sh
chmod +x "$releasedir/$subdir/revu/upload.sh"
# </revu>

cd "$basedir"
sudo umount "$builddir"
rmdir "$builddir"
