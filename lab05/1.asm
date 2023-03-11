; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg1 db "Fibonacci upto 10: $"
    res db "          $" ; 10 spaces for 10 fib numbers
    cnt db 0ah
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg1 ; print msg
    mov ah, 09h
    int 21h

    mov si, offset res ; load empty array

    mov cl, cnt ; load no. of fib numbers
    mov ax, 00h
    mov bx, 01h

    mov [si], ax ; store first 2 numbers
    mov [si+1], bx
    add si, 2
    sub cl, 2

fib:
    add ax, bx
    mov [si], ax ; store ax+bx
    mov ax, bx ; make ax = bx
    mov bx, [si] ; make bx = ax+bx
    
    inc si
    loop fib

    mov si, offset res ; reset array pointer
    mov cl, cnt
print:
    mov ax, [si]

    aam ; divide by 10
    add ax, 03030h ; convert to ascii
    mov bx, ax

    mov dl, bh ; print higher bit
    mov ah, 02h
    int 21h
    mov dl, bl ; print lower bit
    mov ah, 02h
    int 21h

    mov dl, 20h ; print space
    mov ah, 02h
    int 21h

    inc si
    loop print

    lea dx, nm ; print nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h
end