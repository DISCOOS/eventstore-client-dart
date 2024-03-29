.PHONY: \
	configure generate verify update action

.SILENT: \
	configure generate verify update action

configure:
	dart pub global activate pub_release
	dart pub global activate critical_test
	dart pub global activate dcli
	dart pub global activate dartdoc
	dart pub global activate dhttpd
	dart pub global activate mono_repo
	dart pub global activate pana
	dart pub global activate protoc_plugin
	dart pub global activate eventstore_client_test
	brew install act
	brew install protoc
	brew install watch
	brew install docker
	brew install colima

	colima start

generate:
	echo "Generating github actions for all packages..."
	mono_repo generate

verify:
	echo "Verifying packages..."
	mono_repo check
	mono_repo presubmit
	cd packages/eventstore_client && dart pub publish --dry-run
	cd packages/eventstore_client_test && dart pub publish --dry-run

upgrade:
	echo "Updating packages..."
	mono_repo pub upgrade --major-versions

action:
	echo "Running github actions..."
	act

release:
	echo 'Release all to pub.dev...'
	cd packages/eventstore_client && pub_release multi --no-test
