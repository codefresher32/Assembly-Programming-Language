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
        call input       ;1st input
        mov bp,temp
        mov temp,0
        call input
        mov bx,temp      ;2nd input
        mov temp,0
        call input
        mov cx,temp      ;3rd input
        mov temp,0
        cmp bp,bx        ;logic
        jg g             ;a<b<c (calculation of middle)
        xchg bp,bx
       g:
        cmp bp,cx
        jg l
        xchg bp,cx
       l:
        cmp bx,cx
        jg j
        xchg bx,cx
       j:         
        mov ax,bx
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
 end main 