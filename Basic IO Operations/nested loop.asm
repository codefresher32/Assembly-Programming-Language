.model small
.stack 100h
.data
.code

main proc
    mov cx,5
    mov bx,5
    
    top:
        mov ah,2
        mov dl,'*'
        int 21h
        dec bx
        
        cmp bx,0
        je exit
        jmp top
        
    exit:
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        mov bx,5
        loop top
       
        mov ah,4ch 
        int 21h
        main endp
end main
       