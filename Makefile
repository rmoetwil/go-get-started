# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOTOOL=$(GOCMD) tool
GOGET=$(GOCMD) get
BINARY_NAME=go-get-started

all: clean test build

clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)

test:
	$(GOTEST) -v ./...

bench:
	$(GOTEST) -bench .

build:
	$(GOBUILD) -o $(BINARY_NAME) -v

run:
	$(GOBUILD) -o $(BINARY_NAME) -v ./... ./$(BINARY_NAME)

lint:
	gometalinter ./...

cover:
	$(GOTEST) -coverprofile c.out
	$(GOTOOL) cover -html=c.out

doc:
	godoc -http=:9000
