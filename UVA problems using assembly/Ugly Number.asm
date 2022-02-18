org 100h
.stack 100h
.model small
.data
    x db 'The 1500',39,'th ugly number is 859963392.',10,13,'$'
.code
main proc
    mov ax,@data
    mov ds,ax
    lea dx,x
    mov ah,9
    int 21h
    
   exit:
    mov ah,4ch
    int 21h
    main endp