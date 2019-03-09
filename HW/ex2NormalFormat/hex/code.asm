.model tiny
.code

org 100h


start: mov bx, 254 ; put some number to register
       mov ax, bx
       mov dl, 16 ; put 16 to divisor

	mov cx, 1  

division: div dl  
          cmp ah, 10
          jae print_alphabet
          add ah, '0' ; number to ascii
          jmp after_alph_write

print_alphabet:
         sub ah, 10
         add ah, 'A'
      
	after_alph_write:
          mov dl, ah  ; number to print  
          mov dh, al
          
          mov ax, 0
          mov al, dl
          push ax
          inc cx	
		
          mov dl, 16 ; put 2 as divider          

          mov ah, 0 ; remained part to 0
          mov al, dh ; put quotient to ax
          cmp al, 0 ; if = 0 go out of function
         jne division
       

       printing:
                 pop ax
                 mov dl, al
                 mov ah, 2
                 int 21h
                 dec cx
                 cmp cx, 0
                 jne printing

       mov ax, 4c00h

       int 21h

end start