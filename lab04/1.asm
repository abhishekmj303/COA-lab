; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg1 db "Enter a number(0-9): $"
    msg2 db 10, "The number of 1s: $"
    nm db 10, "Abhishek M J CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg1 ; print msg
    mov ah, 09h
    int 21h

    mov ah, 01h ; input char
    int 21h
    sub al, 30h ; convert to binary
    ; mov bl, al

    xor bl, bl ; clear bl register
    mov cx, 8

shifting:
    shl al, 1 ; shift left by 1
    jnc continue ; jump if carry is not set (C=0)
    inc bl
continue:
    loop shifting

    lea dx, msg2 ; print msg
    mov ah, 09h
    int 21h

    mov dl, bl
    add dl, 30h ; convert to ascii
    mov ah, 02h ; print counted 1s
    int 21h

    lea dx, nm ; print nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h
end