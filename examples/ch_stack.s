# Challenge — push / pop (different from the slide demo)
# gcc -m32 -g -no-pie -o ch_stack ch_stack.s
#
# At check: ecx? edx?  (and optionally x/2xw $esp before the pops)

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp

    mov     eax, 0xABCD
    mov     ebx, 0x1234
    push    eax
    push    ebx
before_pop:
    pop     ecx
    pop     edx
check:
    mov     eax, 0
    pop     ebp
    ret
