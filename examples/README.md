# RE 101 example programs

Demos for slides + separate challenge binaries. Full sheet: [../INSTRUCTIONS.md](../INSTRUCTIONS.md)

## Build

```bash
make              # demos + challenges
make demos
make challenges
```

## Demos (on the slides)

| file | topic |
|---|---|
| `01_mov` | mov |
| `02_arith` | add/sub/inc/dec |
| `03_xor` | xor + ZF |
| `04_cmp_jmp` | cmp/jmp/je/jne |
| `05_stack` | push/pop |
| `06_call` | call/ret |
| `07_strings` | hexedit |
| `08_ghidra_flow` | Ghidra demo |

## Challenges (different programs — use gdb)

| file | ask at `check` |
|---|---|
| `ch_mov` | eax? ecx? |
| `ch_arith` | eax? |
| `ch_xor` | eax? ZF? |
| `ch_jmp` | eax? which path? |
| `ch_stack` | stack / ecx / edx |
| `ch_call` | eax after call? |

```
gdb ./ch_mov
break check
run
print /x $eax
```
