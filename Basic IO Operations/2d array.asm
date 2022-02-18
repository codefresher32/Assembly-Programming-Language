org 100h 
.model small
.stack 100h
.data
    x dw 0
    y dw 10 
    z dw 0
    temp dw 0
    t dw 0 
    ar dw 100 dup(?)  
.code
main proc
        mov ax,@data
        mov ds,ax 
        
        mov temp,0
        mov z,0
        call input
        mov ax,temp
        dec ax
        add ax,ax
        mov t,ax
        mov di,0
        mov bp,0
        
       st:                     ;2d array in
        mov bp,0
        inp:
         mov temp,0
         call input 
         mov ax,temp
         mov ar[di][bp],ax
         cmp bp,t
         je 3rd
         add bp,2 
         jmp inp
        3rd:
         cmp di,t
         je next
         add di,2
         jmp st
         
        next: 
         
         mov di,0
       sst:                     ;2d array in
        mov bp,0
        nnd:
         mov z,0 
         mov ax,ar[di][bp] 
         call output
         call space
         cmp bp,t
         je rrd
         add bp,2 
         jmp nnd
        rrd:
         call newline
         cmp di,t
         je next
         add di,2
         jmp sst
       
        jmp exit        
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
        endp main
 end main 