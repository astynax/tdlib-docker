VERSION := 1.6.0
ARCHIVE := v$(VERSION).tar.gz
SOURCES := td-$(VERSION)
IMAGE   := tdlib-build:latest

.PHONY: build
build: image $(SOURCES)
	docker run \
		--rm \
		-u $$(id -u):$$(id -g) \
		--volume=$$(pwd)/$(SOURCES):/src:rw \
		$(IMAGE)

.PHONY: image
image:
	docker build . --tag=$(IMAGE)

$(SOURCES): $(ARCHIVE)
	tar -xzf $(ARCHIVE)

$(ARCHIVE):
	wget https://github.com/tdlib/td/archive/$(ARCHIVE)

.PHONY: clean
clean:
	@rm $(ARCHIVE) || true
	@rm -r $(SOURCES) || true
