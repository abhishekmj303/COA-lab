.model small
.stack 100h
.data
    msg db "The sum is $"
    res dw '0'
    newline db 10, 13, '$'
.code
    mov ax, @data
    mov ds, ax
    
    mov cx, '3'
    sub cx, '0'

    mov bx, '5'
    sub bx, '0'

    clc ; reset carry flag
    call sum

    mov [res], ax

    mov ah, 09h
    lea dx, msg
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h

    mov dx, res
    mov ah, 02h
    int 21h

    mov ax, 4c00h
    int 21h

    sum:
        mov ax, cx
        add ax, bx
        add ax, '0'
        ret
end