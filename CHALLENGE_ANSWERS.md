# Challenge answers (instructor only)

Demos (`01_mov` … `06_call`) are for teaching on the slides.
Challenges (`ch_*`) are separate programs with different values.

| binary | label | answer |
|---|---|---|
| `ch_mov` | `check` | eax=`0x55`, ecx=`0x55` |
| `ch_arith` | `check` | eax=`28` |
| `ch_xor` | `check` | eax=`0x2e`, ZF clear (`eflags & 0x40` == 0) |
| `ch_jmp` | `check` | eax=`200` (not_equal path; 8 != 3) |
| `ch_stack` | `before_pop` | `[esp]=0x1234`, `[esp+4]=0xABCD` |
| `ch_stack` | `check` | ecx=`0x1234`, edx=`0xABCD` |
| `ch_call` | `check` | eax=`51` (17*3) |

```
print ($eflags & 0x40)
```
Non-zero => ZF set.
