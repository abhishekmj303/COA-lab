; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db "Sorted of array: $"
    arr db 09h,03h,07h,08h,02h,01h
    count equ 6
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg ; print message
    mov ah, 09h
    int 21h

    mov bx, offset arr ; store array

    ; let si = i, di = j
    mov si, 0  ; set i = 0
sort1:
    mov di, si ; set j = i
    sort2:
        mov al, [bx+si]
        mov ah, [bx+di]
        
        cmp al, ah ; if arr[i] < arr[j]
        jl next    ; continue loop
        mov [bx+si], ah ; else, swap
        mov [bx+di], al
        
        next:
            inc di
            cmp di, count ; if j != n
            jne sort2     ; inner loop

            inc si
            cmp si, count ; if i != n
            jne sort1     ; outer loop
            je exit       ; else, exit

exit:
    mov si, offset arr ; reset si
    mov cx, count
printArr:
    mov dl, [si] ; print number in [si]
    add dl, 30h
    mov ah, 02h
    int 21h

    mov dl, ' '
    mov ah, 02h
    int 21h

    add si, 1
    loop printArr

    lea dx, nm ; print nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h
end