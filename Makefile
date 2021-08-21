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

CURRENT := $(shell cat test/Harness.dart | grep 'String imageTag =' \
		| cut -d '=' -f 2 \
		| xargs \
		| cut -d '-' -f 1  | xargs)

.PHONY: \
	status certs protos models test

.SILENT: \
	status certs protos models test

status:
	echo "Check EventStoreDB OSS version..."
	echo "LATEST: '${LATEST}'"
	echo "CURRENT: '${CURRENT}'"
ifeq ($(LATEST), $(CURRENT))
	echo ">> OK."
else
	$(error ">> Update imageTag in 'test/Harness.dart' to '${LATEST}-buster-slim'")
endif

certs:
	sh tool/gencert.sh . --secure

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
		cluster.proto \
		code.proto \
		gossip.proto \
		monitoring.proto \
		operations.proto \
		persistent.proto \
		projections.proto \
		shared.proto \
		status.proto \
		streams.proto \
		users.proto
	dartfmt -w lib/src/generated
	echo "[✓] Generating models complete."

test:
	if [ ! -d test/certs ]; then . tool/gencert.sh test; fi
	dart test -j 1

