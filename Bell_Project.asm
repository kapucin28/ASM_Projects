SYS_WRITE   equ 4                     ; enable system write
STDOUT      equ 1                     ; stdout value
SYS_EXIT    equ 1                     ; system exit value


%macro write_string 2                 ; building a function that can be called multiple times
    mov     eax, SYS_WRITE            ; system call number
    mov     ebx, STDOUT               ; file descriptor
    mov     ecx, %1                   ; message
    mov     edx, %2                   ; message length
    int     0x80                      ; call kernel
%endmacro


segment .data
msg         db "   Woof!", 0xa        ; computer barking message
len         equ $ - msg               ; length of message

msg1    	  db 0x07                   ; hex code for bell in ASCII
len1        equ $ - msg1              ; length of message


segment .bss
num     resb    1                     ; reserving a number to operate on


segment .text
global _start
_start:
    mov     eax, '0'                  ; starting from zero
    mov     ecx, 10                   ; maximum number

loop_1:
    mov     [num], eax                ; moving the value that's stored in the register to the number
    push    ecx                       ; adding item to the stack

    write_string    num, 1            ; output number on screen
    write_string    msg, len          ; output message
    write_string    msg1, len1        ; bell sound

    mov     ecx, 0x7fffffff           ; number in hex from which the countdown starts
_pause:                               ; loop label
    dec     ecx                       ; caling decrement operation
    jnz     _pause                    ; if the number in the register is not equal to zero -> go back to the loop starting point

    mov     eax, [num]                ; placing num in the eax register
    sub     eax, '0'                  ; removing '0' so that it can be modified
    inc     eax                       ; incrementing the number
    add     eax, '0'                  ; adding '0' back to end modifications
    pop     ecx                       ; removing item from stack
    loop    loop_1                    ; go back to start of the loop

mov     eax, SYS_EXIT                 ; system call number
int     0x80                          ; call kernel
