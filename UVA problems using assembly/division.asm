org 100h
.model small
.stack 100h
.data

.code

main proc
    and ax,0
    mov bx,10
    
    mov ax,100
    div bx 
    
    
    main endp
end main