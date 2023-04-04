#!/bin/sh

protoc \
  -I ../../protos \
  --ruby_out=../lib/protos \
  ../../protos/api.proto
