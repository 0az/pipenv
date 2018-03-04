#!/usr/bin/env bash

PYPI_VENDOR_DIR="$(pwd)/tests/pypi/"
export PYPI_VENDOR_DIR


if [[ ! "$TEST_SUITE" ]]; then
	TEST_SUITE = ""
fi

RAM_DISK="/media/ramdisk"
export RAM_DISK

if [[ "$CI" ]]; then
	echo "Creating RAM disk…"
	sudo mkdir -p "$RAM_DISK"
	sudo mount -t tmpfs -o size=2048M tmpfs "$RAM_DISK"
fi


pytest -n 8 tests -m "$TEST_SUITE"