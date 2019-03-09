.model tiny
.code				

org 100h	

start: mov ah, 2
       mov dl, 253
       int 21h	

       mov ax, 4c00h
       int 21h

.data
msg: db 224,'Hello my wonderfull world!!!$'

end start