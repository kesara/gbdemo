SECTION "Home", ROM0[$0100]
    jp Main

SECTION "Vectors", ROM0[$0000]
    nop
    jp $0150
    nop
    jp $0150
    jp $0150

SECTION "Header", ROM0[$0104]
    db "Nintendo"          ; Nintendo logo
    dw $0150               ; Entry point
    db "EMPTY GB"          ; Title (11 characters)
    db $00                 ; CGB flag
    db $00                 ; New licensee code
    db $00                 ; SGB flag
    db $01                 ; Cartridge type
    db $00                 ; ROM size
    db $00                 ; RAM size
    db $00                 ; Destination code
    db $00                 ; Old licensee code
    db $00                 ; Mask ROM version
    db $00                 ; Complement check
    db "        "          ; Checksum

SECTION "Graphics", ROM0

TileData:
    ; Define tile data for an empty square (8x8 pixels)
    db $00, $00, $00, $00, $00, $00, $00, $00 ;
    db $00, $00, $00, $00, $00, $00, $00, $00 ;

SECTION "Main", ROM0[$0150]
Main:
    ; Initialize display
    ld a, $01
    ld [rLCDC], a

    ; Set tile data
    ld hl, $8000          ; Start of VRAM
    ld de, TileData
    ld bc, 16             ; Size of tile data

    ; Manually transfer data
TransferLoop:
    ld a, [de]
    ld [hl], a
    inc hl
    inc de
    dec bc
    ld a, b
    or c
    jr nz, TransferLoop

    ; Set background map
    ld hl, $9800          ; Start of background map
    ld [hl], $00          ; Tile number 0

    ; Enable LCD
    ld a, $91
    ld [rLCDC], a

InfiniteLoop:
    halt
    jp InfiniteLoop

; Define memory locations for hardware registers
DEF rLCDC EQU $0040

SECTION "VBlankInterrupt", ROM0[$0040]
    reti

SECTION "LCDCInterrupt", ROM0[$0048]
    reti

SECTION "TimerInterrupt", ROM0[$0050]
    reti

SECTION "SerialInterrupt", ROM0[$0058]
    reti

SECTION "JoypadInterrupt", ROM0[$0060]
    reti
