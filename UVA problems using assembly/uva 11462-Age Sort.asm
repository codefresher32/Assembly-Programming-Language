org 100h 
.model small
.stack 100h
.data 
    x dw 0
    y dw 10 
    z dw 0
    temp dw 0
    n dw 0
    ar dw 100 dup(?)
.code
main proc 
       start:
        mov temp,0
        call input    ;number of element input
        mov ax,temp 
        cmp ax,0
        je exit
        dec ax
        add ax,ax
        mov n,ax
        mov di,0
       arrayin:            ;array input
        mov temp,0
        call input
        mov ax,temp
        mov ar[di],ax
        cmp di,n
        je s
        add di,2
        jmp arrayin 
       s:                      ;sort logic
        mov di,0
        mov bp,0
       sort:                   ;1st loop
         add bp,di
         add bp,2
        s1:                    ;2nd loop
         mov bx,ar[bp]
         cmp ar[di],bx
         jle s2
         mov cx,ar[di]         ;swap function
         mov ar[di],bx
         mov ar[bp],cx
        s2:
         add bp,2
         cmp bp,n
         jle s1
         mov bp,0
         add di,2
         cmp di,n
         jl sort
        mov di,0
       arrayout:               ;array output
        mov z,0
        mov ax,ar[di]
        call output
        cmp di,n
        je st
        add di,2
        jmp arrayout
       st:
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
        call space
        ret
       newline proc    ;newline
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        ret
       space proc
        mov ah,2
        mov dl,32
        int 21h
        ret
       exit:
        mov ah,4ch
        int 21h
 end main 