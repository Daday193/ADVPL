#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"

//Comando de repetição - PROCEDIMENTOS OU FUNÇÕES
//Aula de lógica de programação no Youtube: https://www.youtube.com/watch?v=aDhWynNwEdk

User function ComFun()
Local nOpcao := 2 //Variável local só funciona dentro do escopo.
Private cVarAux := 'Vazio' //Variavel privada sofre alteração em qualuqer outro MÉTODO(escopo).

Do case
	Case nOpcao == 0
		U_APVInicio() //Procedimento
		
	Case nOpcao == 1
		cVarAux := U_APVRetorno(nOpcao) //Função pois tem RETORNO
		
	Case ((nOpcao == 2) .or. (nOpcao == 3)) //Função pois tem RETORNO
		cVarAux := U_APVTimeOut(nOpcao)
		
Endcase

alert(cVarAux)

Return cVarAux

//Método Um(1)---------------------------------------------------------------------------------
User function APVInicio()

cVarAux := 'Preenchido'

Return

//Método Dois(2)---------------------------------------------------------------------------------
User function APVRetorno(nOpcao)
Local _cNewVar

If nOpcao == 1
	_cNewVar := 'Preenchido Um'
Endif 

Return _cNewVar

//Método Três(3)---------------------------------------------------------------------------------
User function APVTimeOut(nOpcao)
Local _cNewVar

If nOpcao == 2
	_cNewVar := 'Preenchido Dois'
Elseif nOpcao == 3
	_cNewVar := 'Preenchido Três'
Endif

Return _cNewVar