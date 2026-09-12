# Challenge — arithmetic (different from the slide demo)
# gcc -m32 -g -no-pie -o ch_arith ch_arith.s
#
# At check: what is eax?

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp

    mov     eax, 20
    add     eax, 7
    sub     eax, 4
    inc     eax
    inc     eax
    dec     eax
    mov     ebx, 3
    add     eax, ebx
check:
    pop     ebp
    ret
