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
        call input        ;input test case
        mov bx,temp
        mov t,bx 
       start:
        mov temp,0 
        mov z,0
        cmp t,0          ;comparing test case
        je exit
        call input
        mov bx,temp      ;1st input
        mov temp,0
        call input
        mov bp,temp      ;2nd input
        mov temp,0
        mov ax,bx        ;logic
        mov cx,5
        mov temp,9
        mov dx,0
        mul temp
        div cx
        add ax,bp
        mul cx
        mov dx,0
        div temp
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