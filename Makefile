#
# Makefile that builds btest and other helper programs for the CS:APP data lab
# 
TEAM = $(USER)
CC = gcc
CFLAGS = -O -Wall -m32
LIBS = -lm

# Where are of the bits.c solution for the lab should be copied to when 
# it is handed in.
HANDINDIR= ./handin

all: btest fshow ishow

btest: btest.c bits.c decl.c tests.c btest.h bits.h
	$(CC) $(CFLAGS) $(LIBS) -o btest bits.c btest.c decl.c tests.c

fshow: fshow.c
	$(CC) $(CFLAGS) -o fshow fshow.c

ishow: ishow.c
	$(CC) $(CFLAGS) -o ishow ishow.c

# Forces a recompile. Used by the driver program. 
btestexplicit:
	$(CC) $(CFLAGS) $(LIBS) -o btest bits.c btest.c decl.c tests.c 

# Use this rule to change the file name for handin ("make handin")
handin:
	mkdir $(HANDINDIR)
	cp -p bits.c $(HANDINDIR)/$(TEAM)-bits.c

clean:
	rm -f *.o btest fshow ishow *~


