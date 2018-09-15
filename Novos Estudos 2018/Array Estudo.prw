#include "Protheus.ch"

user function arrays()//u_arrays()

Local aNomes := {"Suelen","Thiago"}
Local nx := 1

Alert(aNomes[2])

Aadd(aNomes,"Thor")

Alert(aNomes[3])

For nx := 1 to len (aNomes)
	msginfo("Minha familia e formada por: "+cValtoChar(aNomes[nx]))
next nx

return