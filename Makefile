executable = exe
f_file = ativacoes
s_file = estado

${executable}: main.o ${s_file}.o ${f_file}.o
	gcc main.o ${s_file}.o ${f_file}.o -o ${executable}

main.o: main.c
	gcc -g -Wall -c main.c -o main.o

${s_file}.o: ${s_file}.s
	gcc -g -Wall -c ${s_file}.s -o ${s_file}.o

${f_file}.o: ${f_file}.s
	gcc -g -Wall -c ${f_file}.s -o ${f_file}.o

run: ${executable}
	./${executable}

clean:
	rm *.o ${executable}
