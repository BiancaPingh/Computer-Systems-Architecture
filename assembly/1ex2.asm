TITLE lab1
.MODEL small ; Directiva .MODEL este folosită pentru iniţializarea modelului
; de memorie, semnificând modul de organizare al informaţiei
; în memoria sistemului
.STACK 100h ; directiva .STACK defineşte o stivă de 256 octeţi, suficientă pentru
; programe mici
.DATA ; Directiva .DATA marchează începutul segmentului de date.
; În cazul de faţă acest segment conţine o variabilă şir de
; caractere, Message1, ce reţine mesajul care va fi afişat în
; program. Numerele 13, 10 codifică „Enter” - (trecerea la rândul
; următor)

mesaj DB 13, 10,'numarul incrementat:', '$'
.CODE
Start: ; Eticheta primei instrucţiuni ce urmează directivei .CODE
; marchează începutul porţiunii executabile a programului (numit
; şi punctul de intrare în program).
; Aceeaşi etichetă este utilizată după directiva END ce delimitează
; sfârşitul programului ea definind astfel punctul de unde va
; începe execuţia programului;
mov ax,@data ; Primele două instrucţiuni iniţializează registrul DS.
; Simbolul @data reprezintă numele segmentului creat cu directiva
;.DATA. Registrul DS va fi întotdeauna iniţializat pentru fişiere
; sursă în format EXE
mov ds,ax ;mereu

mov ah, 01h
int 21h

mov dx, offset mesaj
mov ah, 09h
int 21h

inc al
mov dl, al   
mov ah, 02h  
int 21h


;dl se face afisare, dupa inc se salveaza in al

mov ah, 4ch ; Funcţia DOS cu codul 4Ch este utilizată pentru terminarea
; programului şi predarea controlului la sistem
int 21h
END Start
