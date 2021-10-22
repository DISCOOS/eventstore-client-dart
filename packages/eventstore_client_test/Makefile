# Default host IP
HOST = 0.0.0.0

# Detect operating system in Makefile.
ifeq ($(OS),Windows_NT)
	OSNAME = WIN32
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSNAME = LINUX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSNAME = OSX
		# Mac OSX workaround
		HOST = host.docker.internal
	endif
endif

.PHONY: \
	certs action test doc release

.SILENT: \
	certs action test doc release

certs:
	esdbtcli certs --out test

test:
	if [ ! -d test/certs ]; then esdbtcli certs --out test; fi
	dart test -j 1

doc:
	rm -rf doc
	dartdoc
	echo "Starting server at http://localhost:8080"
	dhttpd --path doc/api

release:
	echo 'Release to pub.dev...'
	pub_release --no-test
