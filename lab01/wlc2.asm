.model small
.stack 100h
.data
    msg1 db "Good Morning$" ;defining string
    msg2 db "Welcome to IIITDM$" ;defining string
.code
    mov ax, @data ;initialize the data segment
    mov ds, ax

    mov ah, 09h ;printing the message
    lea dx, msg1
    int 21h

    mov dl, 10 ;ascii 10- new line with tab-space (in linux)
    mov ah, 02h
    int 21h

    ; to remove tab space added with the new line
    mov dl, 13 ;ascii 13- move to start of line
    mov ah, 02h
    int 21h

    mov ah, 09h ;printing the message
    lea dx, msg2
    int 21h

    mov ax, 4c00h ;exit from the program
    int 21h
end