' Calculo de numeros primos
' Algoritmo de Martin Parra
' Vera-Garrucha 31/03/2020
SCREEN _NEWIMAGE(1200, 750, 256)
_SCREENMOVE 0, 0
titulo$ = "Calculo de numeros primos por el Algoritmo de Martin Parra."
titulo$ = titulo$ + " Use [Espacio], [D] o [Q] para controlar."
_TITLE titulo$
DIM x AS _UNSIGNED _INTEGER64
DIM y AS _UNSIGNED _INTEGER64
delay = 1
x = 5
inicio:
primo = 1
FOR y = 2 TO x \ 2
    IF (x MOD y) = 0 THEN
        primo = 1
    END IF
NEXT y
IF primo = 1 THEN PRINT STR$(x);
x = x + 2
IF delay = 1 THEN _DELAY 0.02
' La tecla espacio hace una pausa
a$ = UCASE$(INKEY$)
IF a$ = " " THEN pausa$ = INPUT$(1) ' Pausa
IF a$ = "D" THEN delay = delay * -1 ' Delay On/Off
IF a$ = "Q" THEN END ' Fin
GOTO inicio
