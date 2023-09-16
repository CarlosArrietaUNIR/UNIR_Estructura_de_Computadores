.text                 # Inicia la secci�n de c�digo
main:                 # Punto de entrada del programa

    # Inicializar registros con los n�meros dados
    li $t0, 4         # Carga el valor 4 en el registro $t0 (num1)
    li $t1, 6         # Carga el valor 6 en el registro $t1 (num2)
    li $t2, 9         # Carga el valor 9 en el registro $t2 (num3)
    
    # Comparar el primer n�mero ($t0) con el segundo ($t1)
    bgt $t0, $t1, SecondCheck  # Si $t0 > $t1, salta a SecondCheck
    move $t3, $t1              # Si no, mueve el valor de $t1 a $t3 como el mayor n�mero temporal

SecondCheck: 
    # Comparar el mayor n�mero temporal ($t3) con el tercer n�mero ($t2)
    bgt $t3, $t2, Exit         # Si $t3 > $t2, salta a Exit
    move $t3, $t2              # Si no, mueve el valor de $t2 a $t3 como el nuevo mayor n�mero

Exit:
    # Imprimir el n�mero m�s grande almacenado en $t3
    li $v0, 1                  # Configura el c�digo de operaci�n para imprimir un entero
    move $a0, $t3              # Mueve el n�mero m�s grande a $a0 para imprimirlo
    syscall                    # Realiza la llamada al sistema para imprimir

    # Salir del programa
    li $v0, 10                 # Configura el c�digo de operaci�n para salir del programa
    syscall                    # Realiza la llamada al sistema para salir
