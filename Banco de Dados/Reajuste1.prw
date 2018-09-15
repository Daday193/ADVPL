#Include "Protheus.ch"
#Include "Topconn.ch"

#Define STR_PULA		Chr(13) + Chr(10)

User Function ReajPre()
	Local aArea := GetArea()
	Local cTPess := "J"
	Local nVlAtua := 0
	Local nVlAnte := 0
	Local nVlReaj := 10
	Local cQuery := ""
	
	//SELECT nas tabelas do Banco de Dados
	cQuery := "SELECT" + STR_PULA
	cQuery += "BBU_CODEMP, BBU_VALFAI," + STR_PULA
	cQuery += "BBU_VLRANT,BBU_REJAPL" + STR_PULA
	cQuery += "FROM" + STR_PULA
	cQuery += " "+retSqlName("BBU") + STR_PULA
	cQuery += "WHERE D_E_L_E_T_=' '" + STR_PULA
	
	If cTPess=="F"
	cQuery += "AND BBU_CODEMP = '0001'" + STR_PULA
	EndIf
	If cTPess=="J"
	cQuery += "AND BBU_CODEMP = '0002'" + STR_PULA
	EndIf
	cQuery := ChangeQuery(cQuery)
	
	//Pega o SELECT e joga numa tabela temporária do Protheus para uso.
	TCQuery cQuery New Alias "QRYGM"
	
	DbSelectArea("BBU")
		
	Do While ! QRYGM->(EoF())
	
	BBU->(DbSetOrder(1))	// BBU_FILIAL+BBU_CODOPE+BBU_CODEMP+BBU_MATRIC+BBU_CODFOR+BBU_CODFAI
	MsSeek(xFilial("BBU")+"0001"+QRYGM->(BBU_CODEMP))
	
			
			Alert(BBU_VALFAI)
		QRYGM->(dbSkip())
		
	EndDo
	
	QRYGM->(dbCloseArea())
	BBU->(dbCloseArea())
	RestArea(aArea)
	
Return