section .data
    format db 'arg %d: %s', 0x0a, 0

section .text
	global main

extern printf

main:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    xor ecx, ecx

    print_args_loop:
    mov edx, [ebx + 4 * ecx]
    cmp ecx, eax
    jge print_args_end

    ;for Call Convention (saving registers before calling)
    push eax
    push ebx
    push ecx

    ;intialize for printf argument
    push edx
    push ecx
    push format
    call printf
    add esp, 12

    ;poping saved registers from the stack after calling
    pop ecx
    pop ebx
    pop eax

    inc ecx
    jmp print_args_loop

    print_args_end:
    mov eax, 0

    mov esp, ebp
    pop ebp
    ret
