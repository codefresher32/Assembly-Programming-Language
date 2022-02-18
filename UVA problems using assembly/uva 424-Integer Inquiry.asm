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
        mov bp,0 
       start:
        mov temp,0
        mov z,0
        call input          ;taking input
        mov ax,temp
        add bp,ax     ;summing till found '0'
        cmp ax,0
        jne start
        mov ax,bp
        call output
         
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
        jmp exit
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