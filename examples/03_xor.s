# Demo for slides — xor
# gcc -m32 -g -no-pie -o 03_xor 03_xor.s

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp

    mov     eax, 0x55
    xor     eax, 0x55
    mov     ebx, 7
    xor     ebx, ebx
    mov     eax, 0xF0
    xor     eax, 0x0F

    pop     ebp
    ret
