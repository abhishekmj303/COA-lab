; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db "Current time is : $"
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg
    mov ah, 09h
    int 21h

    ;Hour Part
    mov ah, 2ch ; To get System Time
    int 21h
    mov al, ch ; Hour is in ch
    call print

    mov dl, ':'
    mov ah, 02h
    int 21h

    ;Minute Part
    mov ah, 2ch ; To get System Time
    int 21h
    mov al, cl ; Minute is in cl
    call print

    mov dl, ':'
    mov ah, 02h
    int 21h

    ;Second Part
    mov ah, 2ch ; To get System Time
    int 21h
    mov al, dh ; Second is in dh
    call print

    mov dl, '.'
    mov ah, 02h
    int 21h

    ;Milisecond Part
    mov ah, 2ch ; To get System Time
    int 21h
    mov al, dl ; Milisecond is in dl
    call print

    lea dx, nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h

print:
    aam ; divide by 10
    add ax, 03030h ; convert to ascii
    mov bx, ax

    mov dl, bh
    mov ah, 02h
    int 21h
    mov dl, bl
    mov ah, 02h
    int 21h
    ret
end