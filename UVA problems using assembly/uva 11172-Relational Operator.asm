org 100h 
.model small
.stack 100h
.data
    b db '> $'
    s db '< $'
    e db '= $' 
    x dw 0
    y dw 10 
    z dw 0
    temp dw 0
    te dw 0   
.code
main proc 
        call input        ;input test case
        mov bx,temp
        mov te,bx 
       start:
        mov temp,0
        cmp te,0          ;comparing test case
        je exit
        call input        ;1st input
        mov bx,temp       
        mov temp,0
        call input        ;2nd input
        mov bp,temp
        mov temp,0
        
        cmp bx,bp        ;comparing
        je eq
        cmp bx,bp
        jg bg
        lea dx,s         ;output '<'
        mov ah,9
        int 21h
        jmp L
       eq:               ;output '='
        lea dx,e
        mov ah,9
        int 21h
        jmp L
       bg:              ;output '>'
        lea dx,b
        mov ah,9
        int 21h
       L: 
        call newline
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