org 100h 
.model small
.stack 100h

.data
    x dw 0
    y dw 10 
    z dw 0
    temp dw 0
    e dw 2
    
.code
main proc
    
        mov bx,0
       input:
        mov ah,1
        int 21h
        cmp al,13
        jne sum
        call newline 
        mov bx,temp 
        mov bp,1
        mov x,0
        jmp prime
        
       sum:
        mov ah,0 
        sub al,48
        mov x,ax
        mov ax,temp
        mul y
        add ax,x
        mov temp,ax 
        jmp input 
        
       prime:
        inc bp
        cmp bx,x
        je exit
        mov ax,bp
        cmp ax,3
        jle move
        mov dx,0 
        div e
        cmp dx,0
        je prime
        mov cx,0
        mov cx,3
      ck:
        mov dx,0
        mov ax,cx
        mul cx
        cmp bp,ax
        jl move
        mov ax,bp
        div cx
        cmp dx,0
        je prime
        inc cx
        inc cx
        jmp ck
        
      move: 
        inc x
        mov ax,0
        mov ax,bp
 
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
        call space 
        mov z,0
        jmp prime
        
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
       
      
        
        
  



