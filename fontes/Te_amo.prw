#include "protheus.ch"
#include "rwmake.ch"                
#include "tbiconn.ch"
#include "msole.ch"

User Function Te_amo()	

	Local nRetorno		:= 0
	Local oDlg, oGroup, oButton, oCombo, cCombo
	Local nPosPadrao	:= 1
	Local aOpcoes		:= {"Sim","Não","Talvez"}
	Local cTitDialog	:= "Estruturas de Decisão"
	Local cTitGroup		:= "Você é esposa do Thiago?"
	
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

Do Case
	
Case nRetorno == 1
	MsgInfo("Eu te amo minha esposa linda!")

Case nRetorno == 2
	MsgStop("Não é pra você!","Atenção")

Case nRetorno == 3
	Opcao3()

EndCase

Return nRetorno

Static Function Opcao3()
	
	MsgInfo("O que preciso fazer?")
	
Return