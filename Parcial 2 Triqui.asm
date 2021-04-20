.data
    
    inicio: .asciiz "Bienvenido a triqui\n"
    endline: .asciiz "\n"
    tablero: .asciiz " 1 | 2 | 3\n 4 | 5 | 6\n 7 | 8 | 9\n"   
    jugador: .asciiz "jugador: "
    movimiento: .asciiz "Inserte su movimiento del 1 al 9: "
    Anuncio: .asciiz "Recuerda 10 = X, 40 = O\n"
    winjg1: .asciiz "El ganador es el jugador 1"
    winjg2: .asciiz "El ganador es el jugador 2"
    empate: .asciiz "Nadie gano es empate"
    espacio: .asciiz "| "
    X: .asciiz "X"
    O: .asciiz "O"
    pos1: .word 1
    pos2: .word 2
    pos3: .word 3
    pos4: .word 4
    pos5: .word 5
    pos6: .word 6
    pos7: .word 7
    pos8: .word 8
    pos9: .word 9
    msgjug1: .asciiz "el jugador 1 ha ganado el juego"
    msgjug2: .asciiz "el jugador 2 ha ganado el juego"
    
.text
    main:
    	#asignacion de jugador
    	addi $s0, $zero, 1
    	addi $s3, $zero, 10
    	addi $s4, $zero, 40
    	#asignacion de posiciones en el tablero
    	lw $t0, pos1 
        lw $t1, pos2
        lw $t2, pos3
        lw $t3, pos4
        lw $t4, pos5
        lw $t5, pos6
        lw $t6, pos7
        lw $t7, pos8
        lw $t8, pos9
    	
    	li $v0, 4
      	la $a0 inicio
      	syscall
      
      	li $v0, 4
      	la $a0 endline
      	syscall
      	
      	li $v0, 4
      	la $a0 tablero
      	syscall
      	
      	li $v0, 4
      	la $a0 endline
      	syscall
      	
      	# movimientos = 0
      	addi $s1, $zero, 0
      	while:
      	   bge $s1, 9, exit
      	   li $v0, 4
           la $a0 jugador
      	   syscall
      	   
      	   li $v0, 1
      	   add $a0, $s0, $zero
      	   syscall
      	
      	   li $v0, 4
      	   la $a0 endline
      	   syscall
      	
      	   li $v0, 4
      	   la $a0 endline
      	   syscall
      	
      	   li $v0, 4
      	   la $a0 movimiento
      	   syscall
      	
      	   li $v0, 5
      	   syscall
      	   move $t9, $v0
      	   
      	   jal jugada
      	   jal vertablero
      	   jal Ganador

      	   # movimientos ++
      	   addi $s1, $s1, 1
      	   jal jugadores
      	   j while
      	exit:
      	li $v0, 4
      	la $a0 endline
      	syscall
      	
      	li $v0, 4
      	la $a0 empate
      	syscall
      	
      	li $v0, 10
      	syscall
    
    #incremento o decremento de los jugadores
    jugadores:
    	bne $s0, 2, else
    	addi $s0, $s0, -1
    	jr $ra
    	
    	else:
    	  addi $s0, $s0, 1
    	  jr $ra
    	  
    #movimiento de las jugadas
    jugada:
    	beq $s0, 1, moverjg1
    	beq $s0, 2, moverjg2
    	jr $ra
    	
    moverjg1:
	beq $t9, $t0, ifjg11
	beq $t9, $t1, ifjg12
	beq $t9, $t2, ifjg13
	beq $t9, $t3, ifjg14
	beq $t9, $t4, ifjg15
	beq $t9, $t5, ifjg16
	beq $t9, $t6, ifjg17
	beq $t9, $t7, ifjg18
	beq $t9, $t8, ifjg19
    	jr $ra
    	
    ifjg11:
    	move $t0, $s3
    	jr $ra
    ifjg12:
    	move $t1, $s3
    	jr $ra
    ifjg13:
    	move $t2, $s3
    	jr $ra
    ifjg14:
    	move $t3, $s3
    	jr $ra
    ifjg15:
    	move $t4, $s3
    	jr $ra
    ifjg16:
    	move $t5, $s3
    	jr $ra
    ifjg17:
    	move $t6, $s3
    	jr $ra
    ifjg18:
    	move $t7, $s3
    	jr $ra
    ifjg19:
    	move $t8, $s0
    	jr $ra
    	
    	
    #---------------#
    moverjg2:
    	beq $t9, $t0, ifjg21
	beq $t9, $t1, ifjg22
	beq $t9, $t2, ifjg23
	beq $t9, $t3, ifjg24
	beq $t9, $t4, ifjg25
	beq $t9, $t5, ifjg26
	beq $t9, $t6, ifjg27
	beq $t9, $t7, ifjg28
	beq $t9, $t8, ifjg29
    	jr $ra
    
    ifjg21:
	move $t0,$s4
	jr $ra

    ifjg22:
	move $t1,$s4
	jr $ra

    ifjg23:
	move $t2,$s4
	jr $ra
	
    ifjg24:
	move $t3,$s4
	jr $ra

    ifjg25:
	move $t4,$s4
	jr $ra

    ifjg26:
	move $t5,$s4
	jr $ra

    ifjg27:
	move $t6,$s4
	jr $ra

    ifjg28:
	move $t7,$s4
	jr $ra

    ifjg29:
	move $t8,$s4
	jr $ra
    
    vertablero:
    	li $v0, 4
    	la $a0, Anuncio
    	syscall
    	li $v0, 1
      	add $a0, $t0, $zero
      	syscall
    	li $v0, 4
      	la $a0 espacio
      	syscall
      	li $v0, 1
      	add $a0, $t1, $zero
      	syscall
    	li $v0, 4
      	la $a0 espacio
      	syscall
      	li $v0, 1
      	add $a0, $t2, $zero
      	syscall
    	li $v0, 4
      	la $a0 endline
      	syscall
      	li $v0, 1
      	add $a0, $t3, $zero
      	syscall
    	li $v0, 4
      	la $a0 espacio
      	syscall
      	li $v0, 1
      	add $a0, $t4, $zero
      	syscall
    	li $v0, 4
      	la $a0 espacio
      	syscall
      	li $v0, 1
      	add $a0, $t5, $zero
      	syscall
    	li $v0, 4
      	la $a0 endline
      	syscall
        li $v0, 1
      	add $a0, $t6, $zero
      	syscall
      	li $v0, 4
      	la $a0 espacio
      	syscall
      	li $v0, 1
      	add $a0, $t7, $zero
      	syscall
    	li $v0, 4
      	la $a0 espacio
      	syscall
      	li $v0, 1
      	add $a0, $t8, $zero
      	syscall
    	li $v0, 4
      	la $a0 endline
      	syscall
      	
      	jr $ra
      	
      	Ganador:
      	#Horizontal:
      	add $s6, $t1, $t0
      	add $s6, $s6, $t2
      	beq $s6,30, ganajg1
      	beq $s6,120, ganajg2
      	
      	add $s6, $t3, $t4
      	add $s6, $s6, $t5
      	beq $s6,30, ganajg1
      	beq $s6,120, ganajg2
      	
      	add $s6, $t6, $t7
      	add $s6, $s6, $t8
      	beq $s6, 30, ganajg1
      	beq $s6, 120, ganajg2
      	
      	#Verticales:
      	add $s6, $t3, $t0
      	add $s6, $s6, $t6
      	beq $s6,30,ganajg1
      	beq $s6,120,ganajg2
      	
    	add $s6, $t1, $t4
      	add $s6, $s6, $t7
      	beq $s6,30,ganajg1
      	beq $s6,120,ganajg2
      	
      	add $s6, $t2, $t5
      	add $s6, $s6, $t8
      	beq $s6,30,ganajg1
      	beq $s6,120,ganajg2
    	
    	#Diagonales:
    	
    	add $s6, $t4, $t0
      	add $s6, $s6, $t8
      	beq $s6,30,ganajg1
      	beq $s6,120,ganajg2
      	
      	add $s6, $t2, $t4
      	add $s6, $s6, $t6
      	beq $s6,30,ganajg1
      	beq $s6,120,ganajg2
      	
      	jr $ra
	
	ganajg1:
	     li $v0, 4
             la $a0 winjg1
      	     syscall
      	     li $v0, 10
      	     syscall
      	     
      	ganajg2:
      	     li $v0, 4
             la $a0 winjg2
      	     syscall
      	     li $v0, 10
      	     syscall
      	     
	
      	
      
