# Makefile for building a Game Boy ROM

# Compiler tools
RGBASM = rgbasm
RGBLINK = rgblink
RGBFIX = rgbfix

# Source and output files
SRC = hello-world.asm
OBJ = hello-world.o
ROM = hello-world.gb

# Flags for the assembler, linker, and fixer
ASM_FLAGS = -o $(OBJ) $(SRC)
LINK_FLAGS = -o $(ROM) $(OBJ)
FIX_FLAGS = -v -p 0xFF $(ROM)

# Default target
all: $(ROM)

# Build the ROM
$(ROM): $(OBJ)
	$(RGBLINK) $(LINK_FLAGS)
	$(RGBFIX) $(FIX_FLAGS)

# Assemble the source file
$(OBJ): $(SRC)
	$(RGBASM) $(ASM_FLAGS)

# Clean up build artifacts
clean:
	rm -f $(OBJ) $(ROM)

# Rebuild everything from scratch
rebuild: clean all

.PHONY: all clean rebuild
