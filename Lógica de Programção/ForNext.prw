#include 'protheus.ch'
#include 'parmtype.ch'
#Include 'TopConn.ch'

user function ForNext()
	Local aArea := GetArea()
	Local nMes 	:= 1
	Local aMeses := {"JANEIRO","FEVEREIRO","MAR�O"}
	Local lOk	:= .F.
	Local nVlr1 := 5
	Local nVlr2 := 2
	
	nSegundos	:= SECONDS()
	
If 	MSGYESNO("Deseja adcionar m�s?","Aten��o")
	
	aADD(aMeses,"ABRIL")
	
	For nMes := 1 to Len(aMeses)
		MsgInfo("O m�s atual �: " + cValtoChar(aMeses[nMes]))	
	Next nMes

	lOk == .T.
		MsgInfo("Os testes deram OK!")
Else
	//dbSelectArea("SA1")
	//Alert("O usu�rio " + ALLTRIM(A1_NOME) + " cancelou!")
	
	nResult := nVlr1%nVlr2 //Resto de divis�o.
	Alert("O resto da divis�o � " + cValtoChar(nResult))
	
	
		If nResult == 1
			Alert("O n�mero " + cValtoChar(nVlr1) + " � Impar!")
		Else
			MsgInfo("O n�mero " + cValtoChar(nVlr1) + " � Par!")
		Endif
	
		MsgInfo("Os testes n�o deram OK!")
Endif	

MsgInfo("O tempo de processamento foi: " + ALLTRIM(Str(SECONDS() - nSegundos)))

RestArea(aArea)
	
return