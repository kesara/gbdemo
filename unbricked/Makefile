# Makefile for building a GameBoy ROM

# Compiler tools
RGBASM = rgbasm
RGBLINK = rgblink
RGBFIX = rgbfix

# GameBoy emulator
EMU = mGBA

# Source and output files
ASM_FILE = main.asm
OBJ_FILE = main.o
ROM_FILE = unbricked.gb

# Flags for the assembler, linker, and fixer
ASM_FLAGS = -o $(OBJ_FILE) $(ASM_FILE)
LINK_FLAGS = -o $(ROM_FILE) $(OBJ_FILE)
FIX_FLAGS = -v -p 0xFF $(ROM_FILE)

# Default target
all: $(ROM_FILE)

# Build the ROM
$(ROM_FILE): $(OBJ_FILE)
	$(RGBLINK) $(LINK_FLAGS)
	$(RGBFIX) $(FIX_FLAGS)

# Assemble the source file
$(OBJ_FILE): $(ASM_FILE)
	$(RGBASM) $(ASM_FLAGS)

# Clean up build artifacts
clean:
	rm -f $(OBJ_FILE) $(ROM_FILE)

# Run the ROM in the emulator
run: $(ROM_FILE)
	$(EMU) $(ROM_FILE)

# Rebuild everything from scratch
rebuild: clean all

.PHONY: all clean rebuild run
