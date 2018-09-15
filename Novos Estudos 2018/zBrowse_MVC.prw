#include "Protheus.ch"
#include "Totvs.ch"
#include "fwmvcdef.ch"

user function zBrowse()

Local oBrowse

oBrowse := FWMBrowse():New()
oBrowse:SetAlias('SA2')
oBrowse:SetFilterDefault("A2_TIPO =='J'")

oBrowse:SetDescription('Cadastro de Fornecedores do Thiago')

oBrowse:Activate()

return