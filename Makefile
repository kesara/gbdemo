# Makefile for building Game Boy ROMs

# Compiler tools
RGBASM = rgbasm
RGBLINK = rgblink
RGBFIX = rgbfix

# Emulator
EMU = mGBA

# Find all .asm files in the current directory
ASM_FILES = $(wildcard *.asm)
OBJ_FILES = $(ASM_FILES:.asm=.o)
ROM_FILES = $(ASM_FILES:.asm=.gb)

# Flags for the assembler, linker, and fixer
ASM_FLAGS = -o $@ $<
LINK_FLAGS = -o $@ $<
FIX_FLAGS = -v -p 0xFF $@

# Default target
all: $(ROM_FILES)

# Pattern rule for building ROM files
%.gb: %.o
	$(RGBLINK) $(LINK_FLAGS)
	$(RGBFIX) $(FIX_FLAGS)

# Pattern rule for assembling source files
%.o: %.asm
	$(RGBASM) $(ASM_FLAGS)

# Clean up build artifacts
clean:
	rm -f $(OBJ_FILES) $(ROM_FILES)

# Rebuild everything from scratch
rebuild: clean all

.PHONY: all clean rebuild
