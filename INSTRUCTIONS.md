# Reverse Engineering 101 — commands, shortcuts, flow

32-bit Linux ELF. WSL or a VM if you are on Windows.

Parts of this came from an older deck and got updated.

Used in malware analysis, appsec, and exploit development when you have a binary and no source.

Closest C for the instruction slides:

| asm | C |
|---|---|
| `mov eax, ebx` | `eax = ebx;` |
| `mov eax, [ebx]` | `eax = *ebx;` |
| `add eax, 5` | `eax += 5;` |
| `inc eax` / `dec eax` | `eax++;` / `eax--;` |
| `xor eax, eax` | `eax = 0;` |
| `cmp` + `je` / `jne` | `if (eax == ebx)` / `if (eax != ebx)` |
| `jmp` | `goto` |
| `push` / `pop` | save / restore (no single C op; args and locals) |
| `call add_one` | `eax = add_one(41);` |
| `ret` | `return eax;` |

---

## What each tool is doing

| thing | job | example |
|---|---|---|
| **source** | what you typed | `08_ghidra_flow.c` |
| **compiler** | source → bytes + ELF | `gcc -m32 ...` |
| **bytes** | what the CPU runs | `B8 01 00 00 00` |
| **disassembler** | bytes → assembly | objdump, Ghidra **Listing** |
| **decompiler** | assembly → C-like guess | Ghidra **Decompile** |
| **debugger** | run it and stop it | GDB + GEF |

Show this on `08_ghidra_flow`:

1. Open the `.c` so people see `add_one`, `is_ok`, `SECRET`.
2. Compile it.
3. `objdump` / Ghidra Listing = disassembler.
4. Ghidra Decompile = should look a lot like the C.
5. Then GDB if you want to step the same functions.

---

## Install

```bash
sudo apt update
sudo apt install -y build-essential gcc-multilib gdb python3 hexedit bless binutils
bash -c "$(curl -fsSL https://gef.blah.cat/sh)"
```

- `gcc-multilib` — needed for `-m32`
- `gdb` + that GEF line — debugger
- `hexedit` — terminal hex editor
- `bless` — GUI hex editor
- `binutils` — `objdump`, `file`, `strings`

New terminal after GEF. Run `gdb` — you should see the GEF banner.

Ghidra: download from [ghidra-sre.org](https://ghidra-sre.org/), unzip, `./ghidraRun`.

DIE / IDA / Binary Ninja / JADX — optional. JADX is Android, not today's ELF files.

---

## Assemble / build

```bash
cd examples
make
file 01_mov
file 08_ghidra_flow
```

`file` should say **ELF 32-bit**.

One file:

```bash
gcc -m32 -g -no-pie -o 01_mov 01_mov.s
gcc -m32 -g -no-pie -o 07_strings 07_strings.c
gcc -m32 -g -no-pie -o 08_ghidra_flow 08_ghidra_flow.c
```

Clean:

```bash
make clean
```

---

## See the bytes (disassembler on the CLI)

```bash
objdump -d -M intel 08_ghidra_flow
objdump -d -M intel -j .text 08_ghidra_flow | less
strings 08_ghidra_flow
```

`-M intel` = dest on the left (`mov eax, 1`). Same as the slides.

```bash
./08_ghidra_flow
./08_ghidra_flow nope
./08_ghidra_flow RE101
```

---

## Ghidra — open `08_ghidra_flow`

1. File → New Project → Non-Shared → name it `re101`
2. File → Import File → `examples/08_ghidra_flow`
3. Language should be **x86:LE:32**
4. Double-click the file → **Yes** to analyze → leave defaults → Analyze
5. Window → Decompile (if it is not open)
6. Symbol Tree → Functions → `main`, `add_one`, `is_ok`
7. Listing = disassembler. Decompile = guess at the C.

Then import the crackme the same way.

### Ghidra shortcuts

| key | what |
|---|---|
| `G` | Go To (address or name) |
| `L` | Rename label / function / variable |
| `;` | End-of-line comment |
| `D` | Disassemble |
| `C` | Clear code bytes |
| `F` | Create function |
| `Ctrl` + `E` | Decompile window |
| `Ctrl` + `Shift` + `E` | Search program text |
| Search → For Strings | `"flow demo"`, `"RE101"` |
| Window → Function Graph | control-flow graph |
| right-click → References | xrefs (Ghidra is not IDA's `X`) |

---

## GDB + GEF

```bash
gdb ./08_ghidra_flow
```

```
break main
break add_one
break is_ok
run RE101
disassemble
si
ni
info registers
print /x $eax
x/10i $eip
x/8xw $esp
x/s $eax
continue
quit
```

| command | short | what |
|---|---|---|
| `break main` | `b main` | stop at start |
| `run` | `r` | go, optional args after it |
| `run RE101` | | start with an argument |
| `disassemble` | `disas` | code here |
| `stepi` | `si` | one instruction, **into** calls |
| `nexti` | `ni` | one instruction, **over** calls |
| `continue` | `c` | until next break |
| `finish` | | run to end of this function |
| `info registers` | `i r` | all regs |
| `print /x $eax` | `p /x $eax` | one register, hex |
| `x/10i $eip` | | next 10 instructions |
| `x/8xw $esp` | | 8 dwords on the stack |
| `x/s $eax` | | string at that address |
| `info break` | `i b` | list breaks |
| `delete` | `d` | remove breaks |
| `quit` | `q` | leave |

GEF just prints context after each stop. Same commands.

## Instruction challenges (use gdb)

Slide examples: `01_mov` … `06_call` (for teaching).  
Challenges: `ch_mov` … `ch_call` (different numbers — break at `check`).

```bash
make
make challenges
gdb ./ch_mov
```

| challenge | break | ask |
|---|---|---|
| `ch_mov` | `check` | eax? ecx? |
| `ch_arith` | `check` | eax? |
| `ch_xor` | `check` | eax? ZF? (`print ($eflags & 0x40)`) |
| `ch_jmp` | `check` | eax? which path? |
| `ch_stack` | `before_pop`, `check` | stack words; then ecx/edx |
| `ch_call` | `check` | eax after `triple(17)` returns |

```
break check
run
print /x $eax
print ($eflags & 0x40)
x/2xw $esp
```

Answers for the instructor: `CHALLENGE_ANSWERS.md`

---

## Hex-edit a string

Terminal: **hexedit**. GUI: **Bless**.

```bash
sudo apt install -y hexedit bless
./07_strings
hexedit 07_strings
# or
bless 07_strings
```

hexedit keys (from the hexedit man page):

| key | what |
|---|---|
| `Ctrl` + `S` | search forward |
| Tab | hex ↔ ASCII |
| type | overwrite |
| `F2` | save |
| `Ctrl` + `X` | save and exit |
| `Ctrl` + `C` | exit without saving |
| `F1` | help |

`HELLO_FROM_RE101` and `BYE___FROM_RE101` are both 16 characters (plus a trailing 0 in the file). Same length. Longer text overwrites the next bytes.

---

## Example files

| file | why it exists |
|---|---|
| `01_mov.s` | `mov` |
| `02_arith.s` | `add` `sub` `inc` `dec` |
| `03_xor.s` | `xor` + zero flag |
| `04_cmp_jmp.s` | `cmp` `jmp` `je` `jne` |
| `05_stack.s` | `push` `pop` |
| `06_call.s` | `call` `ret` |
| `07_strings.c` | hexedit lab |
| `08_ghidra_flow.c` | compiler → disasm → decompile demo |

---

## Crackmes (live)

```bash
./crackme1
strings ./crackme1
gdb ./crackme1
```

```
break main
run
disassemble
```

Same in Ghidra: import → analyze → `main` → read the compare → break that address in GDB.

Don't patch. Say what it is checking.
