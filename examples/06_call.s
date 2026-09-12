# Demo for slides — call/ret
# gcc -m32 -g -no-pie -o 06_call 06_call.s

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp

    push    41
    call    add_one
    add     esp, 4

    pop     ebp
    ret

add_one:
    push    ebp
    mov     ebp, esp
    mov     eax, dword ptr [ebp+8]
    inc     eax
    pop     ebp
    ret
