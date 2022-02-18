org 100h 
.model small
.stack 100h
.data
    x dw 0
    y dw 10 
    z dw 0
    temp dw 0
    t dw 0   
.code
main proc
        mov ax,@data
        mov ds,ax 
        call input        ;input test case
        mov bx,temp
        mov t,bx 
       start:
        mov z,0
        mov temp,0 
        cmp t,0          ;comparing test case
        je exit
        call input
        mov cx,temp      ;input number of element
        mov temp,0 
        dec cx
        call input
        mov bx,temp      ;initialy min
        mov bp,temp      ;initialy max
       ad:
         mov temp,0
         call input
         cmp bx,temp    ;final min
         jl l
         mov bx,temp
        l:
         cmp bp,temp    ;final max
         jg g
         mov bp,temp
        g:
         loop ad
         sub bp,bx     ;2*(max-min)
         mov ax,bp
         mov bx,2
         mul bx
         call output
        
        dec t
        jmp start          ;jump starting
       input proc          ;input
        mov ah,1
        int 21h
        cmp al,13
        jne sum
        call newline
        ret 
       sum:
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