#include "PLSR430.CH"
#include "PROTHEUS.CH"
#define  cPicCNES PesqPict("BB8","BB8_CNES")
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡…o    ³plsa090imp³ Autor ³ Sandro Hoffman Lopes  ³ Data ³ 18.10.06 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡ao ³ Guia de Consulta                                           ³±±
±±³          ³ Guia de Servico Profissional / Servico Auxiliar de Diag-   ³±±
±±³          ³ nostico e Terapia - SP/SADT                                ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Sintaxe   ³ plsa090imp(void)                                           ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ Generico                                                   ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ ATUALIZACOES SOFRIDAS DESDE A CONSTRUCAO INICIAL.                     ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ PROGRAMADOR  ³ DATA   ³ BOPS ³  MOTIVO DA ALTERACAO                   ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³              ³        ³      ³                                        ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
User Function plsa090imp(aPar)
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Define Variaveis                                             ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Private CbCont, Cabec1, Cabec2, Cabec3, nPos
Private Tamanho  := "P"
Private cDesc1   := "Impressao da Guia de Consulta/SADT"
Private cDesc2   := "de acordo com a configuracao do usuario."
Private cDesc3   := " "
Private aArea    := GetArea()
Private lPrinter := .T.
Private lGerTXT  := .T.
Private nSvRecno := BEA->(Recno())
Private nLin 	 := 80
Private m_pag 	 := 01
Private lEnd 	 := .F.
Private lAbortPrint := .F.
Private aReturn  := { "Zebrado", 1,"Administracao", 1, 1, 1, "", 1 }
Private aLinha   := { }
Private NomeProg := "PLSR430"
Private nLastKey := 0 
Private nTipo 	 := 18
//Private Titulo   := "GUIA DE CONSULTA/SADT"
Private Titulo   := ""
Private cPerg
Private wnrel
DEFAULT aPar := {"1",.F.}

If aPar[1] == "1"
	cPerg := ""
Else
	cPerg := "PLR430"
EndIf

If aPar[1] == "1" .And. ! (BEA->BEA_STATUS $ "1,4,3")
	Help("",1,"PLSR430")
	Return
EndIf

If aPar[1] == "2" .And. lGerTXT
	If ! Pergunte("PLR430", .T.)
		Return
	EndIf
EndIf

//--Altera o Set Epch para 1910
nEpoca := SET(5, 1910)
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Variaveis utilizadas para Impressao do Cabecalho e Rodape    ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
CbCont   := 0
Cabec1   := OemtoAnsi(Titulo)
Cabec2   := " "
Cabec3   := " "
cString  := "BEA"
aOrd     := {}
wnRel 	 := "PLSR430" // Nome Default do relatorio em Disco
NomeProg := "PLSR430" // Nome Default do relatorio em Disco

wnrel 	 := SetPrint(cString,NomeProg,cPerg,@titulo,cDesc1,cDesc2,cDesc3,.F.,aOrd)

If nLastKey == 27
	Return
EndIf

SetDefault(aReturn,cString)

If nLastKey == 27
	Return
EndIf

nTipo := If(aReturn[4]==1,15,18)

RptStatus({|| R430Imp(Cabec1,Cabec2,Titulo,nLin,aPar)},Titulo)

//-- Posiciona o ponteiro
BEA->(dbGoto(nSvRecno))
/*
ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
³Restaura Area e Ordem de Entrada                              ³
ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
*/
//--Retornar Set Epoch Padrao
SET(5, nEpoca)
RestArea(aArea)
Return

/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ R430IMP  ³ Autor ³ Sandro Hoffman Lopes  ³ Data ³ 18/10/06 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡…o ³ Chamada do Relatorio                                       ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ PLSR430                                                    ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function R430Imp(Cabec1,Cabec2,Titulo,nLin,aPar)
Local cCodOpe
Local cGrupoDe
Local cGrupoAte
Local cContDe
Local cContAte
Local cSubDe
Local cSubAte
Local nTipo
Local cSQL
Local aConsulta := {}
Local aSADT     := {}
DEFAULT aPar := {"1",.F.}

If aPar[1] == "1" .Or. BEA->(FieldPos("BEA_GUIIMP")) == 0 // Impressao Individual
	If BEA->BEA_TIPO == "1"
		aAdd(aConsulta, MtaDados(BEA->BEA_TIPO))
	Else
		aAdd(aSADT, MtaDados(BEA->BEA_TIPO))
	EndIf
Else
	// Impressao por Lote... de acordo com o pergunte
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Busca dados de parametros...                                             ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	Pergunte(cPerg,.F.)
	cCodOpe   := mv_par01
	cGrupoDe  := mv_par02
	cGrupoAte := mv_par03
	cContDe   := mv_par04
	cContAte  := mv_par05
	cSubDe    := mv_par06
	cSubAte   := mv_par07
	nTipo     := mv_par08
	
	cSQL := "SELECT R_E_C_N_O_ AS REG FROM " + RetSQLName("BEA")
	cSQL += " WHERE BEA_FILIAL = '" + xFilial("BEA") + "'"
	cSQL += "   AND BEA_OPEMOV = '" + cCodOpe + "'"
	cSQL += "   AND (BEA_CODEMP >= '" + cGrupoDe + "' AND BEA_CODEMP <= '" + cGrupoAte + "')"
	cSQL += "   AND (BEA_CONEMP >= '" + cContDe  + "' AND BEA_CONEMP <= '" + cContAte  + "')"
	cSQL += "   AND (BEA_SUBCON >= '" + cSubDe   + "' AND BEA_SUBCON <= '" + cSubAte   + "')"
	If nTipo == 1
		cSQL += " AND BEA_STATUS = '4'"
	ElseIf nTipo == 2
		cSQL += " AND BEA_GUIIMP = '1'"
	Endif
	cSQL += " AND D_E_L_E_T_ = ' '"
	
	PLSQuery(cSQL,"Trb")
	
	If Trb->(Eof())
		Trb->(dbCloseArea())
		Help("",1,"RECNO")
		Return
	Else
		Do While ! Trb->(Eof())
			BEA->(dbGoTo(Trb->REG))
			If BEA->BEA_TIPO == "1"
				aAdd(aConsulta, MtaDados(BEA->BEA_TIPO))
			Else
				aAdd(aSADT, MtaDados(BEA->BEA_TIPO))
			EndIf
			Trb->(dbSkip())
		Enddo
		Trb->(dbCloseArea())
	EndIf
EndIf

aDados := aClone(aConsulta)

If Len(aConsulta) > 0 //Impressão
	
	aCol := {01,11,13,25}
	
	For nX := 1 To Len(aDados)
		
		If lAbortPrint
			@nLin,00 PSAY "*** CANCELADO PELO OPERADOR ***"
			Exit
		Endif

		//If nLin > 55
		//Cabec(Titulo,Cabec1,Cabec2,NomeProg,Tamanho,nTipo)
		nLin := 1
		//Endif

		If ValType(aDados[nX]) == 'U' .OR. Len(aDados[nX]) == 0
			Loop
		EndIf 
		
		SetPrc(0,0)
		@00,00 Say Chr(27)+"C"+Chr(35)		
		@ 00,00 PSAY AvalImp(80)

		@nLin,aCol[01] Psay space(13)+"GUIA DE ATENDIMENTO"
		nLin++
		@nLin,aCol[01] Psay space(12)+REPLICATE("=",22)		
		nLin++
		
		nLin++
		@nLin,aCol[01] Psay "Dr(a)   : "+trim(aDados[nX,07])
		nLin++
		@nLin,aCol[01] Psay space(10)+trim(aDados[nX,08])
		nLin++
		cEnd := trim(aDados[nX,09])+" "+trim(aDados[nX,10])+" "+trim(aDados[nX,11])+" "+trim(aDados[nX,12])
		@nLin,aCol[01] Psay space(10)+cEnd			
		nLin++
		@nLin,aCol[01] Psay space(10)+trim(aDados[nX,15])	
		nLin++      
		@nLin,aCol[01] Psay space(10)+trim(aDados[nX,13])	
		nLin++
		@nLin,aCol[01] Psay space(10)+trim(aDados[nX,14])	
		nLin++
		
		nLin++
		@nLin,aCol[01] Psay "Paciente: "+trim(aDados[nX,02])	
		nLin++
		@nLin,aCol[01] Psay space(10)+trim(aDados[nX,04])	
		nLin++
		
		@nLin,aCol[01] Psay "Titular : "+trim(aDados[nX,05])	
		nLin++
		
		@nLin,aCol[01] Psay "Convenio: "+trim(aDados[nX,06])	
		nLin++
		
		@nLin,aCol[01] Psay "Guia nro: "+trim(aDados[nX,01])	
		nLin++
		
		@nLin,aCol[01] Psay "Validade: "+DTOC(aDados[nX,03])	
		nLin++
		
		nLin++
		nLin++
		nLin++
		@nLin,aCol[01] Psay "Data    : "+DTOC(dDatabase)+" "+Time()
		
		nLin++
		nLin++
		nLin++
		@nLin,aCol[01] Psay "Servicos: "+trim(aDados[nX,16]+" "+aDados[nX,17])
		
		nLin++
		nLin++
		nLin++
		@nLin,aCol[01] Psay REPLICATE("-",20)+space(3)+REPLICATE("-",20)
		nLin++
		@nLin,aCol[01] Psay "Associado"+space(14)+trim(Alltrim(UsrRetName(__CUSERID)))
		
	Next nX
	
	@32,00 PSAY ""
			
	SET DEVICE TO SCREEN
	SetPgEject(.F.)
	/*	
	If aReturn[5]==1
		dbCommitAll()
		SET PRINTER TO
		OurSpool(wnrel)
	Endif
    */
	MS_FLUSH()
	
EndIf  

Return
/*/
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Funcao    ³ MtaDados ³ Autor ³ Sandro Hoffman Lopes  ³ Data ³ 19/10/06 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡ao ³ Grava STATUS da tabela BEA e chama a funcao "PLSGSADT"     ³±±
±±³          ³ que ira retornar o array com os dados a serem impressos.   ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ PLSR420N                                                   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
/*/
Static Function MtaDados(nGuia)
Local aDados := {}
If BEA->BEA_STATUS $ "1,4,3" // ALTERACAO PARA IMPRESSAO DE USUARIOS NAO AUTORIZADOS
	BEA->(RecLock("BEA", .F.))
	
	If BEA->BEA_STATUS == "4"
		BEA->BEA_STATUS := "1"
	EndIf
	
	If BEA->(FieldPos("BEA_GUIIMP")) > 0
		BEA->BEA_GUIIMP := "1"
	EndIf
	
	BEA->(MsUnLock())
	aDados := U_PLSGSADT(nGuia) // Funcao que monta o array com os dados da guia de CONSULTA ou SP/SADT
EndIf

Return aDados
/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Fun‡ao    ³ PLSGSADT  ³ Autor ³ Sandro                ³ Data ³ 10.01.07 ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descri‡ao ³ Dados Relatório TISS (Guia Consulta e SP/SADT )             ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³ Uso      ³ SigaPLS                                                     ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³ nGuia ( Informe 1- Guia de Consulta e 2-Guia de SP/SADT )   ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function PLSGSADT(nGuia)
Local aDados
Local lTemPFExe
Local lExecPF
Local lBE2Aut

aDados := {}
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona Operadora                                          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
BA0->(dbSetOrder(1))
BA0->(dbSeek(xFilial("BA0")+BEA->(BEA_OPEUSR)))
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona Usuario                                            ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
BA1->(dbSetOrder(2))
BA1->(dbSeek(xFilial("BA1")+BEA->(BEA_OPEUSR+BEA_CODEMP+BEA_MATRIC+BEA_TIPREG)))
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona Vidas                                              ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
BTS->(dbSetOrder(1))
BTS->(dbSeek(xFilial("BTS")+BA1->BA1_MATVID))
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona Familias/Usuarios                                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
BA3->(dbSetorder(01))
BA3->(dbSeek(xFilial("BA3")+BA1->(BA1_CODINT+BA1_CODEMP+BA1_MATRIC)))
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona Produtos de Saude - Plano                          ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
BI3->(dbSetOrder(1))
BI3->(dbSeek(xFilial("BI3")+BA3->(BA3_CODINT+BA3_CODPLA+BA3_VERSAO)))
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona Medico Solicitante                                 ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
BB0->(dbSetOrder(4))
BB0->(dbSeek(xFilial("BB0")+BEA->(BEA_ESTSOL+BEA_REGSOL+BEA_SIGLA)))
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona Rede de Atendimento                                ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
BAU->(dbSetOrder(1))
BAU->(dbSeek(xFilial("BAU")+BEA->BEA_CODRDA))
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona Contas Medicas                                     ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
BD5->(dbSetOrder(1))
BD5->(MsSeek(xFilial("BD5")+BEA->(BEA_OPEMOV+BEA_CODLDP+BEA_CODPEG+BEA_NUMGUI)))
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³ Posiciona Especialidade                                      ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
BAQ->(dbSetOrder(1))
BAQ->(MsSeek(xFilial("BAQ")+BEA->(BEA_OPEMOV+BEA_CODESP)))

If nGuia == "1" // Guia de Consulta

	// Cabecalho
	aAdd(aDados, BEA->(BEA_OPEMOV+"."+BEA_ANOAUT+"."+BEA_MESAUT+"-"+BEA_NUMAUT)) // 1
	
	// Dados do Beneficiario
	If BA1->BA1_CODINT == BA1->BA1_OPEORI .Or. empty(BA1->BA1_MATANT)
		aAdd(aDados, BEA->(SubStr(BEA_OPEMOV,1,1)+SubStr(BEA_OPEMOV,2,3)+"."+BEA_CODEMP+"."+BEA_MATRIC+"."+BEA_TIPREG+"-"+BEA_DIGITO) ) // 2
	Else
		aAdd(aDados, BA1->BA1_MATANT) // 2
	EndIf
	aAdd(aDados, BA1->BA1_DTVLCR) // 3
	aAdd(aDados, BEA->BEA_NOMUSR) // 4
	aAdd(aDados, BA1->BA1_NOMTIT) // 5
	aAdd(aDados, Posicione("BT5",1,xFilial("BT5")+BA1->BA1_CODINT+BA1->BA1_CODPLA+TRIM(BA1->BA1_NUMCON)+BA1->BA1_VERSAO,"BT5_NOME")) // 06	
	// Dados do Contratado
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³ Posiciona Profissional de Saude                              ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	lTemPFExe := .F. // Tem Profissional Executante informado na Guia
	lExecPF   := .F. // O executante (RDA) eh pessoa fisica
	
	If ! Empty(BEA->BEA_REGEXE)
		BB0->(dbSetOrder(4))
		lTemPFExe := BB0->(dbSeek(xFilial("BB0")+BEA->(BEA_ESTEXE+BEA_REGEXE+BEA_SIGEXE)))
	Else
		If BAU->BAU_TIPPE == "F"
			BB0->(dbSetOrder(1))
			lExecPF := BB0->(dbSeek(xFilial("BB0")+BAU->BAU_CODBB0))
		EndIf
	EndIf
	aAdd(aDados, IIf(BAU->BAU_TIPPE == "F", Transform(BAU->BAU_CPFCGC, "@R 999.999.999-99"), Transform(BAU->BAU_CPFCGC, "@R 99.999.999/9999-99"))) // 07
	aAdd(aDados, BAU->BAU_NOME) // 08
	
	BB8->(dbSetOrder(1))
	BB8->(dbSeek(xFilial("BB8")+BAU->BAU_CODIGO+BEA->(BEA_OPEMOV+BEA_CODLOC)))
	aAdd(aDados, Posicione("B18",1,xFilial("B18")+BB8->BB8_TIPLOG,"B18_DESCRI")) // 9
	aAdd(aDados, BB8->BB8_END) 		// 10
	aAdd(aDados, BB8->BB8_NR_END) 	// 11
	aAdd(aDados, BB8->BB8_COMEND) 	// 12
	aAdd(aDados, BB8->BB8_MUN) 		// 13
	aAdd(aDados, BB8->BB8_EST) 		// 14
	aAdd(aDados, BB8->BB8_BAIRRO) 	// 15
	
	// Dados do Atendimento/Procedimento realizado
	BE2->(dbSetOrder(1))
	cChave := xFilial("BE2")+BEA->(BEA_OPEMOV+BEA_ANOAUT+BEA_MESAUT+BEA_NUMAUT )
	If BE2->(MsSeek(cChave))
		BD6->(dbSetOrder(1))
		BD6->(MsSeek(xFilial("BD6")+BD5->(BD5_CODOPE+BD5_CODLDP+BD5_CODPEG+BD5_NUMERO+BD5_ORIMOV)+BE2->(BE2_SEQUEN+BE2_CODPAD+BE2_CODPRO)))
		aAdd(aDados, PlsPicPro(BE2->BE2_CODPAD, BE2->BE2_CODPRO)) // 16
		aAdd(aDados, BD6->BD6_DESPRO) // 17
	Else
		aAdd(aDados, "")	// 16
		aAdd(aDados, "")	// 17
	EndIf                     

Else
	MsgInfo("Guia Originada da Internação, para Impressão ir a Rotina de Internação.")
EndIf
Return aDados