#include 'protheus.ch'
#include 'parmtype.ch'
#Include 'TopConn.ch'

user function ForNext()
	Local aArea := GetArea()
	Local nMes 	:= 1
	Local aMeses := {"JANEIRO","FEVEREIRO","MARÇO"}
	Local lOk	:= .F.
	Local nVlr1 := 5
	Local nVlr2 := 2
	
	nSegundos	:= SECONDS()
	
If 	MSGYESNO("Deseja adcionar mês?","Atenção")
	
	aADD(aMeses,"ABRIL")
	
	For nMes := 1 to Len(aMeses)
		MsgInfo("O mês atual é: " + cValtoChar(aMeses[nMes]))	
	Next nMes

	lOk == .T.
		MsgInfo("Os testes deram OK!")
Else
	//dbSelectArea("SA1")
	//Alert("O usuário " + ALLTRIM(A1_NOME) + " cancelou!")
	
	nResult := nVlr1%nVlr2 //Resto de divisão.
	Alert("O resto da divisão é " + cValtoChar(nResult))
	
	
		If nResult == 1
			Alert("O número " + cValtoChar(nVlr1) + " é Impar!")
		Else
			MsgInfo("O número " + cValtoChar(nVlr1) + " é Par!")
		Endif
	
		MsgInfo("Os testes não deram OK!")
Endif	

MsgInfo("O tempo de processamento foi: " + ALLTRIM(Str(SECONDS() - nSegundos)))

RestArea(aArea)
	
return