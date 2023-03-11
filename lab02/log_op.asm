.model small
.stack 100h
.data
    msg1 db "num1=2 num2=3$"
    msg2 db "AND,OR,XOR,NOT: $"
    num1 db 2
    num2 db 3
    newline db 10, 13, '$'
.code
    mov ax, @data
    mov ds, ax
    
    mov ah, 09h
    lea dx, msg1
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, msg2
    int 21h

    ; AND
    mov al, [num1]
    mov bl, [num2]
    and al, bl
    mov cl, al
    mov dl, cl
    add dl, 30h
    mov ah, 02h
    int 21h

    ; OR
    mov al, [num1]
    mov bl, [num2]
    or al, bl
    mov cl, al
    mov dl, cl
    add dl, 30h
    mov ah, 02h
    int 21h

    ; XOR
    mov al, [num1]
    mov bl, [num2]
    xor al, bl
    mov cl, al
    mov dl, cl
    add dl, 30h
    mov ah, 02h
    int 21h

    ; NOT
    mov al, [num1]
    not al
    mov cl, al
    mov dl, cl
    add dl, 30h
    mov ah, 02h
    int 21h

    mov ax, 4c00h
    int 21h
end