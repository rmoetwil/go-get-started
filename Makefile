
.PHONY: all clean test bench build run cover doc dep

all: clean test build

clean:
	go clean
	rm -f ./bin/helloworld

test:
	go test -v ./...

bench:
	go test -bench -v ./...

build:
	go build -o ./bin/helloworld ./cmd/helloworld

run:
	go run ./cmd/helloworld

cover:
	go test -v ./... -coverprofile=coverprofile.out
	go tool cover -html=coverprofile.out

doc:
	godoc -http=:9000

dep:
	go mod download