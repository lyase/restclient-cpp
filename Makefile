#
# Makefile for restclient-cpp
#

# set compiler and linker
CC = g++
LD = g++

# binaries and folders
BINDIR = bin
TEST = $(BINDIR)/test

# set library and include paths
INCLUDE =  -Iinclude -I/usr/local/include
TESTLIBS = -lgtest -lcurl
LIBS = -lcurl

# set compiler and linker flags
CCFLAGS = -O3 -W -Wall
LDFLAGS = -W -Wall -L/usr/local/lib

# source files
SRCS =  source/restclient.cpp
SRCS += $(wildcard test/test*.cpp)

# dependencies
# object files
OBJS = $(SRCS:.cpp=.o)

# linking rule
$(TEST): $(OBJS) $(BINDIR)
	$(LD) $(LDFLAGS) $(OBJS) -o $(TEST) $(TESTLIBS)

# compile rule
.cpp.o:
	$(CC) $(CCFLAGS) $(INCLUDE) -c $<  -o $@


$(BINDIR):
	@mkdir -p $(BINDIR)

# tasks
.PHONY:  clean all

clean:
	@rm -rf tests/*.o
	@rm -rf source/*.o
	@rm -rf bin

all: $(TEST)
	@echo Running tests...
	@./bin/test