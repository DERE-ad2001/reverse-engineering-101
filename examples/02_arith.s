# Demo for slides — add/sub/inc/dec
# gcc -m32 -g -no-pie -o 02_arith 02_arith.s

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp

    mov     eax, 10
    add     eax, 5
    sub     eax, 3
    inc     eax
    dec     eax
    mov     ebx, 4
    add     eax, ebx

    pop     ebp
    ret
