.PHONY: clean build

build:
	python setup.py build_ext --inplace

clean:
	find cyclone -name "*.so" -o -name "*.cpp" -o -name "*.html" | xargs rm -f

clean_build:
	rm -rf build

clean_lib:
	rm -rf lib

