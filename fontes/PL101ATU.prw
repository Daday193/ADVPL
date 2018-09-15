#include "totvs.ch"
#include "protheus.ch"
#include "Topconn.ch"

User Function PL101ATU()
	Local aArea := GetArea()
	Local aRetPto := {} 
	
	DbSelectArea("BA1")
	DbSetOrder(1)

	aAdd(aRetPto,BA1->BA1_TIPREG)
	
	If (aRetPto,[1]) == '00'
		Alert("Usuário titular")

	ElseIf Alert("Usuário dependente")

	EndIf

	RestArea(aArea) 

Return



ALERT(FindFunction("U_PL101ATU"))