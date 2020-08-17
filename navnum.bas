' Navegador de numeros. Martin Parra y Victor Espinosa. Vera-Garrucha. 5 de Abril de 2020
SCREEN _NEWIMAGE(1200, 750, 256): _SCREENMOVE 0, 0
_TITLE "Navegador de numeros. Martin Parra y Victor Espinosa. Vera-Garrucha. 5 de Abril de 2020"
' Definimos variables
DIM numero AS _UNSIGNED _INTEGER64
DIM modulo AS _UNSIGNED _INTEGER64
DIM SHARED nFilas AS INTEGER
DIM SHARED nColumnas AS INTEGER
DIM SHARED nMaxFilas AS _UNSIGNED _INTEGER64
DIM SHARED nMaxColumnas AS _UNSIGNED _INTEGER64
DIM SHARED mGrafico AS INTEGER
' Inicializamos variables globales
nFilas = 39: nColumnas = 24
nMaxFilas = 1000: nMaxColumnas = 1000
mGrafico = -1
' Incializamos variables del programa
numero = 1: modulo = 1
' Punto de partida del programa
inicio: CLS: CALL presentaDatosEnPantalla(numero, modulo)
' Bucle infinito
DO
    a$ = UCASE$(INKEY$)
    IF a$ = CHR$(27) OR a$ = "Q" THEN COLOR 15: END
    IF (a$ = CHR$(0) + "H" OR a$ = "W") AND numero > 1 THEN numero = numero - 1: GOTO inicio
    IF (a$ = CHR$(0) + "P" OR a$ = "S") AND numero < nMaxFilas - nFilas THEN numero = numero + 1: GOTO inicio
    IF (a$ = CHR$(0) + "K" OR a$ = "A") AND modulo > 1 THEN modulo = modulo - 1: GOTO inicio
    IF (a$ = CHR$(0) + "M" OR a$ = "D") AND modulo < nMaxColumnas - nColumnas THEN modulo = modulo + 1: GOTO inicio
    IF a$ = "X" THEN GOSUB pideX: GOTO inicio
    IF a$ = "Y" THEN GOSUB pideY: GOTO inicio
    IF a$ = "G" THEN mGrafico = mGrafico * -1: GOTO inicio
    IF a$ = "F" THEN CALL guardaDatosEnArchivo(numero, modulo): GOTO inicio
LOOP
pideX:
LOCATE 44, 74: INPUT "X: ", x
IF x > 0 AND x < nMaxColumnas - nColumnas THEN modulo = x
RETURN
pideY:
LOCATE 45, 74: INPUT "Y: ", y
IF y > 0 AND y < nMaxFilas - nFilas THEN numero = y
RETURN
' Subrutina de presentacion de datos
SUB presentaDatosEnPantalla (nu AS _UNSIGNED _INTEGER64, mo AS _UNSIGNED _INTEGER64)
' Titulo
LOCATE 1, 30: COLOR 3
PRINT "Navegador de numeros. Martin Parra y Victor Espinosa. Vera-Garrucha. 5 de Abril de 2020"
' Primera fila
FOR columna = 0 TO nColumnas
    COLOR 15: IF esPrimo(mo + columna) = 1 THEN COLOR 14
    LOCATE 3, 15 + (5 * columna): PRINT mo + columna
NEXT
' Filas de datos
FOR fila = 0 TO nFilas
    ' Primera columna
    COLOR 15: IF esPrimo(nu + fila) = 1 THEN COLOR 14
    LOCATE 4 + fila, 10: PRINT STR$(nu + fila)
    FOR columnaDatos = 0 TO nColumnas
        ' Campos para fila de datos
        modu = (nu + fila) MOD (mo + columnaDatos) ' modulo
        COLOR 7: IF modu = 0 THEN COLOR 15
        LOCATE 4 + fila, 15 + (5 * columnaDatos)
        IF mGrafico = 1 THEN
            IF modu > 0 AND modu < 248 THEN COLOR modu
            IF modu > 0 THEN PRINT "#" ELSE PRINT modu
            textMg$ = "ON"
        ELSE
            PRINT modu
            textMg$ = "OFF"
        END IF
    NEXT
NEXT
' Barra de instrucciones
COLOR 9:
LOCATE 44, 11: PRINT "[Q] o [ESC] para salir"
LOCATE 45, 11: PRINT "[F] Guardar vista en archivo";
LOCATE 44, 41: PRINT "|  [X] Lleva a la posicion X"
LOCATE 45, 41: PRINT "|  [Y] Lleva a la posicion Y";
LOCATE 44, 71: PRINT "|"
LOCATE 45, 71: PRINT "|";
LOCATE 44, 88: PRINT "|  [G] Cambio de modo visual - MODO: " + textMg$;
LOCATE 45, 88: PRINT "|  Para mover use las teclas del cursor o W,A,S,D";
END SUB
' Subrutina de guardado de pantalla en archivo
SUB guardaDatosEnArchivo (nu AS _UNSIGNED _INTEGER64, mo AS _UNSIGNED _INTEGER64)
nombreArchivo$ = "navNumCaptura" + STR$(TIMER) + ".csv"
OPEN nombreArchivo$ FOR OUTPUT AS #1
' Primera fila
cadena$ = "-----"
FOR columna = 0 TO nColumnas
    IF esPrimo(mo + columna) = 1 THEN
        cadena$ = cadena$ + ",p"
    ELSE
        cadena$ = cadena$ + ",n"
    END IF
    cadena$ = cadena$ + STR$(mo + columna)
NEXT
PRINT #1, cadena$
' Filas de datos
FOR fila = 0 TO nFilas
    ' Primera columna
    IF esPrimo(nu + fila) = 1 THEN
        cadena$ = "p"
    ELSE
        cadena$ = "n"
    END IF
    cadena$ = cadena$ + STR$(nu + fila)
    FOR columnaDatos = 0 TO nColumnas
        ' Campos para fila de datos
        modu = (nu + fila) MOD (mo + columnaDatos) ' modulo
        cadena$ = cadena$ + "," + STR$(modu)
    NEXT
    PRINT #1, cadena$
NEXT
CLOSE #1
LOCATE 44, 74: PRINT "Guardado: " + nombreArchivo$ + SPACE$(30);
LOCATE 45, 74: PRINT "Pulse una tecla para continuar." + SPACE$(40);
pausa$ = INPUT$(1)
END SUB
' Funcion que devuelve si es primo el numero pasado como parametro. 1=Primo
FUNCTION esPrimo (n AS INTEGER)
primo = 1
FOR y = 2 TO n / 2
    IF (n MOD y) = 0 THEN
        primo = 0
    END IF
NEXT
esPrimo = primo
END FUNCTION
