#INCLUDE 'PROTHEUS.CH'
#INCLUDE 'RWMAKE.CH'


User Function WordImp()
                    
                    // caminho do arquivo .DOT
Local cPathDot  := "C:\TOTVS 12\microsiga\protheus_data\spool\CONTRATO.dot"     

//Conecta ao word
Private oWord := OLE_CreateLink()
OLE_NewFile(oWord, cPathDot ) 

                  // OLE_SetDocumentVar(objeto link,nome da docvariable no word,conteúdo a ser passado para o word)
OLE_SetDocumentVar(oWord,"Nome_vendedor","Fulano da Silva Nobre") 
OLE_SetDocumentVar(oWord,"Nacionalidade_vendedor","brasileira") 
OLE_SetDocumentVar(oWord,"Profissão_vendedor","Programador") 
OLE_SetDocumentVar(oWord,"EstCivil_vendedor","Casado") 
OLE_SetDocumentVar(oWord,"RG_vendedor","02344332 SSP/RJ") 
OLE_SetDocumentVar(oWord,"CPF_vendedor","065746342-53")
OLE_SetDocumentVar(oWord,"Endereco_vendedor","Av Marques de Andrade n° 123, Bairro Novo, Rio de Janeiro, RJ.")


OLE_UpdateFields(oWord) 

If MsgYesNo("Imprime o Documento ?")
 Ole_PrintFile(oWord,"ALL",,,1)
EndIf
  
If MsgYesNo("Fecha o Word e Corta o Link ?")
 OLE_CloseFile( oWord )
 OLE_CloseLink( oWord )
Endif 

Return
