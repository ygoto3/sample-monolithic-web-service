#!/bin/sh

export AWS_ACCESS_KEY_ID=localid
export AWS_SECRET_ACCESS_KEY=localpassword

aws --endpoint-url http://localhost:9000 \
  s3 mb s3://sqlite --region=ap-northeast-1 

