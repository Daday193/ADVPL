#Include 'Protheus.ch'
#Include 'Topconn.ch'

#Define STR_PULA		Chr(13) + Chr(10)

User Function GUIAMED()
Private cProd	:= "41501144"

Dbselectarea("BC5")

//Grupo de prestadores com mesma tabela de preço.
If BC5_TABPRE == Space(3)
	GUIAMED1()

//Prestadores com tabela de preço individual.
ElseIf GUIAMED2()

EndIf
	
Return

Static Function GUIAMED1()
Local aArea := GetArea()
Local cQuery     := ""

cQuery := "SELECT DISTINCT" 						+ STR_PULA
cQuery += "BC6_CODRDA,BAU_NOME,BC6_CODPRO,"	        + STR_PULA
cQuery += "BC6_VRRPP AS PAGTO,BC6_VRRCO AS COBR"	+ STR_PULA
cQuery += "FROM	"									+ STR_PULA
cQuery += " "+retSqlName("BC6")					    + STR_PULA 
cQuery += "INNER JOIN BAU990 ON BAU_CODIGO = BC6_CODRDA" + STR_PULA
cQuery += "WHERE"									+ STR_PULA
cQuery += "BC6_CODPRO	= '"+cProd+"' AND"			+ STR_PULA
cQuery += "BC6990.D_E_L_E_T_	=' ' "				+ STR_PULA
cQuery := ChangeQuery(cQuery)

If Select("QRY") > 0
	Dbselectarea("QRY")
	QRY->(DbClosearea())
EndIf

TcQuery cQuery New Alias "QRY"

	Alert("GUIAMED1" +STR_PULA + " O pagto é: " + cValtoChar(QRY->PAGTO) + STR_PULA + " A cobr é: " + cValtoChar(QRY->COBR))

RestArea(aArea)

Return Nil


Static Function GUIAMED2()
Local aArea := GetArea()
Local cQuery     := ""

cQuery := "SELECT DISTINCT" 						+ STR_PULA
cQuery += "BC5_CODRDA, BAU_NOME,B23_CODPRO,"	    + STR_PULA
cQuery += "B23_VRRPP AS PAGTO,B23_VRRCO AS COBR"	+ STR_PULA
cQuery += "FROM	"									+ STR_PULA
cQuery += " "+retSqlName("BC5")					    + STR_PULA 
cQuery += "INNER JOIN BAU990 ON BAU_CODIGO = BC5_CODRDA" + STR_PULA
cQuery += "INNER JOIN B23990 ON B23_CODTAB = BC5_TABPRE" + STR_PULA
cQuery += "WHERE"									+ STR_PULA
cQuery += "B23_CODPRO	= '"+cProd+"' AND"			+ STR_PULA
cQuery += "BC5990.D_E_L_E_T_	=' ' "				+ STR_PULA
cQuery := ChangeQuery(cQuery)

If Select("QRY") > 0
	Dbselectarea("QRY")
	QRY->(DbClosearea())
EndIf

TcQuery cQuery New Alias "QRY"

	Alert("GUIAMED1" +STR_PULA + " O pagto é: " + cValtoChar(QRY->PAGTO) + STR_PULA + " A cobr é: " + cValtoChar(QRY->COBR))

RestArea(aArea)

Return Nil




