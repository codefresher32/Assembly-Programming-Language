org 100h
.model small
.stack 100h
.data
    msg1 db 'Palindrome $'
    msg2 db 'Not Palindrome $'
    x dw 0
    y dw 10
    z dw 0
    temp dw 0
    d dw 2
    d1 dw 0
    d2 dw 0
    
.code
main proc
    mov ax,@data
    mov ds,ax
    mov bx,1
    
   input:
    mov ah,1
    int 21h
    cmp al,13
    jne number
    
   newl:
    mov ah,2
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov ax,temp
    cmp ax,10
    jl palindrome
    
    dec z;
    mov cx,0
    mov cx,z
    mov ax,bx
   lp:
    mul y
    loop lp
    mov bx,ax
     
    mov bp,temp
    inc z
    mov ax,z
    mov dx,0
    div d
    mov cx,ax
    mov z,0
    jmp polok
    
    
   number:
    sub al,48
    mov ah,0
    mov x,ax
    mov ax,temp
    mul y
    add ax,x
    mov temp,ax
    inc z
    jmp input
    
    
   polok:
    mov dx,0
    inc z
    mov ax,temp
    div bx 
    mov d1,ax
    mov temp,dx
    mov ax,bx
    mov dx,0
    div y
    mov bx,ax
    
    mov ax,bp
    div y
    mov d2,dx
    mov bp,ax
    
    mov ax,d1
    cmp ax,d2
    jne not_palindrome
    cmp cx,z
    je palindrome
    jmp polok
    
    
   palindrome:
    lea dx,msg1
    mov ah,9
    int 21h
    jmp exit
    
   not_palindrome:
    lea dx,msg2
    mov ah,9
    int 21h
    jmp exit
    
   exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
    