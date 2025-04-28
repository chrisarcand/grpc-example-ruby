#!/usr/bin/env ruby

require 'grpc'
require_relative 'echo_services_pb'

def main
  # Create a stub for the EchoService
  stub = Echo::EchoService::Stub.new('localhost:50051', :this_channel_is_insecure)

  # Get message from command line or use default
  message = ARGV[0] || "Hello, gRPC!"

  puts "Sending message: #{message}"

  # Call the Echo method
  response = stub.echo(Echo::EchoRequest.new(message: message))

  puts "Server responded with: #{response.message}"
end

main
