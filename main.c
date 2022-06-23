#include <stdio.h>
#include "asm.h"

unsigned int apartamentos[N] = {0xFAA88DEF,
	0xAD9C8AEA,
	0x9A8DCAEF};

unsigned char estado_sistema[N];  //Array initialized with zeros.

int main(void) {
	//Calls and prints the return value of "estado_global()".
	printf("\nTotal de divisões aquecidas: %d\n\nApartamento:\n", estado_global(apartamentos, estado_sistema, N));
	for(int i = 0; i < N; i++) {
		//Prints "estado_sistema" of every apartement.
		printf("%d. %d\n", i+1, estado_sistema[i]);
	}
	printf("\n");
	return 0;
}
