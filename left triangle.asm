.model small
.stack 100h
.data
n dw ?
msg db 10,13,"$"  

.code
main proc
    
 mov ax,@data
 mov ds,ax
    
 mov bx,1 
 
 
 
 mov cx,5
 ;mov ax,0 
 
  lea dx,msg
  mov ah,9
  int 21h
 
 
 l1:
 push cx
 mov ah,2
 mov dl,32
 
 l2: 
   
  int 21h 
  loop l2 
  
  mov cx,bx
  mov dl,'*'
  
  inc bx
  
  l3:
  int 21h
  
  loop l3
  mov ah,2
  pop cx
  
  lea dx,msg
  mov ah,9
  int 21h
  
  loop l1
         
         
  mov ah,4ch
  int 21h 
  main endp
end main

 
 
 
 