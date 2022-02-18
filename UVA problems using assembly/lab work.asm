org 100h 
.model small
.stack 100h
.data
    yes db 'YES$'
    no db 'NO$'
    x dw 0
    y dw 10 
    z dw 0 
    l dw 0
    temp dw 0
    t dw 0   
.code
main proc
        mov ax,@data
        mov ds,ax 
        
        call input          ;input
        mov bx,temp
        mov temp,0 
        mov bp,0
        mov di,0
        mov x,0
        
        lebel:
         mov dx,0
         mov ax,bx
         div y
         mov bx,ax
         mov ax,dx
         mov z,ax
         mov cx,l
         dec cx
         call power
         add bp,ax
         cmp bx,0
         je next
         inc di
         jmp lebel
         
       next:
          mov z,0
          mov ax,bp
          call output
         
          mov z,0
          mov ax,temp
          call output
          mov ax,bp
          cmp ax,temp
          je ys
          jmp n
  
        ys:
         lea dx,yes
         mov ah,9
         int 21h
         call newline
         jmp exit
         
        n:
        lea dx,no
        mov ah,9
        int 21h
        call newline
        jmp exit
           
          
       
       power proc         ;power
        mov t,ax
        mov x,ax
        mov ax,temp
        mul y
        add ax,x
        mov temp,ax
        mov ax,t
       lp:
        mul z
        loop lp 
        
        ret 
        
       input proc          ;input
        mov ah,1
        int 21h
        cmp al,13
        jne sum
        call newline
        ret 
       sum:
        inc l
        mov ah,0 
        sub al,48
        mov x,ax
        mov ax,temp
        mul y
        add ax,x
        mov temp,ax
        jmp input 
       output proc       ;output
        mov dx,0
        div y
        push dx
        inc z
        mov cx,0    
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
        call newline
        ret  
       newline proc    ;newline
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        ret
       exit:
        endp main
 end main 