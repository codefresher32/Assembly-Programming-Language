org 100h 
.model small
.stack 100h
.data
    h db 'Happy Number$'
    uh db 'Unhappy Number$'
    x dw 0
    y dw 10 
    z dw 0
    temp dw 0 
    t dw 0  
.code
main proc
       mov ax,@data          ;load data
       mov ds,ax 
       call input            ;input test case
       mov bx,temp
       mov t,bx
       start: 
        cmp t,0
        je exit
        mov temp,0 
        mov z,0
        call input          ;input number
        mov bx,temp 
        cmp bx,7
        je happy 
        mov ax,bx
       l:            ;squaring until sum less than 10
        mov bp,0
       lp:
        mov dx,0
        div y
        mov bx,ax
        mov ax,dx
        mul dx
        add bp,ax
        mov ax,bx
        cmp bx,0
        jne lp
        mov ax,bp
        cmp ax,10
        jge l 
        cmp ax,1
        jne unhappy 
       happy:                ;happy output
        lea dx,h
        mov ah,9
        int 21h
        call newline
        jmp j
       unhappy:             ;unhappy output
        lea dx,uh
        mov ah,9
        int 21h
        call newline
       j:
        dec t
        jmp start
        
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
       newline proc    ;newline
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        ret
       exit:
      endp main