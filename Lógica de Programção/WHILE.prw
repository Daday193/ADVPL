#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"

//Comando de repeti��o - DO WHILE
//Aula de l�gica de programa��o no Youtube: https://www.youtube.com/watch?v=aDhWynNwEdk

User function ComWhile()
Local _lLogico := .T. //lLogico � VERDADEIRO
Local _nVar := 0
Local _cVar := 'N�meros: '

Do While _lLogico //Fa�a algo enquanto lLogico for VERDADEIRO
	_cVar += alltrim(str(_nVar)) //"+=" CONCATENA algo.
	_nVar++
	//Coloca a v�rgula at� n�meros menor ou igual a 10.
	if _nVar <=10
		_cVar +=', '
	Endif
	if _nVar > 10
		_lLogico := .F. //lLogico virou FALSO
	Endif
Enddo

alert(_cVar)

Return