
all: fix-changelogs
	cd tcejdb && ./configure
	$(MAKE) -C ./tcejdb

clean:
	- $(MAKE) -C ./tcejdb clean
	- rm -rf ./build
	- rm -rf ./var/*
	- rm -f libtcejdb*.tar.gz libtcejdb*.deb libtcejdb*.changes libtcejdb*.build libtcejdb*.dsc

deb-packages: fix-changelogs
	cd ./tcejdb && autoconf && ./configure
	$(MAKE) -C ./tcejdb deb-packages

deb-source-packages: fix-changelogs
	$(MAKE) -C ./ deb-packages DEBUILD_OPTS="-S"


fix-changelogs:
	- mkdir -p tcejdb/debian && touch tcejdb/debian/changelog.in
	cp ./Changelog ./tcejdb/Changelog


.PHONY: all clean deb-packages deb-source-packages fix-changelogs