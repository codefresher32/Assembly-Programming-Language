 org 100h 
.model small
.stack 100h
.data 
    a db 'Invalid $'
    b db 'Equilateral $'
    c db 'Isosceles $'
    d db 'Scalene $'
    x dw 0
    y dw 10 
    temp dw 0
    t dw 0
.code
main proc
        mov ax,@data
        mov ds,ax  
        call input        ;input test case
        mov ax,temp
        mov t,ax
       start:
        mov temp,0 
        cmp t,0          ;comparing test case
        je exit
        call input
        mov bx,temp
        mov temp,0
        call input
        mov bp,temp
        mov temp,0
        call input
        mov cx,temp
        mov temp,0
        cmp bx,bp
        jle g1
        xchg bx,bp
       g1:
        cmp bp,cx
        jle g2
        xchg bp,cx
       g2:
        mov ax,bx
        add ax,bp
        cmp ax,cx
        jle inv
        cmp bx,bp
        je l1
        cmp bp,cx
        je iso
        jmp sc
       l1:
        cmp bp,cx
        jne iso
        lea dx,b
        mov ah,9
        int 21h
        jmp j
       iso:
        lea dx,c
        mov ah,9
        int 21h
        jmp j
       
       sc:
        lea dx,d
        mov ah,9
        int 21h
        jmp j
       inv:
        lea dx,a
        mov ah,9
        int 21h 
       j: 
        dec t
        call newline
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
        endp main
 end main 