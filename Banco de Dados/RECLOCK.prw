//Bibliotecas
#Include "Protheus.ch"
#Include "TopConn.ch"

//Aula sobre inclusão de dados em tabelas customizadas: https://www.youtube.com/watch?v=oZkFCZWrW7M

User function Inclusao(_Filial,_Codigo,_Nome,_Aniversario,_CGC,_Tipo,_Valor)

dbSelectArea("ZZ9")

RECLOCK("ZZ9",.T.) //Incluir - RECLOCK( <cAlias>, <lInclui> )

ZZ9->ZZ9_FILIAL :=_Filial //Retorna a Filial de acordo com as configurações do Sistema
ZZ9->ZZ9_COD 	:=_Codigo
ZZ9->ZZ9_NOME 	:=_Nome
ZZ9->ZZ9_ANIVER :=_Aniversario
ZZ9->ZZ9_CGC :=_CGC
ZZ9->ZZ9_PESSOA :=_Tipo
ZZ9->ZZ9_VALOR :=_Valor

MSUNLOCK() //Destrava o registro

Return