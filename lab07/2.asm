; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg1 db "String is: $"
    msg2 db 10,"Reverse string is: $"
    string db "Computer Organization and Design Practice$"
    strlen dw $-string ; length of string
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg1 ; print message
    mov ah, 09h
    int 21h

    lea dx, string ; print string
    mov ah, 09h
    int 21h

    lea dx, msg2 ; print message
    mov ah, 09h
    int 21h

    mov si, offset string ; load string
    mov cx, strlen
    dec cx ; exclude '$' from count

    add si, cx ; increment si to end '$'

reverse:
    dec si ; decrement the index
    mov dl, [si] ; print a char
    mov ah, 02h
    int 21h
    
    loop reverse

    lea dx, nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h
end;