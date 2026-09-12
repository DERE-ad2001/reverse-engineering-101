# Challenge — cmp / je / jne (different from the slide demo)
# gcc -m32 -g -no-pie -o ch_jmp ch_jmp.s
#
# At check: what is eax? which path ran?

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp

    mov     eax, 8
    mov     ebx, 3
    cmp     eax, ebx
    je      equal
    jne     not_equal

equal:
    mov     eax, 100
    jmp     check

not_equal:
    mov     eax, 200

check:
    pop     ebp
    ret
