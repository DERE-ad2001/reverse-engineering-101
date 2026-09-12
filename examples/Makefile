CC      = gcc
CFLAGS  = -m32 -g -no-pie
DEMOS   = 01_mov 02_arith 03_xor 04_cmp_jmp 05_stack 06_call 07_strings 08_ghidra_flow
CHALS   = ch_mov ch_arith ch_xor ch_jmp ch_stack ch_call
BINS    = $(DEMOS) $(CHALS)

.PHONY: all clean demos challenges

all: $(BINS)
demos: $(DEMOS)
challenges: $(CHALS)

01_mov: 01_mov.s
	$(CC) $(CFLAGS) -o $@ $<

02_arith: 02_arith.s
	$(CC) $(CFLAGS) -o $@ $<

03_xor: 03_xor.s
	$(CC) $(CFLAGS) -o $@ $<

04_cmp_jmp: 04_cmp_jmp.s
	$(CC) $(CFLAGS) -o $@ $<

05_stack: 05_stack.s
	$(CC) $(CFLAGS) -o $@ $<

06_call: 06_call.s
	$(CC) $(CFLAGS) -o $@ $<

07_strings: 07_strings.c
	$(CC) $(CFLAGS) -o $@ $<

08_ghidra_flow: 08_ghidra_flow.c
	$(CC) $(CFLAGS) -o $@ $<

ch_mov: ch_mov.s
	$(CC) $(CFLAGS) -o $@ $<

ch_arith: ch_arith.s
	$(CC) $(CFLAGS) -o $@ $<

ch_xor: ch_xor.s
	$(CC) $(CFLAGS) -o $@ $<

ch_jmp: ch_jmp.s
	$(CC) $(CFLAGS) -o $@ $<

ch_stack: ch_stack.s
	$(CC) $(CFLAGS) -o $@ $<

ch_call: ch_call.s
	$(CC) $(CFLAGS) -o $@ $<

clean:
	rm -f $(BINS)
