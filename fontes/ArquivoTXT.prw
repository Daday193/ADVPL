#Include "Protheus.ch"

User Function RERPM01()

Private cDirect    := "C:\TOTVS 12\"
Private cArquivo    := "arquivo_teste.txt"

	//Criação do arquivo XML
    fCriaXML()
     
    //Leitura do arquivo XML
    fLeXML()

Static Function fCriaXML()
Local nAtu 	  := 1

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³FCreate - É o comando responsavel pela criação do arquivo.                                                         ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
Local nHandle := FCreate(cDirect+cArquivo)
Local nCount  := 0

//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
//³nHandle - A função FCreate retorna o handle, que indica se foi possível ou não criar o arquivo. Se o valor for     ³
//³menor que zero, não foi possível criar o arquivo.                                                                  ³
//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
If nHandle < 0
	MsgAlert("Erro durante criação do arquivo.")
Else

	dbSelectArea("BA1")
	dbSetOrder(1)
	
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³FWrite - Comando reponsavel pela gravação do texto.                                                                ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
		FWrite(nHandle, "<?xml version='1.0' encoding='UTF-8' ?>"+Chr(13)+Chr(10))
        FWrite(nHandle, "<dados>"+Chr(13)+Chr(10))
        FWrite(nHandle, "<data>"+dToC(dDataBase)+"</data>"+Chr(13)+Chr(10))
        FWrite(nHandle, "<hora>"+Time()+"</hora>"+Chr(13)+Chr(10))
        FWrite(nHandle, "<usuarios>"+Chr(13)+Chr(10))
	
	Do While !EoF()
		FWrite(nHandle,'  <usuario id="'+cValToChar(nAtu)+'">'+ CRLF)
		FWrite(nHandle,"    <nome>" +ALLTRIM(BA1_NOMUSR)+"</nome>" + CRLF)
		FWrite(nHandle,"  </usuario>"+ CRLF)
		
		nAtu++
		dbSkip()//Move o cursor do registro posicionado para o próximo registro.
	EndDo
	
	dbCloseArea()
		FWrite(nHandle,"</usuarios>"+ CRLF)
		FWrite(nHandle,"</dados>" + CRLF)
		
	//ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
	//³FClose - Comando que fecha o arquivo, liberando o uso para outros programas.                                       ³
	//ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
	FClose(nHandle)

	//Abrindo o arquivo
    ShellExecute("OPEN", cArquivo, "", cDirect, 0 )
    
EndIf

Return

Static Function fLeXML()
    Local oLido    := Nil
    Local oUsers   := Nil
    Local nAtual   := 0
    Local cReplace := "_"
    Local cErros   := ""
    Local cAvisos  := ""
    Local cMsg     := ""
     
    //Se o arquivo existir
    If File(cDirect+cArquivo)
        //Lendo o arquivo com XMLParser (lê a string), caso queira ler o arquivo direto, utilize o XMLParserFile (o arquivo deve estar dentro da system)
        oLido := XmlParser(MemoRead(cDirect+cArquivo), cReplace, @cErros, @cAvisos)
         
        //Se tiver erros, mostra ao usuário
        If !Empty(cErros)
            Aviso('Atenção', "Erros: "+cErros, {'Ok'}, 03)
        EndIf
         
        //Se tiver avisos, mostra ao usuário
        If !Empty(cAvisos)
            Aviso('Atenção', "Avisos: "+cAvisos, {'Ok'}, 03)
        EndIf
         
        //Montando a Mensagem, data e hora
        cMsg := "Data: "+oLido:_Dados:_Data:Text + Chr(13)+Chr(10)
        cMsg := "Hora: "+oLido:_Dados:_Hora:Text + Chr(13)+Chr(10)
         
        //Percorrendo os usuarios
        oUsers := oLido:_Dados:_usuarios:_usuario
        For nAtual := 1 To Len(oUsers)
            cMsg += "ID: "+oUsers[nAtual]:_ID:Text+", "
            cMsg += "Nome: "+oUsers[nAtual]:_nome:Text
            cMsg += Chr(13)+Chr(10)
        Next
         
        //Mostrando a mensagem do xml lido
        Aviso('Atenção', cMsg, {'Ok'}, 03)
    EndIf
Return