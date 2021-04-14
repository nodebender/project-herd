# Get current directory
current_dir := $(shell pwd)

# Namespace
ns = github.com/nodebender/project-herd

# Get current commit hash
commit_hash := $(shell git rev-parse --short=7 HEAD)

# Targets
.PHONY: test

all: test clean build

test: 
	@echo "Running all tests"
	go clean -testcache
	# go test -v $(namespace)/...

build:
	@echo "Building binaries"
	mkdir $(current_dir)/build
	go build -o $(current_dir)/build/herd/app cmd/herd/main.go

clean:
	@echo "Cleaning up..."
	rm -rf $(current_dir)/build
