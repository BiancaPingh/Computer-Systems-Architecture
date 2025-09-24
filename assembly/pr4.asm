.model small
.stack 100h
.data
 cifra db '1','$' ; caracterul + terminatorul de string
.code
main:
 mov ax, @data
 mov ds, ax
 mov cx, 5 ; vrem să afișăm 5 cifre
loop_start:
 lea dx, cifra
 mov ah, 09h ; funcția pentru afișare string
 int 21h
inc byte ptr [cifra] ; incrementează valoarea stocată la
; adresa variabilei cifra. Practic
; trece la '2', '3', ..., '5'
; byte - Specifică că lucrăm cu 1
; byte (8 biți).
; ptr - Prescurtare de la "pointer"
; – adică „la adresa” respectivă.
 loop loop_start
 mov ah, 4Ch
 int 21h
end main