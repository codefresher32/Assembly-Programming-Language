.model small
.stack 100h
.data
    msg1 db ' Greater $'
    msg4 db 'Enter Input : $'
    a db ?
    b db ?
    c db ?
    
.code
main proc
    mov ax,@data       ;data load
    mov ds,ax
    
    lea dx,msg4        ;message 4 output
    mov ah,9
    int 21h 
    
    mov ah,2          ;newline
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov ah,1          ;a input
    int 21h
    mov a,al 
    
    mov ah,2           ;newline
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov ah,1          ;b input
    int 21h
    mov b,al
    
    mov ah,2          ;new line
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h
    
    mov ah,1         ;c input
    int 21h
    mov c,al
    
    mov ah,2         ;new line
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h         
    
    mov bl,a        ;data copy
    mov bh,b
    mov cl,c  
    
    cmp bl,bh
    jg l1 
    cmp bh,cl
    jg l2
    mov ah,2         ;c greater
    mov dl,cl
    int 21h
    lea dx,msg1        ;message 1 output
    mov ah,9
    int 21h
    jmp exit
    
    
    l2:
       mov ah,2
       mov dl,bh        ;b greater
       int 21h
       lea dx,msg1        ;message 1 output
       mov ah,9
       int 21h
       jmp exit 
    
    l1:
        cmp bl,cl
        jg s1
        mov ah,2
        mov dl,cl         ;c greater
        int 21h
        lea dx,msg1        ;message 1 output
        mov ah,9
        int 21h
        jmp exit
        
        s1:
            mov ah,2        ;a greater
            mov dl,bl
            int 21h
            lea dx,msg1        ;message 1 output
            mov ah,9
            int 21h
            jmp exit
           
             
     exit:
        mov ah,4ch
        int 21h
        main endp
end main
     
     
    