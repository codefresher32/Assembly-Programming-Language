org 100h 
.model small
.stack 100h
.data
    ye db 'yes$'
    n db 'no$'
    x dw 0
    y dw 10 
    temp dw 0 
.code
main proc
       mov ax,@data       ;load data
       mov ds,ax 
       start: 
        call input
        mov bx,temp
        mov temp,0
        cmp bx,0
        je exit
        mov cx,1
       lp:
        mov ax,cx
        mul cx
        cmp ax,bx
        je yes
        cmp ax,bx
        jg no 
        inc cx
        jmp lp
         
       yes:                ;yes output
        lea dx,ye
        mov ah,9
        int 21h
        call newline
        jmp start
       no:                ;no output
        lea dx,n
        mov ah,9
        int 21h
        call newline
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