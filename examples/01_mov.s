# Demo for slides — MOV
# gcc -m32 -g -no-pie -o 01_mov 01_mov.s

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp
    sub     esp, 16

    mov     eax, 1
    mov     ebx, 0x41
    mov     eax, ebx
    mov     dword ptr [ebp-4], eax
    mov     ecx, dword ptr [ebp-4]

    mov     eax, 0
    leave
    ret
