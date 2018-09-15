#Include 'Protheus.ch'
#Include 'FWMVCDEF.ch'

User Function CMVC_01()
Local oBrowse

 oBrowse := FWMBrowse():New()
 oBrowse:SetAlias('ZB2')
 oBrowse:SetDescription('Cadastro de Alunos')
 oBrowse:Activate()
 
 MenuDef()
 ModelDef()
 ViewDef()
Return

Static Function MenuDef()
Local aRotina := {}

aAdd( aRotina, { 'Visualizar', 'VIEWDEF.CMVC_01', 0, 2, 0, NIL } ) 
aAdd( aRotina, { 'Incluir' , 'VIEWDEF.CMVC_01', 0, 3, 0, NIL } )
aAdd( aRotina, { 'Alterar' , 'VIEWDEF.CMVC_01', 0, 4, 0, NIL } )
aAdd( aRotina, { 'Excluir' , 'VIEWDEF.CMVC_01', 0, 5, 0, NIL } )
aAdd( aRotina, { 'Imprimir' , 'VIEWDEF.CMVC_01', 0, 8, 0, NIL } )
aAdd( aRotina, { 'Copiar' , 'VIEWDEF.CMVC_01', 0, 9, 0, NIL } ) 

Return aRotina

Static Function ModelDef()
Local oModel
Local oStruZB2 := FWFormStruct(1,"ZB2")

 oModel := MPFormModel():New("MD_ALUNO") 
 oModel:addFields('MASTERZB2',,oStruZB2)
 
Return oModel

Static Function ViewDef()
Local oModel := ModelDef()
Local oView
Local oStrZB2:= FWFormStruct(2, 'ZB2')
 
 oView := FWFormView():New()
 oView:SetModel(oModel)
 oView:AddField('FORM_ALUNO' , oStrZB2,'MASTERZB2' ) 
 oView:CreateHorizontalBox( 'BOX_FORM_ALUNO', 100)
 oView:SetOwnerView('FORM_ALUNO','BOX_FORM_ALUNO')
 
Return oView