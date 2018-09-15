#INCLUDE 'Protheus.ch'
#INCLUDE "TOTVS.CH"

User Function TelAviso()
	Local cTitulo 	:= 'TESTE THIAGO'
	Local cTexto 	:= 'Isso é um teste!'
	Local aBotoes 	:= {"CONFIRMA","CANCELA"}
	Local nTamanho 	:= 1
	Local nOpc		:= 0


	nOpc :=	AVISO(cTitulo, cTexto, aBotoes, nTamanho) 
	
If nOpc	==	1
	MsgInfo("O usuário confirmou!")
Else
	MsgInfo("O usuário cancelou!")
Endif

Return
