org 100h 
.model small
.stack 100h
.data
    x dw 0
    y dw 10 
    z dw 0
    temp dw 0   
.code
main proc 
       start:
        mov x,0       
        mov temp,0
        mov z,0
        call input    ;1st input
        mov ax,temp
        cmp ax,0
        jl exit
        mov bx,temp
        mul bx
        add ax,bx
        add ax,2
        mov bx,2
        div bx
        
        call output  ;output
       input proc
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
       output proc
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
        jmp start
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