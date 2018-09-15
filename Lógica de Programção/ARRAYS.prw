//Bibliotecas
#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"
#include "tbiconn.ch"

User Function EstArry()
Local aLetras                  // Declaração da variável 

Private oProcess := NIL 

aLetras := {"A", "B", "C"}     // Atribuição do array a variável 

//Barras de processamento para acompanhamento do processo.
oProcess := MsNewProcess():New( { | lEnd | ( @lEnd, aLetras ) }, 'Atualizando', 'Aguarde, atualizando ...', .F. )
			oProcess:Activate()

Alert(aLetras[2])              // Exibe o segundo elemento do array 
Alert(cValToChar(Len(aLetras)))// Exibe o tamanho do array  

//O ADVPL permite a manipulação de arrays facilmente.
AADD(aLetras,"D")  // Adiciona o quarto elemento ao final do array. 
Alert(aLetras[4])  // Exibe o quarto elemento. 
Alert(aLetras[5])  // Erro! Não há um quinto elemento no array.   

Return