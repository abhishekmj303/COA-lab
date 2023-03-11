; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db 10,"Answer: $"
    inp1 db "Base (0-9): $"
    inp2 db 10,"Power (0-2): $"
.code
    mov ax, @data
    mov ds, ax

    lea dx, inp1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al

    lea dx, inp2
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov cl, al

    mov al, bl
    ; mov cx, [pow]
    dec cx

    mult:
        mul al ; multiply
        dec cx ; decrement
    jnz mult

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