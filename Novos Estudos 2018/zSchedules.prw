#include 'Protheus.ch'

/*
 Função para fazer agendamentos de Schedules e imprimir no AppServer.
*/

User Function zAgenda()

dbSelectArea('SA2')
dbSetOrder(1)

While !EOF()
	ConOut('O nome e: '+A2_NOME)
	dbSkip()
EndDo

dbCloseArea()

Return