# Demo for slides — push/pop
# gcc -m32 -g -no-pie -o 05_stack 05_stack.s

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp

    mov     eax, 0x1111
    mov     ebx, 0x2222
    push    eax
    push    ebx
    pop     ecx
    pop     edx

    mov     eax, 0
    pop     ebp
    ret
