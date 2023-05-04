.PHONY: clean

# clean all .so, .cpp, and .html files in cyclone folder
clean:
	find cyclone -name "*.so" -o -name "*.cpp" -o -name "*.html" | xargs rm -f
