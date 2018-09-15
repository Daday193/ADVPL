#INCLUDE "Topconn.ch"
#INCLUDE "Protheus.ch"

#Define STR_PULA		Chr(13) + Chr(10)

User Function RCOMR01()
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Declaracao de variaveis                   ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Private oReport  := Nil
Private oSecCab	 := Nil
Private cPerg 	 := PadR ("RCOMR01", Len (SX1->X1_GRUPO))

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Criacao e apresentacao das perguntas      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
PutSx1(cPerg,"01","Código de?"  ,'','',"mv_ch1","C",TamSx3 ("BA1_MATRIC")[1] ,0,,"G","","ZZ9","","","mv_par01","","","","","","","","","","","","","","","","")
PutSx1(cPerg,"02","Código ate?" ,'','',"mv_ch2","C",TamSx3 ("BA1_MATRIC")[1] ,0,,"G","","ZZ9","","","mv_par02","","","","","","","","","","","","","","","","")

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Definicoes/preparacao para impressao      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
ReportDef()
oReport:PrintDialog()

Return Nil

Static Function ReportDef()

oReport := TReport():New("RCOMR01","Cadastro de Usuários",cPerg,{|oReport| PrintReport(oReport)},"Impressão de cadastro de usuários em TReport simples.")
oReport:SetLandscape(.T.)

oSecCab := TRSection():New( oReport , "Usuarios", {"QRY"} )
TRCell():New( oSecCab, "BA1_CODEMP"     , "QRY")
TRCell():New( oSecCab, "BA1_MATRIC"     , "QRY")
TRCell():New( oSecCab, "BA1_NOMUSR"     , "QRY")
TRCell():New( oSecCab, "BA1_CEPUSR"     , "QRY")
TRCell():New( oSecCab, "BA1_ENDERE"     , "QRY")
TRCell():New( oSecCab, "BA1_NR_END"     , "QRY")
TRCell():New( oSecCab, "BA1_COMEND"     , "QRY")
TRCell():New( oSecCab, "BA1_BAIRRO"     , "QRY")
TRCell():New( oSecCab, "BA1_CODMUN"     , "QRY")
TRCell():New( oSecCab, "BA1_MUNICI"     , "QRY")
TRCell():New( oSecCab, "BA1_ESTADO"     , "QRY")
TRCell():New( oSecCab, "BA1_DDD"  		, "QRY")
TRCell():New( oSecCab, "BA1_TELEFO"     , "QRY")

//TRFunction():New(/*Cell*/             ,/*cId*/,/*Function*/,/*oBreak*/,/*cTitle*/,/*cPicture*/,/*uFormula*/,/*lEndSection*/,/*lEndReport*/,/*lEndPage*/,/*Section*/)
TRFunction():New(oSecCab:Cell("BA1_MATRIC"),/*cId*/,"COUNT"     ,/*oBreak*/,/*cTitle*/,/*cPicture*/,/*uFormula*/,.F.           ,.T.           ,.F.        ,oSecCab)

Return Nil

Static Function PrintReport(oReport)
Local aArea := GetArea()
Local cQuery     := ""

Pergunte(cPerg,.F.)

cQuery := "SELECT DISTINCT" 						+ STR_PULA
cQuery += "BA1_CODEMP,BA1_MATRIC,BA1_NOMUSR,BA1_CEPUSR,"	+ STR_PULA
cQuery += "BA1_ENDERE,BA1_NR_END,BA1_COMEND,BA1_BAIRRO,"	+ STR_PULA
cQuery += "BA1_CODMUN,BA1_MUNICI,BA1_ESTADO,BA1_TELEFO"		+ STR_PULA
cQuery += "FROM	"						+ STR_PULA
cQuery += " "+retSqlName("BA1")		    + STR_PULA 
cQuery += "INNER JOIN BA3990 ON BA1_MATRIC=BA3_MATRIC" + STR_PULA
cQuery += "WHERE"						+ STR_PULA
cQuery += "BA1990.D_E_L_E_T_	=' ' "	+ STR_PULA
cQuery := ChangeQuery(cQuery)

If Select("QRY") > 0
	Dbselectarea("QRY")
	QRY->(DbClosearea())
EndIf

TcQuery cQuery New Alias "QRY"


//oSecCab:BeginQuery()
//oSecCab:EndQuery({"QRY"},cQuery})
oSecCab:Print()

RestArea(aArea)

Return Nil