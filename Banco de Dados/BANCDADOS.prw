#INCLUDE "Protheus.ch"
#INCLUDE "Rwmake.ch"
#INCLUDE "Topconn.ch"
#INCLUDE "Font.ch"
#INCLUDE "Colors.ch"

User function ProxNum()
Local cNum := ""
Local cQuery := ""
Local QRYGM := ""

//SELECT nas tabelas do Banco de Dados
cQuery := "SELECT MAX(ZZ9_COD) AS SEQMAX FROM	"+retSqlName("ZZ9")+"	" 
cQuery += "WHERE D_E_L_E_T_=' '"

QRYGM := GetNextAlias()

//Pega o SELECT e joga numa tabela temporária do Protheus para uso.
dbUseArea(.T.,'TOPCONN',TCGenQry(,,cQuery),QRYGM, .F., .T.)

dbSelectArea (QRYGM)
if ((QRYGM)-> (EOF()) .AND. (QRYGM)->(BOF())) //Se for final(EOF) do arquivo e inicio(BOF) do arquivo.
	cNum := strzero(1,6) //Se não tiver registros, tras Um(1), com quantidade Seis(6)
			//strzero - Vai preencher com zero até dar os Seis digitos.
Else
	cNum :=SOMA1 ((QRYGM)->SEQMAX)
			//SOMA1 - Soma mais um como Numérico, e depois volta para String.
	
Endif

if Select(QRYGM) >0 //Se o preenchimento foi maior que zero, ele pode fechar a tabela.
	dbSelectArea (QRYGM)
	dbCloseArea (QRYGM)
Endif

Return cNum //Retorna ao cNum para preencher o próximo número.