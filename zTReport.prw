#include 'Protheus.ch'

user function EXCLIE()

local oReport
local cPerg  := 'EXTREPCLI'
local cAlias := getNextAlias()

criaSx1(cPerg)
Pergunte(cPerg, .F.)

oReport := reportDef(cAlias, cPerg)
oReport:printDialog()

return
        
//+-----------------------------------------------------------------------------------------------+
//! Rotina para montagem dos dados do relatório.                                  !
//+-----------------------------------------------------------------------------------------------+
Static Function ReportPrint(oReport,cAlias)
              
local oSecao1 := oReport:Section(1)

oSecao1:BeginQuery()

BeginSQL Alias cAlias
 
 SELECT A2_COD, A2_NOME, A2_MUN, A2_EST
 FROM %Table:SA2% SA2
 WHERE A2_COD >= '000001'
 
EndSQL

oSecao1:EndQuery()
oReport:SetMeter((cAlias)->(RecCount()))
oSecao1:Print() 

return

//+-----------------------------------------------------------------------------------------------+
//! Função para criação da estrutura do relatório.                                                !
//+-----------------------------------------------------------------------------------------------+
Static Function ReportDef(cAlias,cPerg)

local cTitle  := "Relatorio de Fornecedores"
local cHelp   := "Permite gerar relatorio de Fornecedores."
local oReport
local oSection1

oReport := TReport():New('EXCLI',cTitle,cPerg,{|oReport|ReportPrint(oReport,cAlias)},cHelp)

//Primeira seção
oSection1 := TRSection():New(oReport,"Fornecedores",{"SA2"}) 

TRCell():New(oSection1,"A2_COD", "SA2", "Codigo")
TRCell():New(oSection1,"A2_NOME", "SA2", "Nome") 
TRCell():New(oSection1,"A2_MUN", "SA2", "Cidade") 
TRCell():New(oSection1,alltrim("A2_EST"), "SA2", "Estado") 

Return(oReport)

//+-----------------------------------------------------------------------------------------------+
//! Função para criação das perguntas (se não existirem)                                          !
//+-----------------------------------------------------------------------------------------------+
static function criaSX1(cPerg)

putSx1(cPerg, '01', 'Cliente de?'          , '', '', 'mv_ch1', 'C', 6, 0, 0, 'G', '', 'SA2', '', '', 'mv_par01')
putSx1(cPerg, '02', 'Cliente até?'         , '', '', 'mv_ch2', 'C', 6, 0, 0, 'G', '', 'SA2', '', '', 'mv_par02')

return  