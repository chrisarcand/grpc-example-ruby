# Simple gRPC Echo Service in Ruby

This is a basic example of a gRPC service implemented in Ruby. The service simply echoes back any message sent by the client.

## Prerequisites

Before running this example, you need to install the following gems:

```bash
gem install grpc
gem install grpc-tools
```

## Generate Ruby Code from the Protobuf Definition

Run the following command to generate the Ruby code from the `.proto` file:

```bash
./generate_proto.sh
```

This will create two files:
- `echo_pb.rb` - Contains the request and response message classes
- `echo_services_pb.rb` - Contains the service stub and service classes

## Running the Example

1. Start the server:

```bash
ruby server.rb
```

2. In another terminal, run the client:

```bash
ruby client.rb "Your message here"
```

If you don't provide a message, it will use the default message "Hello, gRPC!".

## How It Works

1. The client creates a stub (client-side representation of the server).
2. The client calls the `echo` method on the stub, passing a message.
3. The server receives the request, extracts the message, and sends it back in the response.
4. The client receives the response and displays the message.

This demonstrates the basic workflow of a gRPC service: defining a service with Protocol Buffers, generating client and server code, and implementing the service methods.
