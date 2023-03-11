.model small
.stack 100h
.data
    msg db "Counting from 0 to 9: $"
    newline db 10, 13, '$'
.code
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, msg
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h

    mov cx, 0ah
    mov dl, 0h

    add dl, 30h ; to ascci for display
    loop1:

        mov ah, 02h
        int 21h

        ; sub dl, 30h  ; revert to binary for increment

        inc dl
        dec cx
    
    jnz loop1

    mov ax, 4c00h
    int 21h
end