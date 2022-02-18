 .model small  
 .stack 100h
 .code
 
 main proc 
    
    mov ah,1      ;input
    int 21h 
    mov bl,al 
    
    mov ah,2      ;newline
    mov dl,0ah
    int 21h 
    mov dl,0dh
    int 21h
    
    mov ah,2      ;output
    mov dl,bl
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
 end main
    