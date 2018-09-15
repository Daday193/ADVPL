#include "protheus.ch"

/*Exemplo: Seleção de múltiplos arquivos com CGETFILE, DIRECTORY() e LISTBOX()
Função Principal: SELFILE()*/

USER FUNCTION SELFILE()
LOCAL cDirectory := ""
LOCAL aArquivos := {}
LOCAL nArq := 0
PRIVATE aParamFile:= ARRAY(1)
IF !PARBOXFILE()
RETURN
ENDIF
// Exibe a estrutura de diretório e permite a seleção dos arquivos que serão processados
cDirectory := ALLTRIM(cGetFile("Arquivos de Dados|'"+aParamFile[1]+"'|",
'Importação de lançamentos', 0,'', .T., GETF_OVERWRITEPROMPT + GETF_NETWORKDRIVE
+ GETF_RETDIRECTORY,.T.))
aArquivos := Directory(cDirectory+"*.*")
aArquivos := MARKFILE(aArquivos,cDirectory,aParamFile[1],@lSelecao)
FOR nArq TO Len(aArquivos)
IF !aArquivos[nArq][1]
LOOP
ENDIF
<...processamento...>
NEXT nArq
RETURN