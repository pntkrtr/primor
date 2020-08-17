' Calculo de numeros primos
' Algoritmo de Martin Parra
' Vera-Garrucha 31/03/2020
SCREEN _NEWIMAGE(1200, 750, 256)
_SCREENMOVE 0, 0
titulo$ = "Piramide de numeros primos por el Algoritmo de Martin Parra."
_TITLE titulo$
DIM x AS _UNSIGNED _INTEGER64
DIM y AS _UNSIGNED _INTEGER64
_FONT 8
FOR x = 5 TO 300 STEP 2
    primo = 1
    COLOR 15
    PRINT "@";
    FOR y = 2 TO x / 2
        IF y > 250 THEN

        END IF
        COLOR 15
        IF (x MOD y) = 0 THEN
            COLOR 15
            ' Coloreamos algunas diagonales
            IF y = x \ 3 THEN COLOR 11
            IF y = x \ 5 THEN COLOR 10
            IF y = x \ 7 THEN COLOR 9
            IF y = x \ 9 THEN COLOR 8
            IF y = x \ 11 THEN COLOR 7
            IF y = x \ 13 THEN COLOR 55
            IF y = x \ 17 THEN COLOR 15
            IF y = x \ 19 THEN COLOR 48
            IF y = x \ 23 THEN COLOR 92
            IF y = x \ 29 THEN COLOR 60
            IF y = x \ 31 THEN COLOR 32
            IF y = x \ 37 THEN COLOR 14
            ' ... y asi sucesivamente!
            primo = 0
        ELSE
            COLOR 12
        END IF
        PRINT "*";
    NEXT
    texto$ = ""
    IF primo = 1 THEN texto$ = STR$(x)
    COLOR 14
    PRINT texto$
    _DELAY 0.5
NEXT
COLOR 15
END

