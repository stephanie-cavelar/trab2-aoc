.data

.text
 
 #INICIAMOS CARREGANDO O PRIMEIRO ENDERE�O DISPON�VEL DE MEM�RIA NO REGISTRADOR S0
 lui $s0, 0x1001 # carrega a metade superior do endere�o de mem�ria
 ori $s0, $s0, 0x0000 # carrega a metade inferior do endere�o de mem�ria
 #EM SEGUIDA, MONTAMOS O NOSSO ARRAY NA MEM�RIA, NESSE CASO, DE 5 ELEMENTOS
 addi $t0, $0, 8 #prepara um valor para ser armazenado no vetor
 sw $t0, 0($s0) #armazena o valor no vetor
 addi $t0, $0, 8 #prepara um valor para ser armazenado no vetor
 sw $t0, 4($s0) #armazena o valor no vetor
 addi $t0, $0, 8 #prepara um valor para ser armazenado no vetor
 sw $t0, 8($s0) #armazena o valor no vetor
 addi $t0, $0, 8 #prepara um valor para ser armazenado no vetor
 sw $t0, 12($s0) #armazena o valor no vetor
 addi $t0, $0, 8 #prepara um valor para ser armazenado no vetor
 sw $t0, 16($s0) #armazena o valor no vetor
 
 #carregaos s6 e s7, que ser�o usados na chamada de fun��o 
 addi $s6, $0, 25
 addi $s7, $0, 10
 
 #realizamos as chamadas de fun��o 
 jal multiplicar_por_oito
 addi $t5, $t5,1
 jal dividir_por_quatro
 addi $t5, $t5,1
 jal comparacao_e_ou
 addi $t5, $t5,1
 
 #se o resultado carregado em t0 for 8, todos os componentes operaram corretamente
 lw $t0, 0($s1)
 
 j fim_do_programa
 
 
 
 #fun��o que multiplica os elementos do vetor por 8
 multiplicar_por_oito:
 	addi $s1, $0, 0 # i = 0
 	addi $t1, $0, 5 # t2 = 5 ( ser� usado para gerar o loop )
 loop_mpo:
 	slt $t2, $s1, $t1 # ir� comparar se s1 � menor que t2 ( ou seja, i <5 )
 	beq $t2, $0 , done_mpo # caso s1 seja maior que t2 ( ou seja, i>=5 ) atingimos a condi��o de sa�da do loop
 	sll $t2, $s1, 2 # estamos preparando o offset para a leitura na mem�ria
 	add $t2, $t2, $s0 # estamos acrescentando o offset ao endere�o inicial ( s0 )
 	lw $t3, 0($t2) # fazemos a leitura do elemento i do array e armazenamos em t3
 	sll $t3, $t3, 3 # fazemos a multiplica��o do elemnto i do array por 8
 	sw $t3, 0($t2) # retornamos com o elemento do array para a mem�ria
 	addi $s1, $s1, 1 # i+=1
 	j loop_mpo
 done_mpo:
 	jr $ra
 
 #fun��o que divide os elementos do vetor por 4
  dividir_por_quatro:
 	addi $s1, $0, 0 # i = 0
 	addi $t1, $0, 5 # t2 = 5 ( ser� usado para gerar o loop )
 loop_dpq:
 	slt $t2, $s1, $t1 # ir� comparar se s1 � menor que t2 ( ou seja, i <5 )
 	beq $t2, $0 , done_dpq # caso s1 seja maior que t2 ( ou seja, i>=5 ) atingimos a condi��o de sa�da do loop
 	sll $t2, $s1, 2 # estamos preparando o offset para a leitura na mem�ria
 	add $t2, $t2, $s0 # estamos acrescentando o offset ao endere�o inicial ( s0 )
 	lw $t3, 0($t2) # fazemos a leitura do elemento i do array e armazenamos em t3
 	sra $t3, $t3, 2 # fazemos a divisao do elemnto i do array por 4
 	sw $t3, 0($t2) # retornamos com o elemento do array para a mem�ria
 	addi $s1, $s1, 1 # i+=1
 	j loop_dpq
 done_dpq:
 	jr $ra
 	
#fun��o que faz um "or" seguido de "and" nos elementos do vetor
 comparacao_e_ou:
 	addi $s1, $0, 0 # i = 0
 	addi $t1, $0, 5 # t2 = 5 ( ser� usado para gerar o loop )
 loop_ceo:
 	slt $t2, $s1, $t1 # ir� comparar se s1 � menor que t2 ( ou seja, i <5 )
 	beq $t2, $0 , done_ceo # caso s1 seja maior que t2 ( ou seja, i>=5 ) atingimos a condi��o de sa�da do loop
 	sll $t2, $s1, 2 # estamos preparando o offset para a leitura na mem�ria
 	add $t2, $t2, $s0 # estamos acrescentando o offset ao endere�o inicial ( s0 )
 	lw $t3, 0($t2) # fazemos a leitura do elemento i do array e armazenamos em t3
 	or $t3, $t3, $s6 # fazemos a compara��o " ou " entre o elemento do vetor e o valor em s6
 	and $t3, $t3, $s7 # fazemos a compara��o " e " entre o elemento do vetor e o valor em s7
 	sw $t3, 0($t2) # retornamos com o elemento do array para a mem�ria
 	addi $s1, $s1, 1 # i+=1
 	j loop_ceo
 done_ceo:
 	jr $ra
 	
 fim_do_programa: 

 
 
 	
 
 
 
 