#!/bin/bash

# Generate Ruby code from the .proto file
grpc_tools_ruby_protoc --ruby_out=. --grpc_out=. echo.proto
