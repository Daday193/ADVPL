#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"

//Seleção e decisão Multipla com Static Function
//Aula de lógica de programação no Youtube: https://www.youtube.com/watch?v=HsL3JPrZ_Yw

User function condMult()
Local nOpcao := 2

Do case
	Case nOpcao == 0
		//U_APVInicio()
		Alert("Escolhemos Zero")
	Case nOpcao == 1
		//U_APVRetorno(oProcess)
		Alert("Escolhemos Um!")
	Case ((nOpcao == 2) .or. (nOpcao == 3))
		//U_APVTimeOut(oProcess,nOpcao)
		APVTime()
Endcase

Return

Static Function APVTime()

Alert("Minha Static Function funcionou!")

Return		
				