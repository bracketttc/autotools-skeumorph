# This Makefile is an autotools-skeumorphic wrapper around a CMake project.

.PHONY: all dist-clean

SOURCE_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
BUILD_DIR := $(SOURCE_DIR)/build
CONFIGURED := $(BUILD_DIR)/CMakeFiles

all: $(CONFIGURED)
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
$(CONFIGURED): CMakeLists.txt
	@$(SOURCE_DIR)/configure

# Pass any unrecognized targets on to the generated build system
%: $(CONFIGURED)
	@cmake --build "$(BUILD_DIR)" --target "$@"
