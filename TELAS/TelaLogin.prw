#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'FONT.CH'
#INCLUDE 'COLORS.CH'

User Function TELALOG()

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Declaração de cVariable dos componentes                                 ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
Private cCombo01   := Space(40)
Private cCombo02   := Space(10)

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Declaração de Variaveis Private dos Objetos                             ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
SetPrvt("oFont1","oFont2","oDlg1","oPanel1","oSay1","oSay2","oSay3","oBmp1","oGet1","oGet2","oBtn1","oBtn2")

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Definicao do Dialog e todos os seus componentes.                        ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
oFont1     := TFont():New( "MS Sans Serif",0,-13,,.F.,0,,400,.F.,.F.,,,,,, )
oFont2     := TFont():New( "MS Sans Serif",0,-11,,.T.,0,,700,.F.,.F.,,,,,, )
oDlg1      := MSDialog():New( 088,202,460,519,"TELA DE LOGIN",,,.F.,,,,,,.T.,,,.T. )
oPanel1    := TPanel():New( 000,000,"",oDlg1,,.F.,.F.,,,144,172,.T.,.F. )
oSay1      := TSay():New( 012,048,{||"TELA DE LOGIN"},oPanel1,,oFont2,.F.,.F.,.F.,.T.,CLR_BLUE,CLR_WHITE,048,008)
oSay2      := TSay():New( 072,008,{||"Usuário"},oPanel1,,oFont1,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay3      := TSay():New( 108,008,{||"Senha"},oPanel1,,oFont1,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oBmp1      := TBitmap():New( 028,032,088,028,,"C:\Users\daday\Pictures\Amor.jpeg",.F.,oPanel1,,,.F.,.T.,,"",.T.,,.T.,,.F. )
oGet1      := TGet():New( 072,040,{|u| If(PCount()>0,cCombo01:=u,cCombo01)},oPanel1,088,010,'',,CLR_BLACK,CLR_WHITE,oFont1,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cCombo01",,)
oGet2      := TGet():New( 108,040,{|u| If(PCount()>0,cCombo02:=u,cCombo02)},oPanel1,088,010,'',,CLR_BLACK,CLR_WHITE,oFont1,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cCombo02",,)
oBtn1      := TButton():New( 148,024,"Confirma",oPanel1,{||Botoes(),oDlg1:End()},037,012,,,,.T.,,"",,,,.F. )
oBtn2      := TButton():New( 148,080,"Cancela",oPanel1,{||oDlg1:End()},037,012,,,,.T.,,"",,,,.F. )

oDlg1:Activate(,,,.T.)

Return

Static Function Botoes()
	
MsgInfo("O Usuário " + Alltrim(cCombo01) + " Confirmou!")

Return

