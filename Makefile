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
	test models

.SILENT: \
	test models

test:
	dart test -j 1

models:
	echo "Generating models..."; \
	mkdir  -p "lib/src/generated"
	protoc --dart_out="generate_kythe_info,grpc:lib/src/generated" \
		--proto_path protos \
		cluster.proto \
		gossip.proto \
		monitoring.proto \
		operations.proto \
		persistent.proto \
		projections.proto \
		shared.proto \
		streams.proto \
		users.proto \
		struct.proto
	dartfmt -w lib/src/generated
	echo "[✓] Generating models complete."
