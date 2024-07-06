# Makefile for assembling empty.asm

# Define tools
RGBASM = rgbasm
RGBLINK = rgblink
RGBFIX = rgbfix

# Define input and output files
SOURCE = empty.asm
OBJECT = empty.o
OUTPUT = empty.gb

# Define build rules
all: $(OUTPUT)

$(OUTPUT): $(OBJECT)
	$(RGBLINK) -o $(OUTPUT) $(OBJECT)
	$(RGBFIX) -v $(OUTPUT)

$(OBJECT): $(SOURCE)
	$(RGBASM) -o $(OBJECT) $(SOURCE)

clean:
	rm -f $(OBJECT) $(OUTPUT)

# Phony targets
.PHONY: all clean