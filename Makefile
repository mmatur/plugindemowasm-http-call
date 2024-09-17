.PHONY: test checks build

default: test checks build gotip

gopath:
	mkdir $(CURDIR)/gopath

gopath/bin/gotip: gopath
	GOPATH=$(CURDIR)/gopath go install golang.org/dl/gotip@latest

gotip: gopath/bin/gotip
	$(CURDIR)/gopath/bin/gotip download

test: gotip
	GOOS=wasip1 GOARCH=wasm $(CURDIR)/gopath/bin/gotip test -v -cover ./...

build: gotip
	GOOS=wasip1 GOARCH=wasm CGO_ENABLED=0 $(CURDIR)/gopath/bin/gotip build -buildmode=c-shared -trimpath -o plugin.wasm ./demo.go

checks:
	GOOS=wasip1 GOARCH=wasm golangci-lint run
