.PHONY: build
build: /src
	cd /src && \
	mkdir build && \
	cd build && \
	export CXX=g++-5 && \
	export CC=gcc-5 && \
	cmake -DCMAKE_BUILD_TYPE=Release .. && \
	cmake --build .
