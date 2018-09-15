#include "PROTHEUS.CH"
#include "TOPCONN.CH"
#include "TOTVS.CH"


User Function MsgYesNo()
	Local nNum1 := 100
	Local nNum2 := 200
	Local lOk := .T.
	Local cTexto := "Deseja continuar?"
	Local cTitulo := "Atenção"
	Local dData := DATE()
	
If 	MSGYESNO(“cTexto”,“cTitulo”)
	Alert("O resultado da soma é: " + cValToChar(nNum1 + nNum2))
	
Else 
	Alert("Programa cancelado " + cValToChar(DATE()))

EndIf

Return