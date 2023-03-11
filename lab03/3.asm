; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db "Enter a numbers(0-9): $"
    msg1 db 10,"The number is even$"
    msg2 db 10,"The number is odd$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg
    mov ah, 09h
    int 21h

    mov ax, 0
    mov ah, 01h ; input char
    int 21h
    sub al, 30h

    mov bl, 2
    div bl ; divide by 2
    mov al, ah ; move remainder to al

    cmp al, 0
    jg odd ; if not equal to 0, jump to odd

    evn:
        lea dx, msg1
        mov ah, 09h
        int 21h
        jmp exit

    odd:
        lea dx, msg2
        mov ah, 09h
        int 21h

    exit:
    mov ax, 4c00h
    int 21h
end