CC=gcc
TARGET=piclib.a
CFLAGS= -Wall -pedantic -std=c99
CLEANEXTS   = o a 
INSTALLDIR  = ./bin

# Default target
.PHONY: all
all: $(TARGET) tests

$(TARGET): piclib.o
	ar ru $@ $^
	ranlib $@

.PHONY: install
install:
	mkdir -p $(INSTALLDIR)
	cp -p $(TARGET) $(INSTALLDIR)

.PHONY: tests
tests:
	$(CC) $(CFLAGS) piclibtest.c -o piclibtest -lcmocka -l:piclib.a


.PHONY: clean
clean:
	for file in $(CLEANEXTS); do rm -f *.$$file; done
	rm -f piclibtest
	rm -rf bin

piclib.o: piclib.c
	$(CC) $(CFLAGS) -c piclib.c -o piclib.o