# [Assembly Tutorial](https://asmtutor.com/)

This is my attempt at learning x86\_64 linux assembly using NASM. The first folders will be dedicated to the lessons on the tutorial, and when I'll finish them I'll tweak them a bit, and after I'll (hopefully) finish the course, I'll maybe add some more things I learn into here.

## Run file [file].asm

```shell
nasm -f elf64 -o [file].o [file].asm
ld -o [file] [file.o]
```
