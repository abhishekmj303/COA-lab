.model small
.stack 100h
.data
    msg1 db "The sum is $"
    n1 db 05h
    n2 db 04h
.code
    mov ax, @data
    mov ds, ax

    mov al, n1
    mov bl, n2
    add al, bl
    
    add al, 30h ;convert to ascii
    mov cl, al ;mov result to cl

    mov ah, 09h
    lea dx, msg1
    int 21h ;message should be in dx or dl

    mov dl, cl ;move the result to dl
    mov ah, 02h
    int 21h

    mov ax, 4c00h
    int 21h
end