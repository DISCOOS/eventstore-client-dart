## Flutter Echo App Demo with EventStore Client
This example demonstrates how EventStore Client can be used in Flutter. 
Although this is not the typical use case, it serves as en example of what is 
possible to do. EventStore Client runs on all Flutter platforms, only limited
by what the [Grpc-Web protocol](https://github.com/grpc/grpc/blob/master/doc/PROTOCOL-WEB.md#protocol-differences-vs-grpc-over-http2) 
supports. The following EventStore commands are not supported in the browser as 
a consequence of these limitations:

```protobuf
// persistent.proto
service PersistentSubscriptions {
  // Client streaming of requests is not supported by grpc-web
  rpc Read (stream ReadReq) returns (stream ReadResp);
}

// streams.proto
service Streams {
  // Client streaming of requests is not supported by grpc-web
  rpc Append (stream AppendReq) returns (AppendResp);
  // Client streaming of requests is not supported by grpc-web
  rpc BatchAppend (stream BatchAppendReq) returns (stream BatchAppendResp);
}
```

As shown above, this essentially mean that only Stream read-operations are 
possible in the browser.