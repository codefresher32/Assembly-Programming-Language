org 100h
.model small
.stack 100h
.data
    f dw 0
    s dw 1
    x dw 0
    y dw 10
    temp dw 0
    msg1 dw 'Fibonacci $'
    msg2 dw 'Not Fibonacci $'
.code
main proc
    mov ax,@data
    mov ds,ax
     
    mov bx,0
   input:
    mov ah,1
    int 21h
    cmp al,13
    jne number
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov temp,bx
    cmp temp,1
    jng fibonacci
    jmp polok
    
   number:
    sub al,48
    mov ah,0
    mov x,ax
    mov ax,bx
    mul y
    add ax,x
    mov bx,ax
    jmp input 
    
   polok:
    mov ax,s
    add ax,f
    cmp ax,temp
    je fibonacci
    jg not_fibonacci
    mov bx,s
    mov s,ax
    mov f,bx
    jmp polok
    
   fibonacci:
    lea dx,msg1
    mov ah,9
    int 21h
    jmp exit
    
   not_fibonacci:
    lea dx,msg2
    mov ah,9
    int 21h
    jmp exit
    
   exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    