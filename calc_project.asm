.model small
.stack 100h

precision = 30  ; max digits after the dot.

.data
 text0 db 'Table of operations:$'
 msg0 db 'Sum (+): 0$'
 msg1 db 'Subtract (-): 1$'
 msg2 db 'Mul (*): 2$'
 msg3 db 'Div (/): 3$'
 msg4 db 'X^Y (^): 4$'
 msg5 db 'AND (&): 5$'
 msg6 db 'OR (|): 6$'
 msg7 db 'XOR (~): 7$'
 msg8 db 'NOT (-x): 8$'
 msg9 db 'Sin(x): 9$'
 msg10 db 'Cos (x): 10$'
 msg11 db 'Tan (x): 11$'
 msg12 db 'Factorial (!): 12$'
 msg13 db 'Inverse (1/x): 13$'
 msg14 db 'Roor square root (vx): 14$'
 msg15 db 'Power of 10 (10^x): 15$'
 msg16 db 'Exponential (e^x): 16$'
 msg17 db 'Logarithmic(logx): 17$'
 msg18 db 'Equation solving(px^2+qx+w=0): 18$'
 msg19 db 'XNOR(A.B+(-A-B)): 19$'
 msg20 db 'NOR(-(|)): 20$'
 msg21 db 'NAND(-&): 21$'
 
 text1 db 0ah,0dh,'Enter operation number [0-21]:$'
 text2 db 0ah,0dh,'Enter digits [0-999]:$'
 text3 db 0ah,0dh,'If you want to continue press '0'else, press any key to exit.... $'
  ans: db "The quotient is: $"
  
 BASE    DB      ?
    POW     DB      ?
    NL1     DB      0AH,0DH,'ENTER BASE:','$'
    NL2     DB      0AH,0DH,'ENTER POWER:','$'

NUM DB ?
    FACT DB 1H
    RES DB 10 DUP ('$')
    MSG22 DB "ENTER NUMBER : $"
    MSG23 DB 10,13,"RESULT : $" 
    
pi equ 3.14159 

.code
main proc
    include 'emu8086.inc'
    ;for user input
    define_print_string
    define_scan_num
    define_print_num
    define_print_num_uns
    
    mov ax,@data
    mov ds,ax
    
    lea dx,text0
    mov ah,9
    int 21h
    
    printn ''
    
    lea dx,msg0
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg1
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg2
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg3
    mov ah,9
    int 21h
    printn ''
   
    lea dx,msg4
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg5
    mov ah,9
    int 21h
    printn ''
     
    lea dx,msg6
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg7
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg8
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg9
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg10 
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg11
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg12
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg13
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg14
    mov ah,9
    int 21h
    printn ''
   
    lea dx,msg15
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg16
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg17
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg18
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg19
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg20
    mov ah,9
    int 21h
    printn ''
    
    lea dx,msg21
    mov ah,9
    int 21h
    printn ''
    
Repeat:
    call clear
       
    lea dx,text1
    mov ah,9
    int 21h
        
    call scan_num ; it stores the value in cx
    mov ax,cx
    
    cmp ax,0
    jnge null
    je sum
    
    cmp ax,1
    je subtract
    cmp ax,2
    je multiplication
    cmp ax,3
    je divide
    cmp ax,4
    je powerofx
    cmp ax,5
    je andgate
    cmp ax,6
    je orgate
    cmp ax,7
    je xorgate
    cmp ax,8
    je notgate
    cmp ax,9
    je sinx
    cmp ax,10
    je cosx
    cmp ax,11
    je tanx
    cmp ax,12
    je factorial
    cmp ax,13
    je inverse
    cmp ax,14
    je rootsquareroot
    cmp ax,15
    je poweroften
    cmp ax,16
    je exponential
    cmp ax,17
    je logarithmic
    cmp ax,18
    je equation
    cmp ax,19
    je xnor
    cmp ax,20
    je nor
    cmp ax,21
    je nand
    
    
sum:
  call clear
   
  lea dx,text2
  mov ah,9
  int 21h  
    
  call scan_num
  mov ax,cx
  printn ''
  
  call scan_num
  add ax,cx 
  
  printn ''  
  call print_num ;result have to be in ax
  
  printn '' 
  
  lea dx,text3
  mov ah,9
  int 21h
  
  call scan_num
  cmp cx,0
  je repeat
  jne null
 
      
subtract:
       call clear
       
       lea dx,text2
       mov ah,9
       int 21h
  
       call scan_num
       mov ax,cx
  
       printn ''
       
       call scan_num
       sub ax,cx
       printn ''
  
       call print_num
       printn ''
        
       lea dx,text3
       mov ah,9
       int 21h 
  
       call scan_num
       cmp cx,0
       je repeat
       jne null
      
  
multiplication:
  call clear
   
  lea dx,text2
  mov ah,9
  int 21h
  
  call scan_num
  mov ax,cx
  
  printn '' 
  
  call scan_num
  mul cx
  printn ''
  
  mov dx,cx
  call print_num
 
  lea dx,text3
  mov ah,9
  int 21h
  
  call scan_num
  cmp cx,0
  je repeat
  jne null

divide:
  lea dx,text2
  mov ah,9
  int 21h
  printn ''
  
  call scan_num
  mov ax,cx 
  printn ''
  
  call scan_num
  mov bx,cx
  printn ''
  printn ''
  
  call divi
  
  lea dx,text3
  mov ah,9
  int 21h
  
  call scan_num
  cmp cx,0
  je repeat
  jne null
  
  divi proc near
      mov dx,0h
      divloop:
      mov cx,ax
      sub ax,bx
      jl ende
      inc dx
      jmp divloop
      
      ende:
      mov ax,dx
      call print_num
      printn ''
      mov ax,cx
      call print_num
      
      ret
  divi endp
  
powerofx:
        LEA DX,NL1
        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H
        SUB AL,30H
        MOV BL,AL

        MOV BASE,AL

ENTER_POWER:

        LEA DX,NL2
        MOV AH,09H
        INT 21H

        MOV AH,01H
        INT 21H
        SUB AL,30H
        
        printn ''

        MOV CL,AL
        DEC CL
        MOV AX,00
        MOV AL,BASE
LBL1:

        MUL BL
        LOOP LBL1

        MOV CL,10
        DIV CL
        ADD AX,3030H
        MOV DX,AX

        MOV AH,02H
        INT 21H
        MOV DL,DH
        INT 21H 
        
        printn '' 
  
        lea dx,text3
        mov ah,9
        int 21h
  
        call scan_num
        cmp cx,0
        je repeat
        jne null

andgate:
       
       
orgate:


xorgate:
        
        
notgate:


sinx:


cosx:


tanx:



factorial:
      call clear
    printn ''
   
    LEA DX,MSG22
    MOV AH,9
    INT 21H
   
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM,AL
   
    MOV AH,0
    MOV AL,FACT
    MOV CH,0
    MOV CL,NUM
     
LABEL1: MUL CL
    LOOP LABEL1   
               
    LEA SI,RES
    ;CALL HEX2DEC  ;hexa to decimal conversion
    
                  ;display 2 decimal digit
    LEA DX,MSG23
    MOV AH,9
    INT 21H
      
    LEA DX,RES
    MOV AH,9
    INT 21H
    
           
       printn '' 
  
       lea dx,text3
       mov ah,9
       int 21h
  
       call scan_num
       cmp cx,0
       je repeat
       jne null

inverse:


rootsquareroot:
            
            
            
poweroften:
            
            
            
exponential:    
            
            

logarithmic:


equation:



xnor:



nor:



nand:


clear proc
    mov ah,0
    mov al,0
    aaa
    
    mov bh,0
    mov bl,0
    mov bx,0
    
    mov dl,0
    mov dh,0
    mov dx,0
    
    ret
    clear endp
                
null:
  jmp exit    
    
    exit:
    mov ah,4ch
    int 21h
end main