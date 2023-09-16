.text                 # Inicia la secci�n de c�digo
main:                 # Punto de entrada del programa

    # Inicializar registros con los n�meros dados
    li $t0, 3         # Carga el valor 3 en el registro $t0 (num1)
    li $t1, 8         # Carga el valor 8 en el registro $t1 (num2)
    li $t2, 5         # Carga el valor 5 en el registro $t2 (num3)

    # Asignar un valor inicial a $t3 (el n�mero m�s peque�o temporal)
    move $t3, $t0     # Inicializa $t3 con el valor de $t0
    
    # Comparar el primer n�mero ($t0) con el segundo ($t1)
    blt $t0, $t1, SecondCheck  # Si $t0 < $t1, salta a SecondCheck
    move $t3, $t1              # Si no, mueve el valor de $t1 a $t3 como el menor n�mero temporal

SecondCheck: 
    # Comparar el menor n�mero temporal ($t3) con el tercer n�mero ($t2)
    blt $t3, $t2, Exit         # Si $t3 < $t2, salta a Exit
    move $t3, $t2              # Si no, mueve el valor de $t2 a $t3 como el nuevo menor n�mero

Exit:
    # Imprimir el n�mero m�s peque�o almacenado en $t3
    li $v0, 1                  # Configura el c�digo de operaci�n para imprimir un entero
    move $a0, $t3              # Mueve el n�mero m�s peque�o a $a0 para imprimirlo
    syscall                    # Realiza la llamada al sistema para imprimir

    # Salir del programa
    li $v0, 10                 # Configura el c�digo de operaci�n para salir del programa
    syscall                    # Realiza la llamada al sistema para salir
