#include "Protheus.ch"
#include "Topconn.ch"

User Function zBancoDados()

dbSelectArea('SA2')
dbSetOrder(1)

While !EOF()
	msginfo("O nome e: "+A2_NOME)
	dbSkip()//Pula para proxima linha.
EndDo

//Exemplo 01 - Inclusão
If !dbSeek(xFilial("SA2")+"900001"+"01")
	RecLock("SA2",.T.)
	A2_FILIAL := xFilial("SA2")
	A2_COD := "900001"
	A2_LOJA :="01"
	A2_NOME := "SUELEN SILVA MOREIRA"
	MsUnLock()// Confirma e finaliza a operação
else
	//Exemplo 02 - Alteração
	dbSeek(xFilial("SA2")+"900001"+"01")
	RecLock("SA2",.F.)
	A2_FILIAL := xFilial("SA2")
	A2_COD := "900001"
	A2_LOJA :="01"
	A2_NOME := "SUELEN SILVA AMARAL"
	MsUnLock()// Confirma e finaliza a operação
EndIf

dbGoTop()
While !EOF()
	msginfo("O nome e: "+A2_NOME)
	dbSkip()//Pula para proxima linha.
EndDo

dbCloseArea()

return