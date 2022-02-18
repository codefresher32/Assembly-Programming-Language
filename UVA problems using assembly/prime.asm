org 100h
.model small
.stack 100h
.data
    temp dw 0
    x dw 0
    y dw 10
    z dw 0
    
    msg1 db 'Prime$'
    msg2 db 'Not Prime$'
.code
main proc 
    mov ax,@data
    mov ds,ax
   
   input:
    mov ah,1
    int 21h
    cmp al,13
    jne number
    mov ax,temp
    cmp ax,2
    je prime
    cmp ax,3
    je prime
    cmp ax,1
    je not_prime
    jmp polok
    
   number:
    sub al,48
    mov ah,0
    mov x,ax
    mov ax,temp
    mul y
    add ax,x
    mov temp,ax
    jmp input 
    
   polok:
    mov ax,0
    mov ax,temp
    mov bx,0
    mov bx,2
    div bx
    and cx,0
    mov cx,ax
    
   lp:
    mov ax,temp
    div cx 
    cmp dx,0
    je not_prime
    mov dx,0
    cmp cx,2
    je prime
    loop lp
    
   prime:
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    lea dx,msg1
    mov ah,9
    int 21h
    jmp exit
    
   not_prime:
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    lea dx,msg2
    mov ah,9
    int 21h
    jmp exit
    
   exit:
    mov ah,4ch
    int 21h
    main endp
end main
     
    
    