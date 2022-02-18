org 100h 
.model small
.stack 100h
.data
    aa db 'A$'
    bb db 'B$'
    cc db 'C$'
    st db '*$' 
.code
main proc
       start:
        mov ah,1
        int 21h
        mov bl,al      ;1st input
        int 21h
        mov cl,al      ;2nd input
        int 21h
        mov ch,al      ;3rd input
        call newline
        cmp bl,cl      ;logic
        je l1
        cmp cl,ch
        je l2
        cmp bl,ch
        je l3
       l1:
        cmp bl,ch
        jne c
        jmp s 
       l2:
        cmp bl,cl
        jne a
        jmp s
       l3:
        cmp bl,cl
        jne b
        jmp s
       a:
        lea dx,aa       ;output 'A'
        mov ah,9
        int 21h
        jmp j
       b:
        lea dx,bb      ;output 'B'
        mov ah,9
        int 21h
        jmp j
       c:
        lea dx,cc     ;output 'C'
        mov ah,9
        int 21h
        jmp j
       s:
        lea dx,st      ;output '*'
        mov ah,9
        int 21h
       j:
        call newline
        jmp start
       newline proc      ;newline
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        ret 
       exit:
        endp main 