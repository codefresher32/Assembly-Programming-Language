org 100h 
.model small
.stack 100h
.data 
    z db 0
    t db 0
    ar db 100 dup(?)
.code
main proc
       mov ax,@data          ;load data
       mov ds,ax 
      start:
       mov t,0 
       mov z,0
       mov ah,1     ;input number of element to reverse
       int 21h
       mov bl,al
       sub bl,48
       cmp bl,0
       mov bh,0
       je exit 
       call newline
       mov di,0
      st:                    ;logic
       mov cx,bx
       inc z
       mov ah,1
       int 21h 
       cmp al,13
       je j
       mov ah,0
       push ax
       cmp bl,z
       je arrayin
       jmp st
      arrayin:               ;storing  in array in reversed
       mov z,0
       mov dx,0
       pop dx
       mov ar[di],dl
       inc di
       loop arrayin
       jmp st
      j:  
       call newline
       mov cx,di
       mov di,0
      arrayout:                ;show output
       mov ah,2
       mov dl,ar[di] 
       int 21h
       inc di  
       loop arrayout
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