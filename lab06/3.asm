; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db "Matrix:",10,"$"
    matrix db 1,2,3,4,5,6,7,8,9
    cnt equ 3
    row db 0
    col db 0
    out1 db 10,"Number of columns: $"
    out2 db 10,"Number of rows: $"
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg ; print message
    mov ah, 09h
    int 21h

    mov si, offset matrix ; load array
    mov cl, cnt ; initialise counter = no. of elements

rowloop:
    mov bl, cnt
    colloop:
        mov dl, [si]
        add dl, 30h
        mov ah, 02h
        int 21h

        mov dl, 20h
        mov ah, 02h
        int 21h

        inc si
        dec bl
        cmp bl, 0
        jnz colloop
    
    mov dl, 10
    mov ah, 02h
    int 21h
    loop rowloop

    lea dx, out1 ; print message
    mov ah, 09h
    int 21h

    mov dl, cnt
    add dl, 30h
    mov ah, 02h
    int 21h

    lea dx, out2 ; print message
    mov ah, 09h
    int 21h

    mov dl, cnt
    add dl, 30h
    mov ah, 02h
    int 21h


    lea dx, nm ; print nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h

end