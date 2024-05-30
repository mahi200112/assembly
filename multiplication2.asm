.model small                                                                        
.stack 100h

.data
    message1 db 'Enter first digit: $'
    message2 db 10,13,'Enter second digit: $'
    result_msg db 10,13,'Result: $'
    input1 db ?
    

.code   

main proc
    mov ax, @data
    mov ds, ax

   
    
     ;mov dx,offset message1
     mov ah,9   
     lea dx,message1
     int 21h
    
    mov ah, 01h
    int 21h
    sub al, 48      
    mov input1, al

 
   ;mov dx,offset message2
     mov ah,9
     lea dx,message2
     int 21h

    
     mov ah,1
    int 21h
    sub al,48 
           
    
    
    
    
    mul input1
    
    aam
    
    
    mov bx,ax
    
    
    mov dx,offset result_msg
    mov ah,9
    int 21h
    
    mov dl,bh
    add dl,48
    mov ah,2
    int 21h
    
    
    mov dl,bl
    add dl,48
    mov ah,2
    int 21h
            

    
    mov ah, 4ch
    int 21h
    main endp
end main