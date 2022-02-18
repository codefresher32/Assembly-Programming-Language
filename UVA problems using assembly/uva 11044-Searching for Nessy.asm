org 100h 
.model small
.stack 100h
.data 
    x dw 0
    y dw 10 
    z dw 0
    t dw 3
    temp dw 0
    te dw 0   
.code
main proc 
        call input        ;input test case
        mov bx,temp
        mov te,bx 
       start:
        mov z,0
        mov temp,0
        cmp te,0          ;comparing test case
        je exit
        call input        ;1st input
        mov bx,temp
        mov temp,0
        call input        ;2nd input
        mov bp,temp
        mov temp,0
        
        mov ax,bx        ;logic
        mov dx,0
        div t
        mov bx,ax
        mov ax,bp
        mov dx,0
        div t
        mul bx
        call output
        dec te
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
        mov ah,4ch
        int 21h
 end main 