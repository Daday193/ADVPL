#INCLUDE 'Protheus.ch'

User Function BlocCod()

	nInt := 10
		 
	bBloco := {|N| x:= 10, y:= x*N, z:= y/(x*N)}  
	
//N -> recebe nInt como par�metro (10) 
//X -> tem atribu�do o valor 10 (10) 
//Y -> resultado da multiplica��o de X por N (100) 
//Z -> resultado da divis�o de Y pela multiplica��o de X por N ( 100 / 100) = 1 
			
	nValor := EVAL(bBloco, nInt) 
	
	Alert(nValor )
	
Return