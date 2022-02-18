org 100h 
.model small
.stack 100h
.data  
    ar db 100 dup(?)
.code
main proc 
       start:
        mov di,0
        call input 
        mov cx,di   
        mov di,0
        call output
        jmp start       ;jump starting
       input proc       ;input
        mov ah,1
        int 21h
        cmp al,13
        jne sum
        call newline
        ret
       sum:
        mov ar[di],al
        inc di
        jmp input   
       output proc
       print:
        mov dl,ar[di]
        int 21h
        inc di
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