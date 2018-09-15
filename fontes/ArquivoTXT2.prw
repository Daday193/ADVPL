#include "totvs.ch"
#include "protheus.ch"

User Function ARQTXT2()
Local cDir   := "C:\TOTVS 12\"
Local cArq    := "COBRANÇA.txt"
Local cLinha  := ""
Local lPrim   := .T.
Local aCampos := {}
Local aDados  := {}
 
Private aErro := {}
 
If !File(cDir+cArq)
	MsgStop("O arquivo " +cDir+cArq + " não foi encontrado. A importação será abortada!","[ARQTXT2] - ATENCAO")
	Return
EndIf
 
FT_FUSE(cDir+cArq)
ProcRegua(FT_FLASTREC())
FT_FGOTOP()
While !FT_FEOF()
 
	IncProc("Lendo arquivo texto...")
 
	cLinha := FT_FREADLN()
 
	If lPrim
		aCampos := Separa(cLinha,";",.T.)
		lPrim := .F.
	Else
		AADD(aDados,Separa(cLinha,";",.T.))
	EndIf
	
	FT_FSKIP()
EndDo

	 
Begin Transaction
	ProcRegua(Len(aDados))
	For i:=1 to Len(aDados)
	
		IncProc("Importando Clientes...")
 
		dbSelectArea("SZ1")
		dbSetOrder(1)
		dbGoTop()
		If !dbSeek(xFilial("SZ1")+aDados[i,1])
			Reclock("SZ1",.T.)
			SZ1->Z1_FILIAL := xFilial("SZ1")
			
			For j:=1 to Len(aCampos)
				cCampo  := "SZ1->" + aCampos[j]
				&cCampo := aDados[i,j]
			Next j
			SZ1->(MsUnlock())
		EndIf
	Next i
End Transaction
 
FT_FUSE()
 
ApMsgInfo("Importação dos Clientes concluída com sucesso!","[ARQTXT2] - SUCESSO")
 
Return