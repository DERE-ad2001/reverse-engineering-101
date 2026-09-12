# Challenge — xor / ZF (different from the slide demo)
# gcc -m32 -g -no-pie -o ch_xor ch_xor.s
#
# At check: eax? ZF set?  (print $eflags & 0x40)

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp

    mov     eax, 0x3C
    xor     eax, 0x12
    mov     ebx, 0xAA
    xor     ebx, 0xAA
    xor     eax, ebx
check:
    pop     ebp
    ret
