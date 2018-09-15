//Bibliotecas
#Include "Protheus.ch"
 
/*/{Protheus.doc} zTeste
Fun��o de Teste
@type function
@author Terminal de Informa��o
@since 13/11/2016
@version 1.0
    @example
    u_zTeste()
/*/
  
User Function zTeste()
    Local cArqAux := ""
     
    //Chamando o cGetFile para pegar um arquivo txt ou xml, mostrando o servidor
    cArqAux := cGetFile( 'Arquivo TXT|*.txt| Arquivo XML|*.xml',; //[ cMascara],
                         'Selecao de Arquivos',;                  //[ cTitulo],
                         0,;                                      //[ nMascpadrao],
                         'C:\TOTVS\',;                            //[ cDirinicial],
                         .F.,;                                    //[ lSalvar],
                         GETF_LOCALHARD  + GETF_NETWORKDRIVE,;    //[ nOpcoes],
                         .T.)                                     //[ lArvore]
     
    MsgInfo("O arquivo escolhido � "+cArqAux, "Aten��o")
Return