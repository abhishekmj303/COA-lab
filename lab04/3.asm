; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db 10,"Number of vowels: $"
    sentence db "computer organization$"
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, sentence ; print sentence
    mov ah, 09h
    int 21h

    lea dx, msg ; print message
    mov ah, 09h
    int 21h

    mov si, offset sentence ; store sentence
    mov bl, 0

vowel:
    mov al, [si]

    cmp al, '$' ; exit if end of string
    jz exit
    
    cmp al, 'a' ; increment if char is a
    jz increment

    cmp al, 'e' ; increment if char is e
    jz increment

    cmp al, 'i' ; increment if char is i
    jz increment

    cmp al, 'o' ; increment if char is o
    jz increment

    cmp al, 'u' ; increment if char is u
    jz increment

    inc si
    jmp vowel
increment:
    inc bl
    inc si
    jmp vowel

exit:
    mov dl, bl ; print number
    add dl, 30h
    mov ah, 02h
    int 21h

    lea dx, nm ; print nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h
end