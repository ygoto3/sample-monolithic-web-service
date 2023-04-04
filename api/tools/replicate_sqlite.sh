#!/bin/sh

export LITESTREAM_ACCESS_KEY_ID=localid
export LITESTREAM_SECRET_ACCESS_KEY=localpassword

litestream replicate ../db/development.sqlite3 s3://sqlite.localhost:9000/development.sqlite3
