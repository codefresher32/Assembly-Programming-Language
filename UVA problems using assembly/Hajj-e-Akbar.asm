org 100h 
.model small
.stack 100h
.data
    hajj db 'Hajj-e-Akbar',10,13,'$'
    umrah db 'Hajj-e-Asghar',10,13,'$'   
.code
main proc 
       start:
        mov ah,1
        int 21h
        mov bl,al
       ex:
        mov ah,1
        int 21h
        cmp al,13
        jne ex
        cmp bl,'*'
        je exit
        call newline
        cmp bl,'H'
        je haj
        lea dx,umrah
        mov ah,9
        int 21h
        jmp start
       haj:
        lea dx,hajj
        mov ah,9
        int 21h
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