#include "protheus.ch"
#include "rwmake.ch"                
#include "tbiconn.ch"
#include "msole.ch"

User Function Te_amo()	

	Local nRetorno		:= 0
	Local oDlg, oGroup, oButton, oCombo, cCombo
	Local nPosPadrao	:= 1
	Local aOpcoes		:= {"Sim","N�o","Talvez"}
	Local cTitDialog	:= "Estruturas de Decis�o"
	Local cTitGroup		:= "Voc� � esposa do Thiago?"
	
DEFAULT nPosPadrao	:= 1

cCombo	:= aOpcoes[nPosPadrao]

//�������������������������������������������������Ŀ
//�Dialog principal. Na ativa��o ela � centralizada.�
//���������������������������������������������������
DEFINE MSDIALOG oDlg FROM 0,0 TO 100,230 PIXEL TITLE cTitDialog

	oGroup:= TGroup():New(05,05,oDlg:nClientHeight/4,(oDlg:nClientWidth/2)-5,cTitGroup,oDlg,,,.T.)

	oCombo:= tComboBox():New(oDlg:nClientHeight/8,10,{|u|if(PCount()>0,cCombo:=u,cCombo)},;
	aOpcoes,100,20,oDlg,,{||/*onChange*/},,,,.T.,,,,,,,,,aOpcoes[nPosPadrao])

	//���������������������������������������������Ŀ
	//�Bot�o para o controle de fechamento da janela�
	//�����������������������������������������������
	oButton:=tButton():New((oDlg:nClientHeight/4)+3,10,"OK",oDlg,{||oDlg:End()},100,10,,,,.T.)

ACTIVATE MSDIALOG oDlg CENTERED

//���������������������������������������������Ŀ
//�Define o retorno com base na posi��o do combo�
//�����������������������������������������������
nRetorno	:= aScan(aOpcoes,cCombo)

Do Case
	
Case nRetorno == 1
	MsgInfo("Eu te amo minha esposa linda!")

Case nRetorno == 2
	MsgStop("N�o � pra voc�!","Aten��o")

Case nRetorno == 3
	Opcao3()

EndCase

Return nRetorno

Static Function Opcao3()
	
	MsgInfo("O que preciso fazer?")
	
Return