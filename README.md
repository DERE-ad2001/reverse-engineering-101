# Reverse Engineering 101

For null kochi X SPARC collaboration workshop

- [Slides](Reverse%20Engineering%20101.pptx)
- [Instructions](INSTRUCTIONS.md)
- [Labs](examples/)

## Quick start

```bash
# Ubuntu / Debian / WSL
sudo apt update
sudo apt install -y build-essential gcc-multilib g++-multilib libc6-dev-i386 gdb python3 hexedit bless binutils
sudo apt install openjdk-21-jdk -y
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

cd examples
make
```
