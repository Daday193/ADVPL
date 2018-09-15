#Include 'protheus.ch'
#Include 'parmtype.ch'
#Include "RestFul.CH"
#Include "Topconn.ch"

/*/{Protheus.doc} EREST_01
Ensinando Rest em ADVPL
@author Victor Andrade
@since 13/04/2017
@version undefined
@type function
/*/

User Function EREST01()	
	
Return

/*/{Protheus.doc} PRODUTOS
Definição da estrutura do webservice
@author Victor Andrade
@since 13/04/2017
@type class
/*/


WSRESTFUL PRODUTOS DESCRIPTION "Servico REST para manipulacao de Produtos"
WSDATA CODPRODUTO As String //String que vamos receber via URL
 
WSMETHOD GET DESCRIPTION "Retorna o produto informado na URL" WSSYNTAX "/PRODUTOS || /PRODUTOS/{CODPRODUTO}" //Disponibilizamos um método do tipo GET
 
END WSRESTFUL

/*/{Protheus.doc} GET
Processa as informações e retorna o json
@author Victor Andrade
@since 13/04/2017
@version undefined
@param oSelf, object, Objeto contendo dados da requisição efetuada pelo cliente, tais como:
   - Parâmetros querystring (parâmetros informado via URL)
   - Objeto JSON caso o requisição seja efetuada via Request Post
   - Header da requisição
   - entre outras ...
@type Method
/*/

WSMETHOD GET WSRECEIVE CODPRODUTO WSSERVICE PRODUTOS
//--> Recuperamos o produto informado via URL 
//--> Podemos fazer dessa forma ou utilizando o atributo ::aUrlParms, que é um array com os parâmetros recebidos via URL (QueryString)
Local cCodProd := Self:CODPRODUTO
Local aArea		:= GetArea()
Local oObjProd	:= Nil
Local cStatus	:= ""
Local cJson		:= ""

// define o tipo de retorno do método
::SetContentType("application/json")

DbSelectArea("SB1")

SB1->( DbSetOrder(1) )

If SB1->( DbSeek( xFilial("SB1") + cCodProd ) )
	cStatus  := Iif( SB1->B1_MSBLQL == "1", "Sim", "Nao" )
	oObjProd := Produtos():New(SB1->B1_DESC, SB1->B1_UM, cStatus) //Cria um objeto da classe produtos para fazer a serialização na função FWJSONSerialize
EndIf

// --> Transforma o objeto de produtos em uma string json
cJson := FWJsonSerialize(oObjProd)

// --> Envia o JSON Gerado para a aplicação Client
::SetResponse(cJson)

RestArea(aArea)

Return(.T.)


User Function EREST01A()
Return

/*/{Protheus.doc} EREST_01A
Classe de produtos para realizar a serialização do objeto de produto
@author Victor Andrade
@since 14/04/2017
@version 1.0
@example
(examples)
@see (links_or_references)
/*/
Class Produtos
	
	Data cCodigo	As String
	Data cUM	  	As String
	Data cStatus 	As String 
	
	Method New(cCodigo, cUM, cStatus) Constructor 
EndClass
/*/{Protheus.doc} new
Metodo construtor
@author Victor Andrade
@since 14/04/2017 
@version 1.0
@example
(examples)
@see (links_or_references)
/*/
Method New(cCodProd, cUnidMed, cStatusPrd) Class Produtos
::cCodigo := cCodProd
::cUM 	  := cUnidMed
::cStatus := cStatusPrd
Return(Self)