.model small
.stack 100
.data
    inp db "Search element: $"
    msg1 db 10,13,"Found$"
    msg2 db 10,13,"Not found$"
    arr db 01h,02h,03h,04h,05h,06h
    cnt equ 6
.code
    mov ax, @data
    mov ds, ax

    lea dx, inp
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov cl, al

    mov si, 00h
    mov di, cnt-1

bin:
    cmp si, di
    jg notfound

    mov ax, di
    add ax, si
    mov bl, 2
    div bl
    mov ah, 0
    mov bx, ax

    cmp cl, arr[bx]
    je found
    jg right
    jl left

    right:
        mov si, bx
        inc si
        jmp bin
    left:
        mov di, bx
        dec di
        jmp bin

found:
    lea dx, msg1
    mov ah, 09h
    int 21h
    jmp exit

notfound:
    lea dx, msg2
    mov ah, 09h
    int 21h

exit:
    mov ax, 4c00h
    int 21h
end
