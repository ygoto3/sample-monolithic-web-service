#!/bin/sh

protoc \
  -I ../../protos \
  --elm_out=../src \
  ../../protos/api.proto

