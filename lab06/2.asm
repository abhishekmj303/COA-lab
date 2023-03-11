; Abhishek M J - CS21B2018
.model small
.stack 100h
.data
    msg db 10,"Test case T1, T2: $"
    s1 db "Computer Organization Practical$"
    s2 db "Computer Organization Practical$"
    s3 db "Computer Organization Practical$"
    s4 db "Computer Organization and Architecture Practical$"
    lenArr db 0,0,0,0
    t equ 2
    out2 db 10,"Not Same$"
    out1 db 10,"Same$"
    lenout db 10,"Length of s1, s2, s3, s4: $"
    nm db 10,"Abhishek M J - CS21B2018$"
.code
    mov ax, @data
    mov ds, ax

    lea dx, msg ; print message
    mov ah, 09h
    int 21h

    mov si, offset s1 ; load string
    mov di, offset s2
    mov cl, t

testCase:

    compare:
        mov al, [si]
        mov bl, [di]

        cmp al, '$' ; exit if end
        jz checkEnd
        cmp bl, '$' ; exit if end
        jz notSame

        cmp al, bl ; if found increment
        jnz notSame

        inc si
        inc di
        jmp compare
    
    checkEnd:
        cmp bl, '$'
        jz same
        jnz notSame
    
    same:
        lea dx, out1 ; print
        mov ah, 09h
        int 21h
        jmp next
    
    notSame:
        lea dx, out2 ; print
        mov ah, 09h
        int 21h
        jmp next
    
    next:
        dec cl
        cmp cl, 0
        jz exit

        mov si, offset s3 ; load string
        mov di, offset s4
        jmp testCase

exit:
    lea dx, lenout ; print
    mov ah, 09h
    int 21h

    mov di, offset lenArr
    
    mov si, offset s1
    call lenof
    call print2digit

    inc di
    mov si, offset s2
    call lenof
    call print2digit

    inc di
    mov si, offset s3
    call lenof
    call print2digit

    inc di
    mov si, offset s4
    call lenof
    call print2digit


    lea dx, nm ; print nm
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h

lenof:
    mov al, [si]
    inc si
    mov bl, 1
    add [di], bl

    cmp al, '$'
    jnz lenof
    
    sub [di], bl
    ret

print2digit:
    mov ax, [di]
    aam ; divide by 10
    add ax, 03030h ; convert to ascii
    mov bx, ax

    mov dl, bh ; print higher bit
    mov ah, 02h
    int 21h
    mov dl, bl ; print lower bit
    mov ah, 02h
    int 21h

    mov dl, 20h ; print space
    mov ah, 02h
    int 21h
    ret

end