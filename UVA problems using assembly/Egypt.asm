org 100h 
.model small
.stack 100h
.data 
    w db 'wrong $'
    r db 'right $'
    x dw 0
    y dw 10 
    z dw 0
    temp dw 0
.code
main proc 
       start:
        mov temp,0
        mov z,0
        call input       ;1st side of trangle
        mov bx,temp
        mov temp,0
        call input
        mov bp,temp     ;2nd side of trangle
        mov temp,0
        call input
        mov cx,temp     ;3rd side of trangle
        cmp bx,0
        je exit
        mov ax,bx       ;a*a
        mul bx
        mov bx,ax
        mov ax,bp       ;b*b
        mul bp
        mov bp,ax
        mov ax,cx      ;c*c
        mul cx
        mov cx,ax
        
        cmp bx,bp      ;making 1st side greater
        jg l1
        xchg bx,bp
       l1:
        cmp bx,cx
        jg l2
        xchg bx,cx
       l2:
        add bp,cx
        cmp bx,bp      ;compare a*a=b*b+c*c
        je right
        lea dx,w       ;output 'wrong'
        mov ah,9
        int 21h
        call newline
        jmp start
       right:
        lea dx,r       ;output 'right'
        mov ah,9
        int 21h
        call newline
        jmp start
         
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