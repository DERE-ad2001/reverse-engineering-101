/*
 * Reverse Engineering 101 — hex-edit a string
 *
 * Build:
 *   gcc -m32 -g -no-pie -o 07_strings 07_strings.c
 *
 * Run:
 *   ./07_strings
 *
 * Edit the text in the binary (same length, keep the \0):
 *   hexedit 07_strings
 *   Ctrl+S    search   HELLO_FROM_RE101
 *   Tab       ASCII side
 *   type      BYE___FROM_RE101
 *   F2        save
 *   Ctrl+X    save and exit
 *   ./07_strings
 *
 * GUI:
 *   sudo apt install bless
 *   bless 07_strings
 */

#include <stdio.h>

int main(void)
{
    puts("HELLO_FROM_RE101");
    return 0;
}
