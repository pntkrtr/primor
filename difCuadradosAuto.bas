' Diferencia de cuadrados(hallar) automatico
SCREEN _NEWIMAGE(1200, 750, 256): _SCREENMOVE 0, 0
_TITLE "Diferencia de cuadrados. Martin Parra y Victor Espinosa. Vera-Garrucha. 7 de Abril de 2020"
DIM x, y, z AS _UNSIGNED _INTEGER64
FOR z = 1 TO 1000 STEP 2
    'CLS
    nResultados = 0
    COLOR 15
    IF esPrimo(z) = 1 THEN COLOR 14
    PRINT "Operamos con" + STR$(z)
    COLOR 7
    FOR y = 1 TO 1000
        FOR x = 1 TO 1000
            IF y ^ 2 = x ^ 2 + z THEN
                COLOR 15
                IF esPrimo(y) = 1 THEN COLOR 14
                PRINT STR$(y);
                COLOR 7
                PRINT " y";
                COLOR 15
                IF esPrimo(y) = 1 THEN COLOR 14
                PRINT STR$(y);
                COLOR 7
                nResultados = nResultados + 1
                c$ = " | "
                c$ = c$ + STR$(x) + " +" + STR$(y) + " =" + STR$(x + y)
                c$ = c$ + " | "
                c$ = c$ + STR$(y) + " -" + STR$(x) + " =" + STR$(y - x)
                PRINT c$
                PRINT " - - - - - - - - - - - - - - - - - - - - - "
            END IF
        NEXT x
    NEXT y
    IF nResultados = 1 THEN PRINT "- Su raiz cuadrada: " + STR$(SQR(z))
    SLEEP 3
    a$ = UCASE$(INKEY$)
    IF a$ = " " THEN END
    IF a$ = "P" THEN pausa$ = INPUT$(1)
NEXT z
END
FUNCTION esPrimo (n AS INTEGER)
primo = 1
FOR y = 2 TO n \ 2
    IF (n MOD y) = 0 THEN
        primo = 0
    END IF
NEXT
esPrimo = primo
END FUNCTION

