# Demo for slides — cmp/jmp
# gcc -m32 -g -no-pie -o 04_cmp_jmp 04_cmp_jmp.s

    .intel_syntax noprefix
    .text
    .globl main
main:
    push    ebp
    mov     ebp, esp

    mov     eax, 5
    mov     ebx, 5
    cmp     eax, ebx
    je      same
    jmp     different

same:
    mov     eax, 1
    jmp     done

different:
    mov     eax, 2

done:
    mov     ecx, 9
    cmp     ecx, 3
    jne     not_equal
    mov     eax, 0

not_equal:
    pop     ebp
    ret
