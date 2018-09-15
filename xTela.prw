#include "Protheus.ch"

User Function zTelas()

Local cTitulo := "Teste de tela"
Local cNome   := space(50)
Local nOpca	   

DEFINE MSDIALOG oDlg TITLE cTitulo FROM 000,000 TO 080,300 PIXEL

oSaySenha := tSay():New(012,010,{|| "Informe Seu Nome:"   },oDlg,,,,,,.T.,CLR_BLACK,CLR_WHITE,50,9)
oGetSenha := tGet():New(010,050,{|u| if(PCount()>0,cNome:=u,cNome)}, oDlg,080,9,"@A",{ ||  },,,,,,.T.,,, { || .T. } ,,,,.F.,,,'cNome')

oBtnOk := tButton():New(010,120,"Ok"  , oDlg, {|| nOpca := 1, ::End() },40,12,,,,.T.,,,, { ||  },,)

if nOpca == 1
	msginfo(cNome)
endif

ACTIVATE MSDIALOG oDlg CENTERED

return