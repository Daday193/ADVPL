#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"

//Comando de repetição - DO WHILE
//Aula de lógica de programação no Youtube: https://www.youtube.com/watch?v=aDhWynNwEdk

User function ComWhile()
Local _lLogico := .T. //lLogico é VERDADEIRO
Local _nVar := 0
Local _cVar := 'Números: '

Do While _lLogico //Faça algo enquanto lLogico for VERDADEIRO
	_cVar += alltrim(str(_nVar)) //"+=" CONCATENA algo.
	_nVar++
	//Coloca a vírgula até números menor ou igual a 10.
	if _nVar <=10
		_cVar +=', '
	Endif
	if _nVar > 10
		_lLogico := .F. //lLogico virou FALSO
	Endif
Enddo

alert(_cVar)

Return