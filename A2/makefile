all: recursive non-recursive
	

recursive: queensr.adb
	gnatmake queensr.adb

non-recursive: queensnr.adb
	gnatmake queensnr.adb

clean:
	rm queensr
	rm queensr.ali 
	rm queensr.o
	rm queensnr 
	rm queensnr.ali
	rm queensnr.o
	rm stack.o
	rm stack.ali
