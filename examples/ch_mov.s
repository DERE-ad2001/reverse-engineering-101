# Challenge — MOV (different from the slide demo)
# gcc -m32 -g -no-pie -o ch_mov ch_mov.s
#
# At check: what is eax? what is ecx?

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp
    sub     esp, 16

    mov     eax, 0x2A
    mov     ebx, 0x7
    mov     eax, ebx
    mov     dword ptr [ebp-4], 0x55
    mov     ecx, dword ptr [ebp-4]
    mov     eax, ecx
check:
    leave
    ret
