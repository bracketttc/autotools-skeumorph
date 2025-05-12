# This Makefile is an autotools-skeumorphic wrapper around a CMake project.

.PHONY: all dist-clean

SOURCE_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
BUILD_DIR := $(SOURCE_DIR)/build

all: $(BUILD_DIR)/CMakeCache.txt
	@cmake --build "$(BUILD_DIR)"

dist-clean:
	@rm -rf "$(BUILD_DIR)"

# Gracefully handle not being in a CMake project.
CMakeLists.txt:
	@echo "No CMakeLists.txt, to use this file and the accompanying configure script,"
	@echo "copy them into the root of your CMake project source tree."
	@echo
	@exit 1

# Configure the project
build/CMakeFiles: CMakeLists.txt
	@$(SOURCE_DIR)/configure

# Pass any unrecognized targets on to the generated build system
%: build/CMakeFiles
	@cmake --build "$(BUILD_DIR)" --target "$@"
