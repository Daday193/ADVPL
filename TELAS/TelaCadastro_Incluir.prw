#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'RWMAKE.CH'
#INCLUDE 'FONT.CH'
#INCLUDE 'COLORS.CH'

/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
±±ÚÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄ¿±±
±±³Programa  ³         ³ Autor ³                       ³ Data ³           ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄ´±±
±±³Locacao   ³                  ³Contato ³                                ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Descricao ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Parametros³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Retorno   ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Aplicacao ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Uso       ³                                                            ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÁÄÄÄÂÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³Analista Resp.³  Data  ³                                               ³±±
±±ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´±±
±±³              ³  /  /  ³                                               ³±±
±±³              ³  /  /  ³                                               ³±±
±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±±
ßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßßß*/

User Function NewSource

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Declaração de cVariable dos componentes                                 ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
Private cCGC       := Space(14)
Private cCodTab    := Space(6)
Private cNOME      := Space(40)
Private dNIVER     := CtoD(" ")
Private nCombo01  
Private nVALOR     := 0

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Declaração de Variaveis Private dos Objetos                             ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
SetPrvt("oFont1","oFont2","oDlg1","oPanel1","oSay1","oSay2","oSay3","oSay4","oSay5","oSay6","oSay7","oGet1")
SetPrvt("oGet4","oGet5","oGet6","oCBox1","oBtn1")

/*ÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ±±
±± Definicao do Dialog e todos os seus componentes.                        ±±
Ù±±ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ*/
oFont1     := TFont():New( "MS Sans Serif",0,-16,,.T.,0,,700,.F.,.F.,,,,,, )
oFont2     := TFont():New( "MS Sans Serif",0,-13,,.F.,0,,400,.F.,.F.,,,,,, )
oDlg1      := MSDialog():New( 088,232,587,1083,"CADASTRO DE PESSOAS",,,.F.,,,,,,.T.,,,.T. )
oPanel1    := TPanel():New( 000,000,"",oDlg1,,.F.,.F.,,,420,244,.T.,.F. )
oSay1      := TSay():New( 004,132,{||"CADASTRO DE PESSOAS THIAGO"},oPanel1,,oFont1,.F.,.F.,.F.,.T.,CLR_BLUE,CLR_WHITE,164,016)
oSay2      := TSay():New( 080,032,{||"NOME"},oPanel1,,oFont2,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay3      := TSay():New( 104,032,{||"TP. PESSOA"},oPanel1,,oFont2,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,040,008)
oSay4      := TSay():New( 128,032,{||"CGC"},oPanel1,,oFont2,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay5      := TSay():New( 156,032,{||"ANIVERS"},oPanel1,,oFont2,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oSay6      := TSay():New( 180,032,{||"VLR. AÇÃO"},oPanel1,,oFont2,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,040,008)
oSay7      := TSay():New( 052,032,{||"CÓDIGO"},oPanel1,,oFont2,.F.,.F.,.F.,.T.,CLR_BLACK,CLR_WHITE,032,008)
oGet1      := TGet():New( 076,092,{|u| If(PCount()>0,cNOME:=u,cNOME)},oPanel1,316,010,'',,CLR_BLACK,CLR_WHITE,oFont2,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cNOME",,)
oGet3      := TGet():New( 124,092,{|u| If(PCount()>0,cCGC:=u,cCGC)},oPanel1,060,010,'',,CLR_BLACK,CLR_WHITE,oFont2,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cCGC",,)
oGet4      := TGet():New( 152,092,{|u| If(PCount()>0,dNIVER:=u,dNIVER)},oPanel1,060,010,'',,CLR_BLACK,CLR_WHITE,oFont2,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","dNIVER",,)
oGet5      := TGet():New( 176,092,{|u| If(PCount()>0,nVALOR:=u,nVALOR)},oPanel1,060,010,'',,CLR_BLACK,CLR_WHITE,oFont2,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","nVALOR",,)
oGet6      := TGet():New( 052,092,{|u| If(PCount()>0,cCodTab:=u,cCodTab)},oPanel1,060,010,'',,CLR_BLACK,CLR_WHITE,oFont2,,,.T.,"",,,.F.,.F.,,.F.,.F.,"","cCodTab",,)
oCBox1     := TComboBox():New( 100,092,{|u| If(PCount()>0,nCombo01:=u,nCombo01)},,072,012,oPanel1,,,,CLR_BLACK,CLR_WHITE,.T.,oFont2,"",,,,,,,nCombo01 )
oBtn1      := TButton():New( 216,368,"INCLUIR",oPanel1,,037,012,,,,.T.,,"",,,,.F. )

oDlg1:Activate(,,,.T.)

Return

