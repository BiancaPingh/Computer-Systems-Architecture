TITLE lab1
.MODEL small 
.STACK 100h 
.DATA 
Message1 DB 'Hello! ',13,10, '$'
.CODE
Start: 
mov ax,@data
mov ds,ax
mov dx, offset Message1
mov ah, 09h 
int 21h
mov ah, 4ch ; Funcţia DOS cu codul 4Ch este utilizată pentru terminarea
; programului şi predarea controlului la sistem
int 21h
END Start