org 100h 
.model small
.stack 100h
.data 
    g db 'kABIR',10,13,'$' 
.code
main proc 
     lea dx,g
     mov ah,9
     int 21h
     
    exit:
     main endp
end main