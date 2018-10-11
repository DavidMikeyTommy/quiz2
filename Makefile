build: college.o collegemain.o course.o
	g++ college.o collegemain.o course.o -o output

output: college.o collegemain.o course.o
	g++ college.o collegemain.o course.o -o output

course.o: course.cc course.h
	g++ -c course.cc
college.o: college.cc course.h college.h node.h
	g++ -c college.cc

collegemain.o: collegemain.cc node.h course.h college.h
	g++ -c collegemain.cc

doczip:
	tar -cvzf tarballname.tar.gz html
clean:
	rm *.o output
	rm *.class
	rm a.out

docs:
	doxygen college.cc college.h collegemain.cc course.cc course.h node.h tarray.h ./Doxyfile

all:
	make docs
	make output
	make clean
	make docszip
