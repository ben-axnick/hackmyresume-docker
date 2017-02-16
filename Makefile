PROJECT = bentheax/hackmyresume
VERSION = 0.1
IMAGE = $(PROJECT):$(VERSION)
LATEST = $(PROJECT):latest

.PHONY: build
build:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(LATEST)

.PHONY: push
push:
	docker push $(IMAGE)
	docker push $(LATEST)
