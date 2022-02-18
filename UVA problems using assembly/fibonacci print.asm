org 100h 
.model small
.stack 100h

.data
    f dw 0
    s dw 1
    x dw 0
    y dw 10 
    z dw 0
    temp dw 0
    c dw 0
    
.code
main proc
    
        mov bx,0
       input:
        mov ah,1
        int 21h
        cmp al,13
        jne sum
        call newline
        jmp fibonacci
        
       sum:
        mov ah,0 
        sub al,48
        mov x,ax
        mov ax,temp
        mul y
        add ax,x
        mov temp,ax
        jmp input
        
       fibonacci:
        mov z,0
        inc c
        mov ax,f
        add bx,f
        call output
        call space
        mov ax,f
        add ax,s
        mov bp,s
        mov f,bp
        mov s,ax
        mov bp,temp
        cmp c,bp
        jne fibonacci
        call newline
        mov ax,bx 
        mov z,0
        call output
        jmp exit
         
        
       output proc
        mov dx,0
        div y
        push dx
        inc z    
        mov cx,z
        cmp ax,0
        je print
        jmp output
        
       print:
        mov ah,2
        pop dx
        add dl,48
        int 21h
        loop print
        ret
        
       space proc
        mov ah,2
        mov dl,32
        int 21h
        ret
        
       newline proc
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        ret
       
       exit:
        mov ah,4ch
        int 21h
       ; main endp
 end main 
       
      
        
        
  



