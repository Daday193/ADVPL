#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"

//Comando de repetição - FOR NEXT
//Aula de lógica de programação no Youtube: https://www.youtube.com/watch?v=oEp7YLknObc

User function ComRep()
Local aNotas := {7,5,10} //Array de notas na escola
Local nContador :=	0

For nContador := 1 to len(aNotas) //Len conta tudo contido dentro do Array.
	alert(alltrim(str(nContador)) + ' 1°Nota: ' + str(aNotas[nContador]))
Next nContador

/*
For nContador :=1 to 3
	alert('Imprimir')
Next nContador
*/

Return
