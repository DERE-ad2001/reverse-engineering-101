# Reverse Engineering 101

Linux x32 intro to reverse engineering.

Presented by **Ajin Deepak** (AntiBot Engineer @ NielsenIQ).

- [Slides](Reverse%20Engineering%20101.pptx)
- [Instructions](INSTRUCTIONS.md)
- [Labs](examples/)

## Quick start

```bash
# Ubuntu / Debian / WSL
sudo apt update
sudo apt install -y build-essential gcc-multilib gdb python3 hexedit bless binutils
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

cd examples
make
```
