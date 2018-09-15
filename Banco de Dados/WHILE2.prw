#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"

//Mostra as pessoas em ordem alfab�tica.

User Function TstOrdem()
Local aArea := GetArea()

dbSelectArea("ZZ9")//Define a �rea de trabalho especificada como ativa.
dbSetOrder(3)//Esta ordem � respons�vel sequ�ncia l�gica dos registros da tabela corrente.
dbGoTop()//Move o cursor da �rea de trabalho ativa para o primeiro registro l�gico do arquivo de dados.

Do While !EoF()

IF ZZ9->ZZ9_NOME = 'THIAGO DA SILVA AMARAL'
	Exit
ELse

	MsgAlert(ZZ9->ZZ9_NOME)
	dbSkip() //Move o cursor do registro posicionado para o pr�ximo registro.
EndIf	
	
	//Exit //Mata o processo no primeiro nome.
	
EndDo

RestArea(aArea)
Return Nil

