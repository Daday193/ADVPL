#INCLUDE 'Protheus.ch'

User Function BlocCod()

	nInt := 10
		 
	bBloco := {|N| x:= 10, y:= x*N, z:= y/(x*N)}  
	
//N -> recebe nInt como parâmetro (10) 
//X -> tem atribuído o valor 10 (10) 
//Y -> resultado da multiplicação de X por N (100) 
//Z -> resultado da divisão de Y pela multiplicação de X por N ( 100 / 100) = 1 
			
	nValor := EVAL(bBloco, nInt) 
	
	Alert(nValor )
	
Return