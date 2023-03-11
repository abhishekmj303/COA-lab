.model small
.stack 100h
.data
    msg db "Hello world$" ; defining string
.code
    mov ax, @data ;initialize the data segment
    mov ds, ax

    mov ah, 09h ;printing the message
    lea dx, msg
    int 21h

    mov ax, 4c00h ; exit from the program
    int 21h
end