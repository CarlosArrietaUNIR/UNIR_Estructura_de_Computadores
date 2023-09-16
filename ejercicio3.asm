.text                  # Inicia la sección de código
main:                  # Punto de entrada del programa

    # Inicializar los dos primeros términos a y b
    li $t0, 0          # Carga el valor 0 en el registro $t0 (a)
    li $t1, 1          # Carga el valor 1 en el registro $t1 (b)

    # Carácter de espacio
    li $t5, 32         # Carga el valor ASCII para espacio (32) en el registro $t5

    # Imprimir el primer término a
    li $v0, 1          # Establece el código de operación para imprimir un entero
    move $a0, $t0      # Mueve el valor de $t0 a $a0 para imprimirlo
    syscall            # Realiza la llamada al sistema para imprimir
    
    # Imprimir un espacio
    li $v0, 11         # Establece el código de operación para imprimir un carácter
    move $a0, $t5      # Mueve el valor ASCII del espacio a $a0
    syscall            # Realiza la llamada al sistema para imprimir

    # Imprimir el segundo término b
    li $v0, 1          # Establece el código de operación para imprimir un entero
    move $a0, $t1      # Mueve el valor de $t1 a $a0 para imprimirlo
    syscall            # Realiza la llamada al sistema para imprimir

    # Imprimir un espacio
    li $v0, 11         # Establece el código de operación para imprimir un carácter
    move $a0, $t5      # Mueve el valor ASCII del espacio a $a0
    syscall            # Realiza la llamada al sistema para imprimir

    # Calcular y mostrar los próximos términos
    li $t4, 1597       # Carga el valor 1597 en el registro $t4 como el término máximo a calcular

FibLoop:
    beq $t3, $t4, Exit # Si $t3 (el próximo término) es igual a 1597, salta a Exit

    add $t3, $t0, $t1  # Calcula el próximo término como la suma de $t0 y $t1 (c = a + b)
    
    # Imprimir el nuevo término
    li $v0, 1
    move $a0, $t3
    syscall

    # Imprimir un espacio
    li $v0, 11         # Establece el código de operación para imprimir un carácter
    move $a0, $t5      # Mueve el valor ASCII del espacio a $a0
    syscall            # Realiza la llamada al sistema para imprimir

    # Actualizar los términos a y b para la próxima iteración
    move $t0, $t1      # Copia el valor de $t1 (b) en $t0 (a)
    move $t1, $t3      # Copia el valor de $t3 (c) en $t1 (b)

    j FibLoop          # Salto incondicional de vuelta al inicio del bucle para la próxima iteración

Exit:                 # Etiqueta para el punto de salida del programa
    # Salir del programa
    li $v0, 10         # Establece el código de operación para salir del programa
    syscall            # Realiza la llamada al sistema para salir
