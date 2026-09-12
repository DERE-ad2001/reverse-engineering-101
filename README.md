# Reverse Engineering 101

Class materials for a Linux x32 intro to reverse engineering.

Presented by **Ajin Deepak** (AntiBot Engineer @ NielsenIQ).

## What's in here

| path | what |
|---|---|
| `Reverse Engineering 101.pptx` | the deck |
| `INSTRUCTIONS.md` | install, GDB/GEF, Ghidra, hexedit, challenges |
| `examples/` | demos + challenge sources + Makefile |
| `examples/README.md` | short build / challenge sheet |
| `CHALLENGE_ANSWERS.md` | instructor answers only |
| `build_pptx.py` | rebuilds the deck (keep in sync with PPT edits) |
| `assets/` | register diagram used in the slides |

## Quick start

```bash
# Ubuntu / Debian / WSL
sudo apt update
sudo apt install -y build-essential gcc-multilib gdb python3 hexedit bless binutils
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

cd examples
make
```

Full command sheet: [INSTRUCTIONS.md](INSTRUCTIONS.md)

## Session shape

~2 hours if you mostly demo. ~3 hours if people install tools and run the challenges + both crackmes.

32-bit ELF (`gcc -m32`). GDB + GEF for debugging. Ghidra for disasm/decompile. hexedit or Bless for string edits.
