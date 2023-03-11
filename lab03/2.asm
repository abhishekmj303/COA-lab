; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db "Largest in array: $"
    arr db 13h,23h,20h,38h,50h ; largest is 50h = 80
    count equ 5
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg
    mov ah, 09h
    int 21h

    mov si, offset arr ; store array
    mov cx, count

    mov ax, [si]
    mov bx, ax
    inc si
    dec cx

    cmploop:
        cmp bx, [si]
        jl store
        inc si
        dec cx
    jnz cmploop
    jmp exit
    
    store:
        mov bx, [si]
        inc si
        dec cx
        jnz cmploop

    exit:
    mov ax, bx
    aam ; divide by 10
    add ax, 03030h ; convert to ascii
    mov bx, ax

    mov dl, bh
    mov ah, 02h
    int 21h
    mov dl, bl
    mov ah, 02h
    int 21h

    mov ax, 4c00h
    int 21h
end