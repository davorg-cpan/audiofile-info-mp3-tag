#     PREREQ_PM => { Module::Build=>q[0], AudioFile::Info=>q[0], MP3::ID3Lib=>q[0] }

all : force_do_it
	/usr/bin/perl Build
realclean : force_do_it
	/usr/bin/perl Build realclean
	/usr/bin/perl -e unlink -e shift Makefile

force_do_it :

build : force_do_it
	/usr/bin/perl Build build
clean : force_do_it
	/usr/bin/perl Build clean
code : force_do_it
	/usr/bin/perl Build code
diff : force_do_it
	/usr/bin/perl Build diff
dist : force_do_it
	/usr/bin/perl Build dist
distcheck : force_do_it
	/usr/bin/perl Build distcheck
distclean : force_do_it
	/usr/bin/perl Build distclean
distdir : force_do_it
	/usr/bin/perl Build distdir
distmeta : force_do_it
	/usr/bin/perl Build distmeta
distsign : force_do_it
	/usr/bin/perl Build distsign
disttest : force_do_it
	/usr/bin/perl Build disttest
docs : force_do_it
	/usr/bin/perl Build docs
fakeinstall : force_do_it
	/usr/bin/perl Build fakeinstall
help : force_do_it
	/usr/bin/perl Build help
install : force_do_it
	/usr/bin/perl Build install
manifest : force_do_it
	/usr/bin/perl Build manifest
ppd : force_do_it
	/usr/bin/perl Build ppd
skipcheck : force_do_it
	/usr/bin/perl Build skipcheck
test : force_do_it
	/usr/bin/perl Build test
testdb : force_do_it
	/usr/bin/perl Build testdb
versioninstall : force_do_it
	/usr/bin/perl Build versioninstall
