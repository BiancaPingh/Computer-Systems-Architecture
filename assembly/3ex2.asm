.model small
.stack 100h
.data
 numeProg db 13, 10, 'Transformare caracter$', 13, 10, '$'
 mesajCitire db 13, 10, ' Introduceti litera mica: $'
 mesajAfisare db 13, 10, ' Litera mare este: $'
.code
main:
 mov ax, @data
 mov ds, ax
 ; Afiseaza numele programului
 mov dx, offset numeProg
 mov ah, 09h
 int 21h
 ; Afiseaza mesajul de citire
 mov dx, offset mesajCitire
 mov ah, 09h
 int 21h
 ; Citeste un caracter cu ecou
 mov ah, 01h
 int 21h

 mov bl, al
 cmp bl, 60h
 jle main
 cmp bl, 7Ah
 jg main
 sub bl, 20h ; converteste in majuscula
 ; Afiseaza mesajul de afisare
 mov dx, offset mesajAfisare
 mov ah, 09h
 int 21h
 ; Afiseaza litera mare
 mov dl, bl
 mov ah, 2
 int 21h
 ; Iesire
 mov ah, 4Ch
 int 21h
end main