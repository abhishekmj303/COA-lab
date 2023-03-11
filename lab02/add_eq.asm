.model small
.stack 100h
.data
    msg1 db "The sum is $"
    msg2 db "The difference is $"
    msg3 db "The product is $"
    msg4 db "The quotient is $"
    msg5 db "The remainder is $"
    newline db 10, 13, "$"
    num1 equ 03h
    num2 equ 02h
.code
    mov ax, @data
    mov ds, ax

    ; Addition
    mov al, num1
    mov bl, num2
    add al, bl

    mov cl, al
    mov ah, 09h
    lea dx, msg1 ; for printing the message
    int 21h

    mov dl, cl ; mov result to dl
    add dl, 30h
    mov ah, 02h
    int 21h
    call endl

    ; Subtraction
    mov al, num1
    mov bl, num2
    sub al, bl

    mov cl, al
    mov ah, 09h
    lea dx, msg2 ; for printing the message
    int 21h

    mov dl, cl ; mov result to dl
    add dl, 30h
    mov ah, 02h
    int 21h
    call endl

    ; Multiplication
    mov al, num1
    mov bl, num2
    mul bl

    mov cx, ax
    mov ah, 09h
    lea dx, msg3 ; for printing the message
    int 21h

    mov dx, cx ; mov result to dx
    add dx, 30h
    mov ah, 02h
    int 21h
    call endl

    ; Division
    mov ax, num1
    mov bl, num2
    div bl

    mov cl, al
    mov ch, ah
    mov ah, 09h
    lea dx, msg4 ; for printing the message
    int 21h

    mov dl, cl ; mov result to dl
    add dl, 30h
    mov ah, 02h
    int 21h
    call endl

    mov ah, 09h
    lea dx, msg5 ; for printing the message
    int 21h

    mov dl, ch ; mov result to dl
    add dl, 30h
    mov ah, 02h
    int 21h
    call endl

    mov ax, 4c00h
    int 21h

    endl:
        mov ah, 09h
        lea dx, newline ; for printing the newline
        int 21h
        ret
end
