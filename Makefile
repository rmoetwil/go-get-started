
# TODO Make bench, test, cover

.PHONY: all clean test bench build run cover doc dep

all: clean test build

clean:
	go clean
	rm -f ./bin/helloworld

test:
	go test -v ./...

bench:
	go test -bench ./cmd/helloworld

build:
	go build -o ./bin/helloworld ./cmd/helloworld

run:
	go run ./cmd/helloworld

cover:
	go test -coverprofile=c.out
	go tool cover -html=c.out

doc:
	godoc -http=:9000

dep:
	go mod download