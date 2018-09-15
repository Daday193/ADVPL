#include "totvs.ch"
#include "protheus.ch"
#include "Topconn.ch"

User Function PL101FAM()
	Local aArea 	 := GetArea()
	Local aAreaBBU 	 := BBU->(GetArea())
	Local aAreaBB3 	 := BB3->(GetArea())
	Local aAreaBYA 	 := BYA->(GetArea())
	Local nIndice	 :=	PARAMIXB[1]
	Local cIndRea	 :=	PARAMIXB[2]
	Local cMatricFam :=	PARAMIXB[3]
	
	DbSelectArea("BBU")
	BBU->(DbSetOrder(1))
	
	//Alterar o valor reajustado
	Alert("Alterar reajuste da Família!")
	
	If BBU->(DbSeek(xFilial("BBU")+cMatricFam))
		While ! BBU->( Eof() ) .And. BBU->(BBU_FILIAL+BBU_CODOPE+BBU_CODEMP+BBU_MATRIC) == xFilial("BBU")+cMatricFam
		
		nVlrRea := Round(BBU->BBU_VLRANT+nIndice,2)
	
		BBU->(RecLock("BBU",.F.))
		BBU->BBU_VALFAI := nVlrRea
		BBU->(MsUnLock())

		//?Acessa proximo registro...                                               ?
		BBU->(DbSkip())
		Enddo
			
	EndIf
	
	BBU->(dbCloseArea())
	
		DbSelectArea("BYA")
		If BYA_PROD == "1"
		DbSelectArea("BB3")
		DbSetOrder(1) //BB3_FILIAL+BB3_CODIGO+BB3_VERSAO+BB3_CODFOR+BB3_CODFAI
			//?Atualiza o valor do Produto... 
			DbSeek(xFilial("BB3")+"00010001"+"001"+"101"+"001")
			BB3->(RecLock("BB3",.F.))
			BB3->BB3_VALFAI := BBU->BBU_VALFAI
			BB3->(MsUnLock())
		EndIf	
	
	BB3->(dbCloseArea())
	BYA->(dbCloseArea())
			
	RestArea(aArea) 
	BBU->(RestArea(aAreaBBU))
	BB3->(RestArea(aAreaBB3))	
	BYA->(RestArea(aAreaBYA))
Return

User Function PL101SUB()
	Local aArea 	 := GetArea()
	Local aAreaBTN 	 := BTN->(GetArea())
	Local aAreaBB3 	 := BB3->(GetArea())
	Local aAreaBYA 	 := BYA->(GetArea())
	Local nIndice	 :=	PARAMIXB[1]
	Local cIndRea	 :=	PARAMIXB[2]
	Local cSubCon    :=	PARAMIXB[3]
		
	DbSelectArea("BTN")
	BTN->(DbSetOrder(3))
		
		//Alterar o valor reajustado
		Alert("Alterar reajuste do SubContrato!")
			
		If BTN->(DbSeek(xFilial("BTN")+cSubCon))
			While ! BTN->(Eof()) .And. BTN->(BTN_FILIAL+BTN_CODIGO+BTN_NUMCON+BTN_VERCON+BTN_SUBCON+BTN_VERSUB) == ;
				xFilial("BTN")+cSubCon
			
				nVlrRea := Round(BTN->BTN_VLRANT+nIndice,2)
				
				//?Atualiza o valor em cada faixa etaria da familia...                      ?
				BTN->(RecLock("BTN",.F.))
				BTN->BTN_VALFAI := nVlrRea
				BTN->(MsUnLock())
	
				//?Acessa proximo registro...                                               ?
				BTN->(DbSkip())	

			Enddo
		EndIf
	
	BTN->(dbCloseArea())
	
			DbSelectArea("BYA")
			If BYA_PROD == "1"
			DbSelectArea("BB3")
			DbSetOrder(1) //BB3_FILIAL+BB3_CODIGO+BB3_VERSAO+BB3_CODFOR+BB3_CODFAI
				//?Atualiza o valor do Produto... 
				DbSeek(xFilial("BB3")+"00010002"+"001"+"101"+"001")
				BB3->(RecLock("BB3",.F.))
				BB3->BB3_VALFAI := BTN->BTN_VALFAI
				BB3->(MsUnLock())
			EndIf
		
		BB3->(dbCloseArea())
		BYA->(dbCloseArea())
				
	RestArea(aArea) 
	BTN->(RestArea(aAreaBTN))
	BB3->(RestArea(aAreaBB3))	
	BYA->(RestArea(aAreaBYA))
Return
