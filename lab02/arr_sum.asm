.model small
.stack 100h
.data
    msg db "The sum is $"
    arr db 2, 2, 3
    ; arr db 3 dup(3)
    sum dw '0'
    newline db 10, 13, '$'
.code
    mov ax, @data
    mov ds, ax
    
    mov ax, 3
    mov bx, 0
    mov si, offset arr

    top:
        add bx, [si]
        add si, 1
        dec ax
    jnz top

    add bx, '0'
    mov [sum], bx

    mov ah, 09h
    lea dx, msg
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h

    mov dx, sum
    mov ah, 02h
    int 21h

    mov ax, 4c00h
    int 21h
end