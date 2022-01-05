.POSIX:

PREFIX = /usr/local
CC = gcc
CFLAGS   = -march=native -O3 -flto -pipe -fno-plt
LDFLAGS  = $(CFLAGS) -Wl,-O3,--sort-common,--as-needed,-z,now


dwmblocks: dwmblocks.o
	$(CC) dwmblocks.o -lX11 -o dwmblocks $(LDFLAGS)
dwmblocks.o: dwmblocks.c config.h
	$(CC) -c dwmblocks.c $(CFLAGS)
clean:
	rm -f *.o *.gch dwmblocks
install: dwmblocks
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dwmblocks $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dwmblocks
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dwmblocks

.PHONY: clean install uninstall
