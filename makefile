
CC=i686-w64-mingw32-gcc
WINDRES=i686-w64-mingw32-windres

DLL=ExtIO_RTLTCP.dll

${DLL}: extio_rtltcp.o resource.o
	${CC} -o ${DLL} extio_rtltcp.o resource.o -shared -lws2_32 -Wl,--kill-at

resource.o: resource.rc
	${WINDRES} -o resource.o resource.rc

clean:
	rm -f *~ *.o ${DLL}
	
dump:
	i686-w64-mingw32-objdump -p ${DLL}


# i686-w64-mingw32-windres -o mainres.o main.rc
# i686-w64-mingw32-gcc -o main.exe main.c mainres.o
