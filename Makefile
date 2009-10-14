CC = gcc
EXT = -std=gnu99
CFLAGS = -g -Wall # -O2
INCLUDES = -I. -I/usr/local/include

%.o: %.c
	$(CC) -c $(CFLAGS) $(EXT) $(INCLUDES) $< -o $@

TARGETS = trace-cmd

all: $(TARGETS)

parse-events.o::	parse-events.h
trace-read.o::		parse-events.h
trace-cmd.o::		parse-events.h

trace-cmd: trace-cmd.o trace-read.o parse-events.o
	$(CC) $^ -o $@

clean:
	$(RM) *.o *~ $(TARGETS)
