#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'FONT.CH'
#INCLUDE 'COLORS.CH'

User Function NewSource()

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Declaração de cVariable dos componentes                                 ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
Private cDesc1     := Space(40)
Private cDesc2     := Space(40)
Private dDate      := CtoD(" ")
Private nCaixa     := 0
Private nCombo01  
Private nCombo02  
Private nCombo03  
Private nCombo04  
Private nDesp      := 0
Private nJuros1    := 0
Private nJuros2    := 0
Private nJuros3    := 0
Private nLiquido   := 0
Private nTotJuros  := 0
Private nValBtr    := 0
Private nValMat    := 0
Private nValMDO    := 0
Private nValor1    := 0
Private nValor2    := 0
Private nValor3    := 0

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Declaração de Variaveis Private dos Objetos                             ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
SetPrvt("oFont1","oDlg1","oPanel1","oSay1","oSay2","oSay3","oSay4","oSay5","oSay6","oSay7","oSay8","oSay9")
SetPrvt("oSay11","oSay12","oSay13","oSay14","oSay15","oSay16","oGet1","oGet2","oGet3","oGet4","oGet5")
SetPrvt("oGet7","oGet8","oGet9","oGet10","oCBox1","oCBox2","oCBox3","oCBox4","oGet11","oGet12","oGet13")
SetPrvt("oGet15","oGet16","oSBtn1")

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Definicao do Dialog e todos os seus componentes.                        ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
oFont1     := TFont():New( "MS Sans Serif",0,-16,,.T.,0,,700,.F.,.F.,,,,,, )
oDlg1      := MSDialog():New( 086,224,699,809,"GD MANUTENÇÕES",,,.F.,,,,,,.T.,,,.T. )
oPanel1    := TPanel():New( 000,000,"",oDlg1,,.F.,.F.,,,288,300,.T.,.F. )
oSay1      := TSay():New( 012,060,{||"MOVIMENTAÇÕES DIÁRIAS  INCLUIR"},oPanel1,,oFont1,.F.,.F.,.F.,.T.,CLR_BLUE,CLR_WHITE,160,012)
oSay2      := TSay():New( 036,072,{||"Data"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay3      := TSay():New( 036,164,{||"Descrição do Serviço"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,052,008)
oSay4      := TSay():New( 072,068,{||"Despesas"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay5      := TSay():New( 072,176,{||"Descrição"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay6      := TSay():New( 108,092,{||"VALORES DO SERVIÇO"},oPanel1,,oFont1,.F.,.F.,.F.,.T.,CLR_BLUE,CLR_WHITE,104,008)
oSay7      := TSay():New( 128,048,{||"Bruto"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay8      := TSay():New( 128,124,{||"Material"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay9      := TSay():New( 128,204,{||"Mão de Obra"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay10     := TSay():New( 164,040,{||"Pagto 1"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay11     := TSay():New( 164,104,{||"Pagto 2"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay12     := TSay():New( 164,164,{||"Pagto 3"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay13     := TSay():New( 164,224,{||"Parcelas"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay14     := TSay():New( 240,036,{||"% do Cartão"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay15     := TSay():New( 240,112,{||"Líquido"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay16     := TSay():New( 240,208,{||"CAIXA"},oPanel1,,,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oGet1      := TGet():New( 052,052,{|u| If(PCount()>0,dDate:=u,dDate)},oPanel1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","dDate",,)
oGet2      := TGet():New( 052,136,{|u| If(PCount()>0,cDesc1:=u,cDesc1)},oPanel1,128,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cDesc1",,)
oGet3      := TGet():New( 084,052,{|u| If(PCount()>0,nDesp:=u,nDesp)},oPanel1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nDesp",,)
oGet4      := TGet():New( 084,136,{|u| If(PCount()>0,cDesc2:=u,cDesc2)},oPanel1,128,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cDesc2",,)
oGet5      := TGet():New( 140,028,{|u| If(PCount()>0,nValBtr:=u,nValBtr)},oPanel1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nValBtr",,)
oGet6      := TGet():New( 140,104,{|u| If(PCount()>0,nValMat:=u,nValMat)},oPanel1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nValMat",,)
oGet7      := TGet():New( 140,192,{|u| If(PCount()>0,nValMDO:=u,nValMDO)},oPanel1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nValMDO",,)
oGet8      := TGet():New( 196,028,{|u| If(PCount()>0,nValor1:=u,nValor1)},oPanel1,052,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nValor1",,)
oGet9      := TGet():New( 196,092,{|u| If(PCount()>0,nValor2:=u,nValor2)},oPanel1,048,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nValor2",,)
oGet10     := TGet():New( 196,152,{|u| If(PCount()>0,nValor3:=u,nValor3)},oPanel1,048,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nValor3",,)
oCBox1     := TComboBox():New( 176,220,{|u| If(PCount()>0,nCombo01:=u,nCombo01)},,048,010,oPanel1,,,,CLR_BLACK,CLR_WHITE,.T.,,"",,,,,,,nCombo01 )
oCBox2     := TComboBox():New( 176,032,{|u| If(PCount()>0,nCombo02:=u,nCombo02)},,044,010,oPanel1,,,,CLR_BLACK,CLR_WHITE,.T.,,"",,,,,,,nCombo02 )
oCBox3     := TComboBox():New( 176,092,{|u| If(PCount()>0,nCombo03:=u,nCombo03)},,048,010,oPanel1,,,,CLR_BLACK,CLR_WHITE,.T.,,"",,,,,,,nCombo03 )
oCBox4     := TComboBox():New( 176,152,{|u| If(PCount()>0,nCombo04:=u,nCombo04)},,052,010,oPanel1,,,,CLR_BLACK,CLR_WHITE,.T.,,"",,,,,,,nCombo04 )
oGet11     := TGet():New( 216,028,{|u| If(PCount()>0,nJuros1:=u,nJuros1)},oPanel1,052,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nJuros1",,)
oGet12     := TGet():New( 216,092,{|u| If(PCount()>0,nJuros2:=u,nJuros2)},oPanel1,048,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nJuros2",,)
oGet13     := TGet():New( 216,152,{|u| If(PCount()>0,nJuros3:=u,nJuros3)},oPanel1,048,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nJuros3",,)
oGet14     := TGet():New( 252,028,{|u| If(PCount()>0,nTotJuros:=u,nTotJuros)},oPanel1,056,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nTotJuros",,)
oGet15     := TGet():New( 252,092,{|u| If(PCount()>0,nLiquido:=u,nLiquido)},oPanel1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nLiquido",,)
oGet16     := TGet():New( 252,188,{|u| If(PCount()>0,nCaixa:=u,nCaixa)},oPanel1,060,008,'',,CLR_BLACK,CLR_WHITE,,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nCaixa",,)
oSBtn1     := SButton():New( 280,240,1,,oPanel1,,"", )

oDlg1:Activate(,,,.T.)

Return
