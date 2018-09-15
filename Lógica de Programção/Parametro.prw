#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"

User Function CalcFator(nFator) 
Local nCnt 
Local nResultado := 0  

//Default nFator := 1

For nCnt := nFator To 1 Step -1
	nResultado *= nCnt
Next nCnt

	Alert("O fatorial de " + cValToChar(nFator) +  " é " + cValToChar(nResultado)) 

Return nResultado