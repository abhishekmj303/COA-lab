; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg1 db "Enter 2 numbers(0-9): $"
    msg2 db 10, "The sum of two numbers: $"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h

    mov ah, 01h ; input char
    int 21h
    sub al, 30h
    mov bl, al

    mov ah, 01h
    int 21h
    sub al, 30h

    add al, bl

    aam ; divide by 10
    add ax, 03030h ; convert to ascii
    mov cx, ax

    lea dx, msg2
    mov ah, 09h
    int 21h

    mov dl, ch
    mov ah, 02h
    int 21h
    mov dl, cl
    mov ah, 02h
    int 21h

    mov ax, 4c00h
    int 21h
end