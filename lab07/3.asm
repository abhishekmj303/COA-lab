; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db "Enter a numbers(0-9): $"
    msg1 db 10,"The number is Prime$"
    msg2 db 10,"The number is not Prime$"
    nm db 10,"Abhishek M J - CS21B2018$"
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

    cmp al, 2
    jl notPrime ; if less than 2
    je prime ; if equal to 2

    mov bl, al ; store divisor

    mov cl, al ; counter = n
    sub cl, 2 ; remove 1 and n from counter

    mov bh, 2 ; to divide from 2 to n-1

loop1:
    mov ax, 0
    mov al, bl
    div bh ; divide by bh
    mov al, ah ; move remainder to al

    cmp al, 0
    jz notPrime ; if not equal to 0, jump to notPrime

    inc bh
    loop loop1

    prime:
        lea dx, msg1
        mov ah, 09h
        int 21h
        jmp exit

    notPrime:
        lea dx, msg2
        mov ah, 09h
        int 21h

    exit:
    lea dx, nm
    mov ah, 09h
    int 21h 

    mov ax, 4c00h
    int 21h
end