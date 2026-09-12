/*
 * Reverse Engineering 101 — Ghidra flow demo (32-bit)
 *
 * This is the C you show first. Then compile it. Then open the ELF in Ghidra.
 *
 *   source        this file
 *   compiler      gcc -m32 -g -no-pie -o 08_ghidra_flow 08_ghidra_flow.c
 *   bytes         look with:  objdump -d -M intel 08_ghidra_flow
 *   disassembler  Ghidra Listing  (or objdump)
 *   decompiler    Ghidra Decompile window
 *
 * Run:
 *   ./08_ghidra_flow
 *   ./08_ghidra_flow nope
 *   ./08_ghidra_flow RE101
 */

#include <stdio.h>
#include <string.h>

#define SECRET "RE101"

int add_one(int n)
{
    return n + 1;
}

int is_ok(const char *word)
{
    if (strcmp(word, SECRET) == 0)
        return 1;
    return 0;
}

int main(int argc, char **argv)
{
    int n;

    puts("flow demo");
    if (argc < 2) {
        puts("usage: ./08_ghidra_flow <word>");
        return 1;
    }

    n = add_one(41);
    if (is_ok(argv[1]))
        printf("yes %d\n", n);
    else
        puts("no");

    return 0;
}
