.model tiny
.code

org 100h


start: mov bx, 16 ; put some number to register
       mov ax, bx
       mov dl, 8 ; put 2 to divisor

division: div dl  
          add ah, '0' ; number to ascii
          mov dl, ah  ; number to print  
          mov dh, al	

          mov ah, 2    ;  printing
          int 21h       ; printing
		
          mov dl, 8 ; put 2 as divider          

          mov ah, 0 ; remained part to 0
          mov al, dh ; put quotient to ax
          cmp al, 0 ; if = 0 go out of function
         jne division
       

       mov ax, 4c00h

       int 21h

end start