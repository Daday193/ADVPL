#Include "PROTHEUS.CH"

User Function VALEM_01()
	Local aArea := GetArea()
	Local _cAno  := Space(4)
	Local oDlg  := nil 
	Local nOpca :=0
	Local nMes  := 0
	Local lRet  := .F.

	DEFINE MSDIALOG oDlg TITLE "Gerar Calendario Pagamento - Ano completo" FROM 000,000 TO 100,400 PIXEL//080,300 PIXEL   
	@ 001,001 TO 045, 205 OF oDlg PIXEL 
	@ 010,010 SAY "Informe Ano:" SIZE 80, 07 OF oDlg PIXEL 
	@ 010,080 MSGET _cAno SIZE 55, 11 OF oDlg PIXEL VALID PVAL001(_cAno)                                                                                                        
	DEFINE SBUTTON FROM 008, 165 TYPE 1 ACTION (nOpca := 1,oDlg:End()) ENABLE OF oDlg 
	DEFINE SBUTTON FROM 022, 165 TYPE 2 ACTION (nOpca := 2,oDlg:End()) ENABLE OF oDlg 
	ACTIVATE MSDIALOG oDlg CENTERED

	If nOpca == 1 
		If (MsgYesNo("Deseja criar os parâmetros para Ano "+_cAno+" para todas as Operadoras"))
			BA0->(DbSetOrder(1))
			BA0->(dbGoTop())
			While !BA0->(EOF())
				nMes:= 1
				For nMes:= 1 To 12
					// BDT - Calendário de Pagamento
					BDT->(dbSetOrder(1))
					If !BDT->(msSeek(xFilial("BDT")+Alltrim(BA0->(BA0_CODIDE+BA0_CODINT))+_cAno+StrZero(nMes,2)))
						lRet :=.T.
						BDT->(RecLock("BDT",.T.)) 
						BDT->BDT_FILIAL := xFilial("BDT")
						BDT->BDT_CODINT := Alltrim(BA0->(BA0_CODIDE+BA0_CODINT))
						BDT->BDT_ANO 	:= _cAno
						BDT->BDT_MES 	:= StrZero(nMes,2)
						BDT->BDT_DATINI := Ctod("01"+"/"+StrZero(nMes,2)+"/"+_cAno)
						BDT->BDT_DATFIN := LastDay(Ctod("01"+"/"+StrZero(nMes,2)+"/"+_cAno))
						BDT->( MsUnlock() )
					Endif
					// BFM - Calendário de Pagamento
					BFM->(dbSetOrder(1))
					If ! BFM->(DbSeek(xFilial("BFM")+Alltrim(BA0->(BA0_CODIDE+BA0_CODINT))+_cAno+StrZero(nMes,2)))
						BFM->(RecLock("BFM",.T.)) 
						BFM->BFM_FILIAL := xFilial("BFM")
						BFM->BFM_CODINT := Alltrim(BA0->(BA0_CODIDE+BA0_CODINT))
						BFM->BFM_ANO 	:= _cAno
						BFM->BFM_MES 	:= StrZero(nMes,2)
						BFM->BFM_VALRDA := 0.3
						BFM->BFM_VALCOP := 0.3
						BFM->( MsUnlock() )
					Endif
				Next nMes                                                                       
				BA0->(dbSkip())	
			End

			If lRet
				MsgAlert("Parâmetros criados para o ano "+_cAno)
			Else
				MsgAlert("Já existem parâmetros criados para o ano "+_cAno)
			Endif
		Endif		
	Endif

Return

Static Function PVAL001(_cAno)
	Local lRet := .T.
	If Len(_cAno) < 4 .or. Len(_cAno) > 4 
		MsgStop("Ano tem que ter 4 digitos..")
		lRet := .F.
	Endif
Return
