# 0.3.0
- Added support for TLS setup with configurable certification verification
- Use implemented LTS version until tests are upgraded
- Fixed null validation error
- Added test failure reasons
- Added support for grpc web
- Updated LTS and LATEST version contants
- Applied dart fix on analysis results
- Upgraded major versions of dart packages
- Added test certs to false_secrets
- Fixed formatting errors
- Fixed linting errors
- Upgraded mono_pkg config
- Removed unnecessary overrides in BatchWriteResult

# 0.2.2
- Added getters for checking WriteResult statuses
- Added static construction methods for EventData streams
- Added local connection string to examples
- Updated badges in READMEs
- Fixed broken exclusion of generated code from test coverage

# 0.2.1
- Added support for api version verification

# 0.2.0
- Implemented persistent subscriptions api 
- Refactored all clients into using mixins 
- Refactored stream read method names (breaking) 
- Added EventStoreDB client API version validation (feature support) 
- Refactored event and dropped callbacks (breaking)

# 0.1.0
- Added badges to README
- Added coverage to github action
- Added github action for tests and coverage
- Added support for Projections management API
- Implemented projections management API
- Added missing error handling in gossip client
- Fixed bug in conversion between ticks and DateTime

# 0.0.3
- Added documentation with proper package layout

# 0.0.2

- Added more examples
- Fixed pub scores

# 0.0.1

- Supports EventStore 20.x Streams Client Api
