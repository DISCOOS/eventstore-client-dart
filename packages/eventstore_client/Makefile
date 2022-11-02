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

LATEST := $(shell curl -u $USER:$GITHUB_TOKEN -s https://api.github.com/repos/eventstore/eventstore/releases/latest \
		| grep browser_download_url \
		| grep ubuntu-20.04.deb \
		| cut -d '-' -f 2 \
		| cut -d '/' -f 1 \
		| cut -d 'v' -f 2 | xargs)

CURRENT := $(shell cat lib/src/core/constants.dart | grep  -m 1 'static const LATEST =' \
		| cut -d '=' -f 2 \
		| xargs \
		| cut -d ';' -f 1  | xargs)

.PHONY: \
	status certs protos models test doc release

.SILENT: \
	status certs protos models test doc release

status:
ifeq ($(LATEST), $(CURRENT))
	echo "Check EventStoreDB OSS version >> OK."
else
	echo "Check EventStoreDB OSS version >> Update ApiVersions.LATEST = '${CURRENT}' in 'lib/src/core/constants.dart' to '${LATEST}'"
	echo "LATEST: '${LATEST}'"
	echo "CURRENT: '${CURRENT}'"
endif

certs:
	esdbtcli certs --out test

protos:
	echo "Downloading protobuf definitions from google..."
	curl https://raw.githubusercontent.com/protocolbuffers/protobuf/master/src/google/protobuf/any.proto > protos/google/any.proto
	curl https://raw.githubusercontent.com/protocolbuffers/protobuf/master/src/google/protobuf/empty.proto > protos/google/empty.proto
	curl https://raw.githubusercontent.com/protocolbuffers/protobuf/master/src/google/protobuf/struct.proto > protos/google/struct.proto
	curl https://raw.githubusercontent.com/protocolbuffers/protobuf/master/src/google/protobuf/timestamp.proto > protos/google/timestamp.proto
	echo "Downloading protobuf definitions from eventstore..."
	curl https://codeload.github.com/eventstore/eventstore/tar.gz/master | tar -xz -C protos --strip=4 EventStore-master/src/Protos/Grpc
	echo "Replacing imports..."
	@for f in $(shell ls protos/*.proto); do echo $${f}; sed -i "" "s/google\/protobuf/google/g" $${f}; done

models:
	echo "Generating models..."; \
	mkdir  -p "lib/src/generated"
	protoc --dart_out="generate_kythe_info,grpc:lib/src/generated" \
		--proto_path protos \
		google/any.proto \
		google/empty.proto \
		google/struct.proto \
		google/timestamp.proto \
		google/duration.proto \
		cluster.proto \
		code.proto \
		gossip.proto \
		monitoring.proto \
		operations.proto \
		persistent.proto \
		projections.proto \
		serverfeatures.proto \
		shared.proto \
		status.proto \
		streams.proto \
		users.proto
	dart format lib/src/generated
	echo "[✓] Generating models complete."

test:
	if [ ! -d test/certs ]; then esdbtcli certs --out test; fi
	if command -v colima &> /dev/null; then colima start; fi
	dart test -j 1

doc:
	rm -rf doc
	dartdoc
	echo "Starting server at http://localhost:8080"
	dhttpd --path doc/api

verify:
	echo 'Verify release to pub.dev...'
	dart pub publish --dry-run

release:
	echo 'Release to pub.dev...'
	pub_release --no-multi --no-test
