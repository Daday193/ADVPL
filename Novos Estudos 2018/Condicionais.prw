#include "Protheus.ch"

user function zControle()
Local nIdade := 26

If nIdade == 27
	msginfo("A idade e 27")
ElseIf nIdade < 27
	msginfo("A idade e menor que 27")
Else
	msginfo("A idade e maior que 27")
EndIf

return