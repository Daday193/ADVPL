//Bibliotecas
#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"
#include "tbiconn.ch"

//Os seguintes #defines podem ser criados para indicar cada posição dos valores dentro de um array: 
#define FUNCT_NOME   1 
#define FUNCT_IDADE  2 
#define FUNCT_CASADO 3

User Function EstArry2()
Local nCount 
/*
//Informando os Arrays(Primeiro Modelo)...
aFunct1 := {"Pedro",32,.T.} 
aFunct2 := {"Maria"  , 22, .T.} 
aFunct3 := {"Antônio", 42, .F.} 

MsgAlert(aFunct1[FUNCT_NOME]) 
MsgAlert(aFunct2[FUNCT_NOME]) 
MsgAlert(aFunct3[FUNCT_NOME])
*/

//Agora, ao invés de trabalhar com variáveis individuais, pode-se agrupá-las em um outro array.
aFuncts := { {"Pedro"  , 32, .T.}, ;
             {"Maria"  , 22, .T.}, ; 
             {"Antônio", 42, .F.} } 

//aFuncts é um array com 3 linhas por 3 colunas. Uma vez que as variáveis separadas foram combinadas em um array, os nomes podem ser exibidos assim: 

For nCount := 2 To Len(aFuncts) 
MsgInfo(aFuncts[nCount, FUNCT_NOME]) 
Next nCount
//A variável nCount seleciona que funcionário (ou que linha) é de interesse. Então a constante FUNCT_NOME seleciona a primeira coluna daquela linha. 


Return 