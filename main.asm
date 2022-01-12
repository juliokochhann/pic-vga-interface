;===============================================================================
;____| PROJECT DESCRIPTION |____________________________________________________    
; Name: VGA Interface Test Program
;
; MCU: PIC16F628A     FOSC: 4 MHz (HS)     TOSC: 1 us
;
; Author: Julio Cesar Kochhann
;                                                                              
; Date: 12.01.2021
;                                                                              
;===============================================================================
;____| RELEASE DATE |__________| VERSION |__________| DEVICE ID |_______________
;       DD.MM.AAAA                 1.0                 H'FFFF'
;
;===============================================================================
;____| WISHLIST |_______________________________________________________________
; 1. New features go here
;
;===============================================================================
;____| KNOWN BUGS |_____________________________________________________________
; 1. Problems that need to be fixed go here
;
;===============================================================================


;===============================================================================
;____| Processor List |_________________________________________________________
    list    P=16F628A


;===============================================================================
;____| Definitions File |_______________________________________________________
    include <p16f628a.inc>


;===============================================================================
;____| Fuse Bits Configuration |________________________________________________
    __CONFIG _FOSC_HS & _WDTE_OFF & _PWRTE_ON & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF  ; __config 0xFF6A


;===============================================================================
;____| Memory Pagination |______________________________________________________
    #define bank0       bcf     STATUS,RP0      ; Switch to RAM Bank 0
    #define bank1       bsf     STATUS,RP0      ; Switch to RAM Bank 1


;===============================================================================
;____| Global Variables |_______________________________________________________
    cblock  H'20'               ; General Purpose Registers (GPR) start address

        W_TEMP                  ; Temporary registers for context saving
        STATUS_TEMP

        FLAGS1                  ; Flags 1 register

        top_row_count
        bottom_row_count
        text_row_count0
        text_row_count1
        text_row_count2
        text_row_count3
        text_row_count4
        text_row_count5
        text_row_count6
        back_porch_count
        delay_count
    endc


;===============================================================================
;____| Flags |__________________________________________________________________
    #define MY_FLAG     FLAGS1,0                ; Define MY_FLAG at bit 0 of FLAGS1


;===============================================================================
;____| Constants |______________________________________________________________
    ;TEMPO_DELAY        equ     500             ; EQU associates a number to a name


;===============================================================================
;____| Hardware Mapping |_______________________________________________________
; Inputs
    #define BTN1        PORTA,0         ; Button 1 at RA0
                                        ; 0 -> Button released
                                        ; 1 -> Button pressed

; Outputs
    #define G_SIG       PORTB,1         ; Green Signal at RB1
    #define H_SYNC      PORTB,3         ; Horizontal Sync Signal at RB3
    #define V_SYNC      PORTB,4         ; Vertical Sync Signal at RB4


;===============================================================================
;____| Reset Vector |___________________________________________________________
    org     H'0000'                     ; Program start address
    goto    main                        ; Jumps to label 'main'


;===============================================================================
;____| Interrupt Vector |_______________________________________________________
; Context saving
    org     H'0004'                     ; Interrupt start address

    movwf   W_TEMP
    swapf   STATUS,W
    movwf   STATUS_TEMP

; Interrupt service routine body
    nop

; Restore context
exit_ISR:
    swapf   STATUS_TEMP,W
    movwf   STATUS
    swapf   W_TEMP,F
    swapf   W_TEMP,W
    
    retfie                              ; Return from interrupt

;===============================================================================
;____| Macros |_________________________________________________________________
    
blank: macro
    bcf     G_SIG
    endm
    
point: macro
    bsf     G_SIG
    endm
    
h_sync: macro
    bcf     H_SYNC
    nop
    nop
    nop
    bsf     H_SYNC
    endm
    
;===============================================================================
;____| Program Entry Point |____________________________________________________

main:
    bank0                           ; Switch to RAM bank 0
    
    clrw                            ; Clears accumulator (W)
    movwf   PORTB                   ; Move W to PORTB file (register)
    
    bank1                           ; Switch to RAM bank 1
    
    movlw   B'11111111'             ; Move H'FF' to Work (W)
    movwf   TRISA                   ; Define all PORTA IOs as inputs
    movlw   B'11100101'             ;
    movwf   TRISB                   ; Define RB1, RB3 and RB4 as outputs

    movlw   B'11000000'             ;
    movwf   OPTION_REG              ; Define operation options

    movlw   B'00000000'             ;
    movwf   INTCON                  ; Define interrupt options
    
    bank0                           ; Return to bank 0
    
    movlw   7                       ;
    movwf   CMCON                   ; Configure CMCON: 7 = disable comparators

; Global variables initialization
    bcf         MY_FLAG             ; Clear MY_FLAG

    movlw       D'210'
    movwf       top_row_count

    movlw       D'175'
    movwf       bottom_row_count
    
    movlw       D'24'
    movwf       PORTB               ; G_SIG = 0 H_SYNC = V_SYNC = 1

;===============================================================================
;____| Loop Routine |___________________________________________________________
top_adj:
    nop
    
top_blank_loop:                     ; Cycle count
    top_blank_loop                  ; 1
    
top_adj1:    
    movlw       D'6'                ; 2
    movwf       delay_count         ; 3
    
    call        delay_us            ; 4-24      (21 us delay)
    
    h_sync                          ; 26-30
    
    decfsz      top_row_count       ; 25 | 31-32
    goto        top_blank_loop      ; 31-32
    
    include <text.inc>              ; Draws 'JCK' on the screen
    
bottom_adj:
    nop
    
bottom_blank_loop:
    blank                           ; 1
    
    movlw       D'35'               ; 2
    movwf       back_porch_count    ; 3
    
    movlw       D'5'                ; 4
    movwf       delay_count         ; 5
    
    call        delay_us            ; 6-23      (18 us delay)
    
    nop                             ; 24
    
    h_sync                          ; 26-30
    
    decfsz      bottom_row_count    ; 25 | 31-32
    goto        bottom_blank_loop   ; 31-32

vertical_sync_adj:
    bcf         V_SYNC
    
vertical_sync:    
    btfss       back_porch_count, 1 ; 1
    bsf         V_SYNC              ; 2
    
    movlw       D'210'              ; 3
    movwf       top_row_count       ; 4
    movlw       D'175'              ; 5
    movwf       bottom_row_count    ; 6
    movlw       D'15'               ; 7
    movwf       text_row_count0     ; 8
    movwf       text_row_count1     ; 9
    movwf       text_row_count2     ; 10
    movwf       text_row_count3     ; 11
    movwf       text_row_count4     ; 12
    movwf       text_row_count5     ; 13
    movwf       text_row_count6     ; 14
    
    movlw       D'1'                ; 15
    movwf       delay_count         ; 16
    
    call        delay_us            ; 17-22     (6 us delay)
    
    goto        $+1                 ; 23-24
    
    h_sync                          ; 26-30
    
    decfsz      back_porch_count    ; 25 | 31-32
    goto        vertical_sync       ; 31-32
    goto        top_adj1            ; 1-2 de top_blank_loop


;===============================================================================
;____| Routines |_______________________________________________________________

delay_us:
    decfsz      delay_count
    goto        delay_us
    
    return

;===============================================================================
;____| Program Exit Point |_____________________________________________________
    end
