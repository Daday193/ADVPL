//Bibliotecas
#include "Protheus.ch"
#include "Rwmake.ch"
#include "Topconn.ch"
#include "tbiconn.ch"

//Os seguintes #defines podem ser criados para indicar cada posi��o dos valores dentro de um array: 
#define FUNCT_NOME   1 
#define FUNCT_IDADE  2 
#define FUNCT_CASADO 3

User Function EstArry2()
Local nCount 
/*
//Informando os Arrays(Primeiro Modelo)...
aFunct1 := {"Pedro",32,.T.} 
aFunct2 := {"Maria"  , 22, .T.} 
aFunct3 := {"Ant�nio", 42, .F.} 

MsgAlert(aFunct1[FUNCT_NOME]) 
MsgAlert(aFunct2[FUNCT_NOME]) 
MsgAlert(aFunct3[FUNCT_NOME])
*/

//Agora, ao inv�s de trabalhar com vari�veis individuais, pode-se agrup�-las em um outro array.
aFuncts := { {"Pedro"  , 32, .T.}, ;
             {"Maria"  , 22, .T.}, ; 
             {"Ant�nio", 42, .F.} } 

//aFuncts � um array com 3 linhas por 3 colunas. Uma vez que as vari�veis separadas foram combinadas em um array, os nomes podem ser exibidos assim: 

For nCount := 2 To Len(aFuncts) 
MsgInfo(aFuncts[nCount, FUNCT_NOME]) 
Next nCount
//A vari�vel nCount seleciona que funcion�rio (ou que linha) � de interesse. Ent�o a constante FUNCT_NOME seleciona a primeira coluna daquela linha. 


Return 