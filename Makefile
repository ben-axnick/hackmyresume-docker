PROJECT = bentheax/hackmyresume
VERSION = 0.2
IMAGE = $(PROJECT):$(VERSION)
LATEST = $(PROJECT):latest

THEME ?= modern
FILES ?= in/resume.json

.PHONY: build
build:
	docker build -t $(IMAGE) .
	docker tag $(IMAGE) $(LATEST)

.PHONY: push
push:
	docker push $(IMAGE)
	docker push $(LATEST)

.PHONY: resume
resume: json-files clean
	docker-compose run hackmyresume BUILD $(FILES) TO out/resume.all -d -t $(THEME)

.PHONY: convert
convert: json-files
	docker-compose run hackmyresume CONVERT $(FILES) $(FILES)

.PHONY: validate
validate: json
	docker-compose run hackmyresume VALIDATE $(FILES)

.PHONY: json-files
json-files: $(FILES)

in/%.json: in/%.yml
	ruby convert.rb $< > $@

.PHONY: clean
clean:
	sudo rm -Rf out
