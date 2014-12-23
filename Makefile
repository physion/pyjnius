.PHONY: build_ext tests

class_version = 1.6
javac = javac -source $(class_version) -target $(class_version)

build_ext:
	$(javac) jnius/src/org/jnius/NativeInvocationHandler.java
	python setup.py build_ext --inplace -f -g

html:
	$(MAKE) -C docs html

compile-tests: build_ext
	cd tests && $(javac) org/jnius/HelloWorld.java
	cd tests && $(javac) org/jnius/BasicsTest.java
	cd tests && $(javac) org/jnius/MultipleMethods.java
	cd tests && $(javac) org/jnius/SimpleEnum.java
	cd tests && $(javac) org/jnius/InterfaceWithPublicEnum.java
	cd tests && $(javac) org/jnius/ClassArgument.java
	cd tests && $(javac) org/jnius/SimpleIterable.java

tests: compile-tests
	cd tests && env PYTHONPATH=..:$(PYTHONPATH) nosetests -v

clean:
	rm -rf build/
	rm -f jnius/config.pxi
	rm -f jnius/jnius.c
	rm -f jnius/*.so
	find . -iname '*.pyc' -delete
	find . -iname '*.class' -delete
