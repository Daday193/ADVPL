#INCLUDE "PROTHEUS.CH"

/*
�������������������������������������������������������������������������������
�������������������������������������������������������������������������������
���������������������������������������������������������������������������ͻ��
���Programa  �XTSTIF      �Autor  �V. Greg�rio         � Data �  13/04/14   ���
���������������������������������������������������������������������������͹��
���Desc.     � Dialog para exemplificar estruturas de decis�o               ���
���������������������������������������������������������������������������͹��
���Uso       � AcademiaERP                                                  ���
���������������������������������������������������������������������������͌��
�������������������������������������������������������������������������������
�������������������������������������������������������������������������������
*/
User Function XTSTIF()
//�����������������������Ŀ
//�Declara��o de vari�veis�
//�������������������������
Local nRetorno		:= 0
Local oDlg, oGroup, oButton, oCombo, cCombo
Local nPosPadrao	:= 1
Local aOpcoes		:= {"Sim","N�o"}
Local cTitDialog	:= "Estruturas de Decis�o"
Local cTitGroup		:= "Escolha um dos itens"

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

//�����������������������������������������������Ŀ
//�***********************************************�
//�Com base na escolha do usu�rio, vamos          �
//�mudar o comportamento da rotina                �
//�***********************************************�
//�������������������������������������������������
If nRetorno	== 1
	MsgInfo("O usu�rio escolheu a op��o: Sim")
Else
	MsgInfo("O usu�rio escolheu a op��o: N�o")
EndIf

Return nRetorno