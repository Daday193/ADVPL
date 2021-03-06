#Include "Protheus.ch"

User Function RERPM01()

Private cDirect    := "C:\TOTVS 12\"
Private cArquivo    := "arquivo_teste.txt"

	//Cria豫o do arquivo XML
    fCriaXML()
     
    //Leitura do arquivo XML
    fLeXML()

Static Function fCriaXML()
Local nAtu 	  := 1

//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
//쿑Create - � o comando responsavel pela cria豫o do arquivo.                                                         �
//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
Local nHandle := FCreate(cDirect+cArquivo)
Local nCount  := 0

//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
//쿻Handle - A fun豫o FCreate retorna o handle, que indica se foi poss�vel ou n�o criar o arquivo. Se o valor for     �
//쿺enor que zero, n�o foi poss�vel criar o arquivo.                                                                  �
//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
If nHandle < 0
	MsgAlert("Erro durante cria豫o do arquivo.")
Else

	dbSelectArea("BA1")
	dbSetOrder(1)
	
	//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
	//쿑Write - Comando reponsavel pela grava豫o do texto.                                                                �
	//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
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
		dbSkip()//Move o cursor do registro posicionado para o pr�ximo registro.
	EndDo
	
	dbCloseArea()
		FWrite(nHandle,"</usuarios>"+ CRLF)
		FWrite(nHandle,"</dados>" + CRLF)
		
	//旼컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
	//쿑Close - Comando que fecha o arquivo, liberando o uso para outros programas.                                       �
	//읕컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�
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
        //Lendo o arquivo com XMLParser (l� a string), caso queira ler o arquivo direto, utilize o XMLParserFile (o arquivo deve estar dentro da system)
        oLido := XmlParser(MemoRead(cDirect+cArquivo), cReplace, @cErros, @cAvisos)
         
        //Se tiver erros, mostra ao usu�rio
        If !Empty(cErros)
            Aviso('Aten豫o', "Erros: "+cErros, {'Ok'}, 03)
        EndIf
         
        //Se tiver avisos, mostra ao usu�rio
        If !Empty(cAvisos)
            Aviso('Aten豫o', "Avisos: "+cAvisos, {'Ok'}, 03)
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
        Aviso('Aten豫o', cMsg, {'Ok'}, 03)
    EndIf
Return