.MODEL SMALL
.stack 100H
.DATA
 VAL1 DB ? ; VAL1 este o variabilă, "?" înseamnă că valorile
;nu sunt inițializate.
 mesaj1 DB 10,13, 'Introduceti numarul: $'
 mesaj2 DB 10,13, 'Nu este prim $'
 mesaj3 DB 10,13, 'Este prim $'
;3
.CODE
MAIN:
 MOV AX,@DATA
 MOV DS,AX
 LEA DX,mesaj1 ; Afisarea mesajului 1
 MOV AH,09H
 INT 21H
 MOV AH,01H ; citim caracterul
 INT 21H
 SUB AL,30H ; scădem 30H din numarul introdus
 MOV VAL1,AL ; salvam rezultatul in VAL1
 MOV AH,00 ; curatarea registrului AH.
 MOV CL,2 ; CL este folosit pentru contoare
 DIV CL
 MOV CL,AL
Eticheta1:
cmp CL,1 ;comparam daca valoarea lui cl este 1
jbe Eticheta3 ;sare daca cl=1 sau cl=0
 MOV AH,00 ; curata AH
 MOV AL,VAL1 ; mutam valoarea lui VAL1 in AL
 DIV CL ; impartim loop
 CMP AH,00 ; verifica daca AH este 0
 JZ Eticheta2 ; (Jump if Zero) daca CMP returneaza
; fals, sare la LBL2, daca nu cotinua.
 DEC CL ; decrementeaza valoarea cu 1.

 JMP Eticheta1 ; sare daca nu este egal cu 0.

Eticheta2:
 MOV AH,09H ; afisam mesajul 2
 LEA DX,mesaj2
 INT 21H

JMP EXIT
Eticheta3:
 MOV AH,09H ; afisam mesajul 3
 LEA DX,mesaj3
 INT 21H
EXIT:
 MOV AH,4CH ; ieșire din program
 INT 21H
 END MAIN
