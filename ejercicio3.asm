.text                  # Inicia la secci�n de c�digo
main:                  # Punto de entrada del programa

    # Inicializar los dos primeros t�rminos a y b
    li $t0, 0          # Carga el valor 0 en el registro $t0 (a)
    li $t1, 1          # Carga el valor 1 en el registro $t1 (b)

    # Car�cter de espacio
    li $t5, 32         # Carga el valor ASCII para espacio (32) en el registro $t5

    # Imprimir el primer t�rmino a
    li $v0, 1          # Establece el c�digo de operaci�n para imprimir un entero
    move $a0, $t0      # Mueve el valor de $t0 a $a0 para imprimirlo
    syscall            # Realiza la llamada al sistema para imprimir
    
    # Imprimir un espacio
    li $v0, 11         # Establece el c�digo de operaci�n para imprimir un car�cter
    move $a0, $t5      # Mueve el valor ASCII del espacio a $a0
    syscall            # Realiza la llamada al sistema para imprimir

    # Imprimir el segundo t�rmino b
    li $v0, 1          # Establece el c�digo de operaci�n para imprimir un entero
    move $a0, $t1      # Mueve el valor de $t1 a $a0 para imprimirlo
    syscall            # Realiza la llamada al sistema para imprimir

    # Imprimir un espacio
    li $v0, 11         # Establece el c�digo de operaci�n para imprimir un car�cter
    move $a0, $t5      # Mueve el valor ASCII del espacio a $a0
    syscall            # Realiza la llamada al sistema para imprimir

    # Calcular y mostrar los pr�ximos t�rminos
    li $t4, 1597       # Carga el valor 1597 en el registro $t4 como el t�rmino m�ximo a calcular

FibLoop:
    beq $t3, $t4, Exit # Si $t3 (el pr�ximo t�rmino) es igual a 1597, salta a Exit

    add $t3, $t0, $t1  # Calcula el pr�ximo t�rmino como la suma de $t0 y $t1 (c = a + b)
    
    # Imprimir el nuevo t�rmino
    li $v0, 1
    move $a0, $t3
    syscall

    # Imprimir un espacio
    li $v0, 11         # Establece el c�digo de operaci�n para imprimir un car�cter
    move $a0, $t5      # Mueve el valor ASCII del espacio a $a0
    syscall            # Realiza la llamada al sistema para imprimir

    # Actualizar los t�rminos a y b para la pr�xima iteraci�n
    move $t0, $t1      # Copia el valor de $t1 (b) en $t0 (a)
    move $t1, $t3      # Copia el valor de $t3 (c) en $t1 (b)

    j FibLoop          # Salto incondicional de vuelta al inicio del bucle para la pr�xima iteraci�n

Exit:                 # Etiqueta para el punto de salida del programa
    # Salir del programa
    li $v0, 10         # Establece el c�digo de operaci�n para salir del programa
    syscall            # Realiza la llamada al sistema para salir
