; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db 10,"Enter a character: $"
    string db "assembly programming$"
    out1 db 10,"Number of occurrence: $"
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, string ; print string
    mov ah, 09h
    int 21h

    lea dx, msg ; print message
    mov ah, 09h
    int 21h

    mov ah, 01h ; input char
    int 21h
    mov bl, al

    mov si, offset string ; load string
    mov bh, 00h ; initialise counter = 0

search:
    mov al, [si]

    cmp al, '$' ; exit if end
    jz exit

    cmp al, bl ; if found increment
    jz increment

    inc si
    jmp search

increment:
    inc bh
    inc si
    jmp search


exit:
    lea dx, out1 ; print
    mov ah, 09h
    int 21h

    mov dl, bh ; print counter value
    add dl, 30h
    mov ah, 02h
    int 21h

    lea dx, nm ; print nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h
end