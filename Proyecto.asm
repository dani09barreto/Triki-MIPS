.data
    
    inicio: .asciiz "Bienvenido a triqui\n"
    endline: .asciiz "\n"
    tablero: .asciiz " 1 | 2 | 3\n 4 | 5 | 6\n 7 | 8 | 9\n"   
    jugador: .asciiz "jugador 1: "
    movimiento: .asciiz "Inserte su movimiento del 1 al 9: "
    jugadaMaquina: .asciiz "la jugada de la maquina fue: \n\n"
    Anuncio: .asciiz "Recuerda 10 = X, 40 = O\n"
    winjg1: .asciiz "El ganador es el jugador 1"
    winjg2: .asciiz "El ganador es el jugador 2"
    empate: .asciiz "Nadie gano es empate"
    espacio: .asciiz "| "
    X: .asciiz "X"
    O: .asciiz "O"
    MsgA: .asciiz "Recuerde usted es el jugador 1 y el jugador 2 es la maquina \n"
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
    	addi $s1, $zero, 0
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
      	la $a0 endline
      	syscall
      	
      	li $v0, 4
      	la $a0 tablero
      	syscall
      	
      	li $v0, 4
      	la $a0 endline
      	syscall
      	
      	#movimientos = 0
      	while:
           bge $s1, 9, exit
      	   li $v0, 4
           la $a0 jugador
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
      	   beq $s1, 0, jugadaI
      	   bgt $s1, 1, Logica
      	   r:
      	 
      	   li $v0, 4
      	   la $a0, endline
      	   syscall
      	        
      	   li $v0, 4
      	   la $a0, jugadaMaquina
      	   syscall
      	   
      	   jal verTableroA
      	   jal Ganador
      	   
          #movimientos ++
      	   addi $s1, $s1, 1
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
      	
    jugada:
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
    
    jugadaI:
    	beq $t0, 10, ifjg25
	beq $t1, 10, ifjg28 
	beq $t2, 10, ifjg25
	beq $t3, 10, ifjg26
	beq $t4, 10, ifjg29
	beq $t5, 10, ifjg24
	beq $t6, 10, ifjg25
	beq $t7, 10, ifjg22
	beq $t8, 10, ifjg25	            
        jr $ra
        
    verTableroA:
        li $v0, 4
        la $a0, MsgA
        syscall
      
        li $s0, 4
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
        #jugada especifica
        JugadaEspecial:
        beq $t0,$t8,esquinas1
        beq $t2,$t6,esquinas1
        #formacion de L
        beq $t0,$t5,esqinas2
        beq $t2,$t3,esquina21
        beq $t8,$t3,esq3
        beq $t6,$t5,esq4
        beq $t6,$t1,esq5
        beq $t0,$t7,esq6
        beq $t7,$t2,esq7
        beq $t8,$t1,esq8
        #formacion en raya
        beq $t1,$t5,rya1
        beq $t1,$t3,rya2
        beq $t3,$t7,rya3
        beq $t5,$t7,rya4 
        
        j z
        rya1:
        beq $t2,3,ifjg23
        jr $ra
        rya2:
        beq $t0,1,ifjg21
        jr $ra
        rya3:
        beq $t6,7,ifjg27
        jr $ra
        rya4:
        beq $t8,9,ifjg29
        jr $ra 
        esq8:
        add $s6,$t4,$t5
        beq $s6,46,ifjg26
        
        add $s6,$t5,$t7
        beq $s6,46,ifjg26
        jr $ra
        esq7:
        add $s6,$t4,$t5
        beq $s6,46,ifjg26
        
        add $s6,$t1,$t5
        beq $s6,46,ifjg26
        jr $ra
        esq6:
        add $s6,$t4,$t3
        beq $s6,44,ifjg24
        
        add $s6,$t1,$t3
        beq $s6,44,ifjg24
        jr $ra
        esq5:
        add $s6,$t4,$t0
        beq $s6,41,ifjg21
        
        add $s6,$7,$t0
        beq $s6,41,ifjg21
        jr $ra
        esq3:
        add $s6,$t4,$t7
        beq $s6,48,ifjg28
        
        add $s6,$t5,$t7
        beq $s6,48,ifjg28
        jr $ra
        esq4:
        add $s6,$t4,$t7
        beq $s6,48,ifjg28
        
        add $s6,$t3,$t7
        beq $s6,48,ifjg28
        jr $ra
        esquinas1:
        add $s6,$t4,$t1
        beq $s6,42,ifjg22      
        jr $ra        
        esqinas2:
        add $s6,$t4,$t2
        beq $s6,43,ifjg23
        
        add $s6,$t3,$t2
        beq $s6,43,ifjg23
        jr $ra
        esquina21:
        add $s6,$t4,$t0
        beq $s6,41,ifjg21
        
        add $s6,$t5,$t0
        beq $s6,41,ifjg21
        jr $ra
      
        
    Logica:
    	
    	jal LogiGanador 
    	beq $s1,2,JugadaEspecial
    	z:
        #Horizontales primera linea
     	add $s6, $t1, $t0
     	add $s6, $s6, $t2     	
      	beq  $s6,23,AnalisisH1
      	
     	add $s6, $t1, $t2
     	add $s6, $s6, $t0      	
      	beq  $s6,21,AnalisisH1
      	
      	add $s6, $t2, $t0
     	add $s6, $s6, $t1      	
      	beq  $s6,22,AnalisisH1
      	h1:
        #horizontales segunda linea
     	add $s6, $t3, $t4
     	add $s6, $s6, $t5
      	beq  $s6,26,AnalisisH2
      	
      	add $s6, $t3, $t5
      	add $s6, $s6, $t4
      	beq  $s6,25,AnalisisH2
      	
      	add $s6, $t5, $t4
      	add $s6, $s6, $t3
      	beq  $s6,24,AnalisisH2 
      	h2:    	
        #horizontales tercera linea
     	add $s6, $t6, $t7  
     	add $s6, $s6, $t8    	
      	beq  $s6,29,AnalisisH3  
      	
      	add $s6, $t6, $t8      	
     	add $s6, $s6, $t7    	
      	beq  $s6,28,AnalisisH3 
      	
      	add $s6, $t8, $t7          	  	
     	add $s6, $s6, $t6    	
      	beq  $s6,27,AnalisisH3 
      	h3:
        #Verticales fila 1
        add $s6, $t0, $t3
        add $s6, $s6, $t6
      	beq  $s6,27,AnalisisV1
      	
      	add $s6, $t0, $t6
        add $s6, $s6, $t3
      	beq  $s6,24,AnalisisV1
      	
      	add $s6, $t6, $t3
        add $s6, $s6, $t0
      	beq  $s6,21,AnalisisV1
      	v1:
        #verticales fila 2  	
      	add $s6, $t1, $t4
      	add $s6, $s6, $t7
      	beq  $s6,28,AnalisisV2 
      	
      	add $s6, $t1, $t7
      	add $s6, $s6, $t4
      	beq  $s6,25,AnalisisV2 
      	 
      	add $s6, $t7, $t4
      	add $s6, $s6, $t1
      	beq  $s6,22,AnalisisV2 
      	v2:
        #vertical fila 3  	
      	add $s6, $t2, $t5
      	add $s6, $s6, $t8      	
      	beq  $s6,29,AnalisisV3 
      	
      	add $s6, $t2, $t8      	
      	add $s6, $s6, $t5      	
      	beq  $s6,26,AnalisisV3 
      	 
      	add $s6, $t5, $t8      	
      	add $s6, $s6, $t2      	
      	beq  $s6,23,AnalisisV3 
      	v3:
        #diagonales derecha
        add $s6, $t0, $t4
        add $s6, $s6, $t8      	
      	ble $s6,29,AnalisisD1
      	
      	add $s6, $t8, $t4      	
        add $s6, $s6, $t0      	
      	beq  $s6,21,AnalisisD1
      	
      	add $s6, $t0, $t8      	
        add $s6, $s6, $t4      	
      	beq  $s6,25,AnalisisD1
      	D1:
        # diagolanles izquierda	
        add $s6, $t2, $t4
        add $s6, $s6, $t6      	
        beq  $s6,27,AnalisisD2
      
        add $s6, $t6, $t4      	
        add $s6, $s6, $t2      	
        beq  $s6,23,AnalisisD2
      
        add $s6, $t2, $t6      	
        add $s6, $s6, $t4      	
        beq  $s6,25,AnalisisD2    	
       	D2:
        j r
        
    #Funciones de analisis defensa    
    AnalisisH1:
    	beq $t0, $t1,ifjg23
    	beq $t0, $t2,ifjg22
    	beq $t2, $t1,ifjg21
    	j h1
    
    AnalisisH2:
    	beq $t3,$t4,ifjg26
    	beq $t5,$t4,ifjg24
    	beq $t3,$t5,ifjg25
    	j h2
    	
    AnalisisH3:
    	beq $t7,$t8,ifjg27
    	beq $t6, $t8, ifjg28
    	beq $t7, $t6, ifjg29
        j h3
    	
    AnalisisV1:
	beq $t0, $t6, ifjg24
	beq $t0, $t3, ifjg27
	beq $t3, $t6, ifjg21
        j v1
    	
    AnalisisV2:
    	beq $t1,$t4, ifjg28
        beq $t1,$t7, ifjg25
        beq $t7,$t4, ifjg22
        j v2
    	
    AnalisisV3:
    	beq $t2,$t5,ifjg29
        beq $t2,$t8,ifjg26
        beq $t8,$t5,ifjg23
        j v3
    	  
    AnalisisD2:
       beq $t2,$t4,ifjg27
       beq $t2,$t6,ifjg25
       beq $t4,$t6,ifjg23
       j D2
       
    AnalisisD1:
       beq $t0,$t4,ifjg29
       beq $t8,$t4,ifjg21
       beq $t0,$t8,ifjg25
       j D1	
        
    LogiGanador:
       #Horizontales primera linea
       add $s6, $t1, $t0   
       add $s6,$s6,$t2   	
       beq $s6,83,AnalisisGH1
      	
       add $s6, $t1, $t2    
       add $s6,$s6,$t0  	
       beq $s6,81,AnalisisGH1
      	
       add $s6, $t2, $t0      	
       add $s6,$s6,$t1  	
       beq $s6,82,AnalisisGH1
       Gh1:
       #horizontales segunda linea
       add $s6, $t3, $t4
       add $s6,$s6,$t5
       beq $s6,86,AnalisisGH2
      	
       add $s6, $t3, $t5
       add $s6, $s6, $t4
       beq $s6,85,AnalisisGH2 
      	
       add $s6, $t5, $t4
       add $s6,$s6,$t3
       beq $s6,84,AnalisisGH2  
       Gh2:     	
       #horizontales tercera linea
       add $s6, $t6, $t7    
       add $s6,$s6,$t8  	
       beq $s6,89,AnalisisGH3  
      	
       add $s6, $t6, $t8    
       add $s6,$s6,$t7  	
       beq $s6,88,AnalisisGH3 
      	
       add $s6, $t8, $t7  
       add $s6,$s6, $t6        	  	
       beq $s6,87,AnalisisGH3 
       Gh3:
       #Verticales fila 1
       add $s6, $t0, $t3
       add $s6,$s6, $t6
       beq $s6,87,AnalisisGV1
      	
       add $s6, $t0, $t6
       add $s6,$s6,$t3
       beq $s6,84,AnalisisGV1
      	
       add $s6, $t6, $t3
       add $s6,$s6, $t0
       beq $s6,81,AnalisisGV1 
       Gv1:
       #verticales fila 2  	
       add $s6, $t1, $t4
       add $s6,$s6, $t7
       beq $s6,88,AnalisisGV2 
      	
       add $s6, $t1, $t7
       add $s6, $s6,$t4
       beq $s6,85,AnalisisGV2
      	 
       add $s6, $t7, $t4
       add $s6, $s6,$t1
       beq $s6,82,AnalisisGV2
       Gv2:
       #vertical fila 3  	
       add $s6, $t2, $t5     
       add $s6,$s6, $t8 	
       beq $s6,89,AnalisisGV3 
      	
       add $s6,$t2, $t8      	
       add $s6, $t2, $t5   
       beq $s6,86,AnalisisGV3 
      	 
           	
       add $s6, $t8, $t5     
       add $s6,$s6, $t2 	
       beq $s6,83,AnalisisGV3 
       Gv3:
       #diagonales derecha
       add $s6, $t0, $t4   
       add $s6,$s6,$t8   	
       beq $s6,89,AnalisisGD1
     	
       add $s6, $t8, $t4    	
       add $s6,$s6,$t0   	
       beq $s6,81,AnalisisGD1
      	
       add $s6, $t0, $t8      	
       add $s6,$s6,$t4   	
       beq $s6,85,AnalisisGD1
       GD1:
       # diagolanles izquierda	
       add $s6, $t2, $t4 
       add $s6,$s6, $t6     	
       beq $s6,87,AnalisisGD2
      
       add $s6, $t6, $t4      	
       add $s6,$s6, $t2     	
       beq $s6,83,AnalisisGD2
      
       add $s6, $t2, $t6      	
       add $s6,$s6, $t4     	
       beq $s6,85,AnalisisGD2
       GD2:  
        
       jr $ra
    
    AnalisisGD2:
        beq $t2,$t4,ifjg27
       beq $t2,$t6,ifjg25
       beq $t4,$t6,ifjg23
       j GD2
        
    AnalisisGD1:
       beq $t0,$t4,ifjg29
       beq $t8,$t4,ifjg21
       beq $t0,$t8,ifjg25
       j GD1
       
    AnalisisGV1:
       beq $t0, $t6, ifjg24
	beq $t0, $t3, ifjg27
	beq $t3, $t6, ifjg21
        j Gv1
    AnalisisGV2:
        beq $t1,$t4, ifjg28
        beq $t1,$t7, ifjg25
        beq $t7,$t4, ifjg22
        j Gv2
        
    AnalisisGV3:
        beq $t2,$t5,ifjg29
        beq $t2,$t8,ifjg26
        beq $t8,$t5,ifjg23
        j Gv3
    
    AnalisisGH1:
        beq $t0, $t1,ifjg23
    	beq $t0, $t2,ifjg22
    	beq $t2, $t1,ifjg21
    	j Gh1     
    
    AnalisisGH2:
        beq $t3,$t4,ifjg26
    	beq $t5,$t4,ifjg24
    	beq $t3,$t5,ifjg25
    	j Gh2
    
    AnalisisGH3:
        beq $t7,$t8,ifjg27
    	beq $t6, $t8, ifjg28
    	beq $t7, $t6, ifjg29
        j Gh3  
                         	                       	   
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
    	move $t8, $s3
    	jr $ra
    	
    ifjg21:
	move $t0,$s4
	addi $s1, $s1 , 1
	j r

    ifjg22:
	move $t1,$s4
	addi $s1, $s1 , 1
	j r

    ifjg23:
	move $t2,$s4
	addi $s1, $s1 , 1
	j r
	
    ifjg24:
	move $t3,$s4
	addi $s1, $s1 , 1
	j r

    ifjg25:
	move $t4,$s4
	addi $s1, $s1 , 1
	j r

    ifjg26:
	move $t5,$s4
	addi $s1, $s1 , 1
	j r
	
    ifjg27:
	move $t6,$s4
	addi $s1, $s1 , 1
	j r

    ifjg28:
	move $t7,$s4
	addi $s1, $s1 , 1
	j r

    ifjg29:
	move $t8,$s4
	addi $s1, $s1 , 1
	j r
	
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
