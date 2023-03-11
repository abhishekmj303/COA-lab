; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db "Reverse of array: $"
    arr db 01h,02h,05h,03h,04h
    count equ 5
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg ; print message
    mov ah, 09h
    int 21h

    mov si, offset arr ; store array

    mov di, offset arr ; store last index
    add di, count-1

    mov ax, count
    mov bl, 2
    div bl
    mov cl, al ; set counter to half of arr

reverse:
    mov al, [si] ; swap the numbers
    mov bl, [di]
    mov [di], al
    mov [si], bl
    
    inc si
    dec di
    loop reverse ; loop until cl = 0


    mov si, offset arr ; reset si
    mov cx, count
printArr:
    mov dl, [si] ; print number in [si]
    add dl, 30h
    mov ah, 02h
    int 21h

    add si, 1
    loop printArr

    lea dx, nm ; print nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h
end