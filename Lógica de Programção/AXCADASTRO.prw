#Include "Protheus.ch"

//Aula de cria��o de tela em AXCADASTRO: https://www.youtube.com/watch?v=asrqXzflnjM

User function AXCAD01()


Local cVldAlt := ".T." //Valida��o para permitir Altera��o
Local cVldExc := ".T." //Valida��o para permitir Exclus�o
Private cString := "ZZ9"
Private cPerg := "PEGZZ9"

dbSelectArea ("ZZ9")
dbSetOrder(1)

cPerg := "PEGZZ9"

Pergunte(cPerg,.F.)
SetKey(123,{|| Pergunte(cPerg,.T.)}) //Seta a tecla F12 para acionamento dos par�metros

AxCadastro(cString,"Cadastro de Pessoas",cVldExc,cVldAlt)

Set Key 123 To //Desativa a tecla F12 do acionamento dos par�metros

Return