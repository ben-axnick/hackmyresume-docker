PROJECT = bentheax/hackmyresume
VERSION = 0.1
IMAGE = $(PROJECT):$(VERSION)
LATEST = $(PROJECT):latest

THEME ?= modern
FILES ?= in/resume-base.json

.PHONY: build
build:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(LATEST)

.PHONY: push
push:
	docker push $(IMAGE)
	docker push $(LATEST)

.PHONY: resume
resume: $(FILES) clean
	docker-compose run hackmyresume BUILD $(FILES) TO out/resume.all -d -t $(THEME)

.PHONY: validate
validate: in/resume-base.json
	docker-compose run hackmyresume VALIDATE $(FILES)

in/%.json: in/%.yml
	ruby convert.rb $< > $@

.PHONY: clean
clean:
	sudo rm -Rf out
