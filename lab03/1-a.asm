; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db "The sum of two numbers: $"
    num1 equ 5
    num2 equ 9
.code
    mov ax, @data
    mov ds, ax

    mov al, num1
    mov bl, num2
    add al, bl

    aam ; divide by 10
    add ax, 03030h ; convert to ascii
    mov cx, ax

    lea dx, msg
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