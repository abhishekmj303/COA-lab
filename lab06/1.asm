; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db "Addition of 2 arrays: $"
    arr1 db 01h,02h,03h,04h
    arr2 db 04h,05h,06h,05h
    arr3 db 00h,00h,00h,00h
    cnt equ 4
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg ; print message
    mov ah, 09h
    int 21h

    mov si, offset arr1 ; load arr1
    mov di, offset arr2 ; load arr2
    mov bx, offset arr3 ; load arr3

    mov cl, cnt ; initialise counter = no. of elements

addArray:
    mov al, [si]
    add al, [di]
    mov [bx], al

    inc si
    inc di
    inc bx
    loop addArray

    mov si, offset arr3
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