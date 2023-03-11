; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    num equ 3
    msg db "The factorial of 3: $"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg
    mov ah, 09h
    int 21h

    mov ax, num
    mov cx, num
    dec cx

    fact:
        mul cx ; multiply
        dec cx ; decrement
    jnz fact

    mov dl, al
    add dl, 30h ; convert to ascii
    mov ah, 02h
    int 21h

    mov ax, 4c00h
    int 21h
end