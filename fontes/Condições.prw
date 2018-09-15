#INCLUDE "PROTHEUS.CH"

/*
ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÉÍÍÍÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍÍÍÍÑÍÍÍÍÍÍÍÍÍÍÍÍÍ»±±
±±ºPrograma  ³XTSTIF      ºAutor  ³V. Gregório         º Data ³  13/04/14   º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºDesc.     ³ Dialog para exemplificar estruturas de decisão               º±±
±±ÌÍÍÍÍÍÍÍÍÍÍØÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¹±±
±±ºUso       ³ AcademiaERP                                                  º±±
±±ÈÍÍÍÍÍÍÍÍÍÍÏÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍŒ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß
*/
User Function XTSTIF()
//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Declaração de variáveis³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local nRetorno		:= 0
Local oDlg, oGroup, oButton, oCombo, cCombo
Local nPosPadrao	:= 1
Local aOpcoes		:= {"Sim","Não"}
Local cTitDialog	:= "Estruturas de Decisão"
Local cTitGroup		:= "Escolha um dos itens"

DEFAULT nPosPadrao	:= 1

cCombo	:= aOpcoes[nPosPadrao]

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Dialog principal. Na ativação ela é centralizada.³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
DEFINE MSDIALOG oDlg FROM 0,0 TO 100,230 PIXEL TITLE cTitDialog

	oGroup:= TGroup():New(05,05,oDlg:nClientHeight/4,(oDlg:nClientWidth/2)-5,cTitGroup,oDlg,,,.T.)

	oCombo:= tComboBox():New(oDlg:nClientHeight/8,10,{|u|if(PCount()>0,cCombo:=u,cCombo)},;
	aOpcoes,100,20,oDlg,,{||/*onChange*/},,,,.T.,,,,,,,,,aOpcoes[nPosPadrao])

	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³Botão para o controle de fechamento da janela³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	oButton:=tButton():New((oDlg:nClientHeight/4)+3,10,"OK",oDlg,{||oDlg:End()},100,10,,,,.T.)

ACTIVATE MSDIALOG oDlg CENTERED

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³Define o retorno com base na posição do combo³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
nRetorno	:= aScan(aOpcoes,cCombo)

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³***********************************************³
//³Com base na escolha do usuário, vamos          ³
//³mudar o comportamento da rotina                ³
//³***********************************************³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If nRetorno	== 1
	MsgInfo("O usuário escolheu a opção: Sim")
Else
	MsgInfo("O usuário escolheu a opção: Não")
EndIf

Return nRetorno