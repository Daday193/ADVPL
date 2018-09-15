#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"

//Comando de repeti��o - PROCEDIMENTOS OU FUN��ES
//Aula de l�gica de programa��o no Youtube: https://www.youtube.com/watch?v=aDhWynNwEdk

User function ComFun()
Local nOpcao := 2 //Vari�vel local s� funciona dentro do escopo.
Private cVarAux := 'Vazio' //Variavel privada sofre altera��o em qualuqer outro M�TODO(escopo).

Do case
	Case nOpcao == 0
		U_APVInicio() //Procedimento
		
	Case nOpcao == 1
		cVarAux := U_APVRetorno(nOpcao) //Fun��o pois tem RETORNO
		
	Case ((nOpcao == 2) .or. (nOpcao == 3)) //Fun��o pois tem RETORNO
		cVarAux := U_APVTimeOut(nOpcao)
		
Endcase

alert(cVarAux)

Return cVarAux

//M�todo Um(1)---------------------------------------------------------------------------------
User function APVInicio()

cVarAux := 'Preenchido'

Return

//M�todo Dois(2)---------------------------------------------------------------------------------
User function APVRetorno(nOpcao)
Local _cNewVar

If nOpcao == 1
	_cNewVar := 'Preenchido Um'
Endif 

Return _cNewVar

//M�todo Tr�s(3)---------------------------------------------------------------------------------
User function APVTimeOut(nOpcao)
Local _cNewVar

If nOpcao == 2
	_cNewVar := 'Preenchido Dois'
Elseif nOpcao == 3
	_cNewVar := 'Preenchido Tr�s'
Endif

Return _cNewVar