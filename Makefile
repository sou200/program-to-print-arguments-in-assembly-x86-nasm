name = Prog
src = code.asm
obj = code.o

all:$(name)

$(name): $(obj)
	gcc -m32 $? -o $(name)

%.o : %.asm
	nasm -f elf32 $< -o $@

clean:
	rm -f $(obj) 2>/dev/null

fclean: clean
	rm -f $(name) 2>/dev/null

re: fclean all