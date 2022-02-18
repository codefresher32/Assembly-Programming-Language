org 100h 
.model small
.stack 100h
.data 
    z dw 0  
    t dw 0
    ar db 100 dup(?)
.code
main proc 
       start:
        mov di,0          
        mov z,0
        mov t,0
       st:      
        mov ah,1
        int 21h
        cmp al,13    ;compare with enter
        jne l
        inc t
        mov al,32
       l: 
        cmp al,32    ;compare with space
        je psh
        mov ah,0
        inc z
        push ax
        jmp st
       psh:
        mov cx,z
        mov z,0
        lp:
         pop dx               ;storing reverse in array
         mov ar[di],dl
         inc di
         loop lp
         mov ar[di],32
         inc di
         cmp t,0
         je st
         call newline
         mov cx,di
         dec cx
         mov di,0
        ot:                  ;output array
         mov ah,2
         mov dl,ar[di]
         int 21h
         inc di
         loop ot
         call newline 
         jmp start
        
       newline proc    ;newline
        mov ah,2
        mov dl,0ah
        int 21h
        mov dl,0dh
        int 21h
        ret
       exit:
    endp main