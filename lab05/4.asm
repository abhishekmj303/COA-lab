; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db "Enter a number: $"
    array db 06h,09h,03h,05h,00h,"$"
    cnt equ 5
    out1 db 10,"Number is present$"
    out2 db 10,"Number is not present$"
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg ; print message
    mov ah, 09h
    int 21h

    mov ah, 01h ; input char
    int 21h
    sub al, 30h ; convert to bin
    mov bl, al

    mov si, offset array ; load array
    mov cl, cnt ; initialise counter = no. of elements

search:
    mov al, [si]

    cmp al, bl ; exit if found
    jz found

    inc si
    loop search

notfound:
    lea dx, out2 ; print not found
    mov ah, 09h
    int 21h
    jmp exit

found:
    lea dx, out1 ; print found
    mov ah, 09h
    int 21h

exit:
    lea dx, nm ; print nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h
end