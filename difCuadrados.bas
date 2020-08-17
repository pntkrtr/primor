' Diferencia de cuadrados(hallar)
DIM x, y AS _UNSIGNED _INTEGER64
inicio:
CLS
INPUT "Introduzca un numero: ", z
nResultados = 0
FOR y = 1 TO 3000
    FOR x = 1 TO 3000
        IF y ^ 2 = x ^ 2 + z THEN
            nResultados = nResultados + 1
            c$ = STR$(x) + " y" + STR$(y) + " | "
            c$ = c$ + STR$(x) + " +" + STR$(y) + " =" + STR$(x + y)
            c$ = c$ + " | "
            c$ = c$ + STR$(y) + " -" + STR$(x) + " =" + STR$(y - x)
            PRINT c$
            PRINT " - - - - - - - - - - - - - - - - - - - - - "
        END IF
    NEXT x
NEXT y
IF nResultados = 1 THEN PRINT "- Su raiz cuadrada: " + STR$(SQR(z))
PRINT: PRINT "Pulse espacio para repetir u otra tecla FIN."
a$ = INPUT$(1)
IF a$ = " " THEN GOTO inicio
PRINT: PRINT "FIN DEL PROGRAMA."
END

