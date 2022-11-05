#### 1. Install `esdbtcli`

```bash
dart pub global activate -spath path/to/packages/eventstore_client_test
```

#### 2. Start EventStoreDB locally

```bash
esdbtcli start
```

You can specify which tag you want to start with `--tag` argument. 
EventStoreDB version `v21.10.7` is started with 
`esdbtcli start --tag 21.10.7-buster-slim`

#### 3. Start bridge between native and grpc-web using [Envoy gRPC-Web](https://www.envoyproxy.io/docs/envoy/v1.24.0/configuration/http/http_filters/grpc_web_filter.html?highlight=grpcweb).

```bash
docker build -t envoy:v1 . && docker run --rm --name my-grpc-web-bridge -p 5001:5001 -p8081:8081 envoy:v1 | jq -Sr
```
The command `jq -Sr` sorts keys and pretty-prints json output from access logs written to stdout. 
