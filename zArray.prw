#include "Protheus.ch"

User Function zArray()

Local aFamilia :={"Suelen","Thiago"}
Local nFamilia := 1
Local nContador :=1

msginfo("Te amo demais "+aFamilia[1])

Aadd(aFamilia,"Thor")

For nFamilia :=1 to len (aFamilia)
	msginfo("Essas sao as pessoas da minha familia: "+aFamilia[nFamilia])
next nFamilia

While len(aFamilia) <= 3
	alert("Passando por um while "+cValtoChar(nContador))
	nContador++
Enddo

return