
.PHONY: build
build:
	docker build -t leejones/video_embed .

.PHONY: clean
clean:
	docker image rm -f leejones/video_embed

.PHONY: test
test:
	docker run -it --rm -v ${PWD}:/app leejones/video_embed rspec
