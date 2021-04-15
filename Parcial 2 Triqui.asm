.data
    tableroTriki: .word 0, 0, 0
    	     .word 0, 0, 0
    	     
    size: .word 3
    .eqv DATA_SIZE 4
    inicio: .asciiz "Bienvenido a triqui\n"
    endline: .asciiz "\n"
    tablero: .asciiz " 1 | 2 | 3\n 4 | 5 | 6\n 7 | 8 | 9\n"   
    jugador: .asciiz "jugador: "
    movimiento: .asciiz "Inserte su movimiento del 1 al 9: "
 
.text
    main:
    	la $a0, tableroTriki
    	lw $a1, size
    	#asignacion de jugador
    	addi $t0, $zero, 1
    	
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
      	addi $t2, $zero, 0
      	while:
      	   bge $t2, 9, exit
      	   li $v0, 4
           la $a0 jugador
      	   syscall
      	   
      	   li $v0, 1
      	   add $a0, $t0, $zero
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
      	   move $t1, $v0
      	   
      	   jal jugada
      	   
      	   # movimientos ++
      	   addi $t2, $t2, 1
      	   j while
      	exit:
      	
      	li $v0, 10
      	syscall
      	
    jugada:
    	beq $t1, 1, moverjg1
    	beq $t1, 2, moverjg2
    	
    	jr $ra
    	
    moverjg1:
    	li
    	jr $ra
    
    moverjg2:
    	jr $ra
    
    	
