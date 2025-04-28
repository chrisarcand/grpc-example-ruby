#!/usr/bin/env ruby

require 'grpc'
require_relative 'echo_services_pb'

# Implementation of the EchoService
class EchoServer < Echo::EchoService::Service
  # Implementation of the Echo rpc method
  def echo(request, _call)
    puts "Received message: #{request.message}"
    # Simply return the same message
    Echo::EchoResponse.new(message: request.message)
  end
end

# Create a gRPC server
def main
  port = '50051'
  server = GRPC::RpcServer.new
  server.add_http2_port("0.0.0.0:#{port}", :this_port_is_insecure)
  server.handle(EchoServer.new)

  puts "Starting server on port #{port}..."
  server.run_till_terminated
end

main
