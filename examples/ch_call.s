# Challenge — call / ret (different from the slide demo)
# gcc -m32 -g -no-pie -o ch_call ch_call.s
#
# At check (after call returns): what is eax?

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp

    push    17
    call    triple
check:
    add     esp, 4

    pop     ebp
    ret

triple:
    push    ebp
    mov     ebp, esp
    mov     eax, dword ptr [ebp+8]
    add     eax, eax
    add     eax, dword ptr [ebp+8]
    pop     ebp
    ret
