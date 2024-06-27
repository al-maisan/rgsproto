.PHONY: all proto

version := $(shell git rev-parse --short=12 HEAD)
timestamp := $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: proto

proto:
	rm -rf api
	protoc --go_out=. --go-grpc_out=. proto/api.proto
	mv github.com/al-maisan/rgsproto/api .
	rm -rf github.com

