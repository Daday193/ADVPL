#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"

//Mostra as pessoas em ordem alfabética.

User Function TstOrdem()
Local aArea := GetArea()

dbSelectArea("ZZ9")//Define a área de trabalho especificada como ativa.
dbSetOrder(3)//Esta ordem é responsável sequência lógica dos registros da tabela corrente.
dbGoTop()//Move o cursor da área de trabalho ativa para o primeiro registro lógico do arquivo de dados.

Do While !EoF()

IF ZZ9->ZZ9_NOME = 'THIAGO DA SILVA AMARAL'
	Exit
ELse

	MsgAlert(ZZ9->ZZ9_NOME)
	dbSkip() //Move o cursor do registro posicionado para o próximo registro.
EndIf	
	
	//Exit //Mata o processo no primeiro nome.
	
EndDo

RestArea(aArea)
Return Nil

