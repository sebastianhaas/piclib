CC=gcc
TARGET=piclib.a
CFLAGS= -Wall -pedantic -std=c99
CLEANEXTS   = o a

# Default target
.PHONY: all
all: $(TARGET) tests

$(TARGET): piclib.o
	ar ru $@ $^
	ranlib $@

.PHONY: install
install:
	cp -p $(TARGET) /usr/local/lib
	cp -p piclib.h /usr/local/include

.PHONY: tests
tests:
	$(CC) $(CFLAGS) piclibtest.c -o piclibtest -lcmocka -l:piclib.a

.PHONY: clean
clean:
	for file in $(CLEANEXTS); do rm -f *.$$file; done
	rm -f piclibtest

piclib.o: piclib.c
	$(CC) $(CFLAGS) -c piclib.c -o piclib.o