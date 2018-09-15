#include "TOTVS.CH"

User Function TstPrint()

  DEFINE DIALOG oDlg TITLE "How to - Desenho Tela" FROM 180,180 TO 550,700 PIXEL
    
    oPanel := TPaintPanel():new(0,0,260,184,oDlg)
		
    // Adiciona Container
    oPanel:addShape("id=1;type=1;left=4;top=4;width=500;height=310;"+;
                    "gradient=1,0,0,0,0,0.0,#D0CEBC;pen-width=1;"+;
                    "pen-color=#ffffff;can-move=0;can-mark=0;is-container=1;")
	
    // Adiciona imagem, neste caso um gráfico
    oPanel:addShape("id=2;type=4;start-angle=90;sweep-length=200;left=10;"+;
                    "top=10;width=300;height=300;gradient=2,150,150,170,-1,0.2,"+;
                    "#ffffff,0.8,#67FF67,1.0,#000000;gradient-hover=2,150,150,"+;
                    "170,-1,0.2,#ffffff,0.8,#C6FF9F,1.0,#000000;tooltip=Pizza 01;"+;
                    "pen-width=1;pen-color=#000000;can-move=1;can-mark=1;is-container=0;")
    oPanel:addShape("id=3;type=4;start-angle=290;sweep-length=120;left=10;top=10;"+;
                    "width=300;height=300;gradient=2,150,150,170,-1,0.2,#ffffff,0.8,"+;
                    "#67FF67,1.0,#000000;gradient-hover=2,150,150,170,-1,0.2,#ffffff,"+;
                    "0.8,#C6FF9F,1.0,#000000;tooltip=Pizza 02;pen-width=1;"+;
                    "pen-color=#000000;can-move=1;can-mark=1;is-container=0;is-blinker=1;")
    oPanel:addShape("id=4;type=4;start-angle=410;sweep-length=040;left=10;top=10;"+;
                    "width=300;height=300;gradient=2,150,150,170,-1,0.2,#ffffff,0.8,"+;
                    "#67FF67,1.0,#000000;gradient-hover=2,150,150,170,-1,0.2,#ffffff,"+;
                    "0.8,#C6FF9F,1.0,#000000;tooltip=Pizza 03;pen-width=1;"+;
                    "pen-color=#000000;can-move=1;can-mark=1;is-container=0;is-blinker=1;")

    TButton():New(170,04,"Imprime",oDlg,{|| PanelPrint() },40,010,,,.F.,.T.,.F.,,.F.,,,.F. )

  ACTIVATE DIALOG oDlg CENTERED 

Return                                      

//-------------------------------------------------
// Função para impressão da imagem
// Esse exemplo de impressão deve obrigatoriamente
// ser executado no ambiente Ex: SIGAFAT
//--------------------------------------------------
Static Function PanelPrint()
  // Salva o conteúdo da imagem
  // repare que foi usado o tamanho do container
  cFile := "c:\dir\imagem.png"
  oPanel:saveToPng(4,4,500,310,cFile)                                                                

  // Monta objeto para impressão
  oPrint := TMSPrinter():New("How to")
  oPrint:SetPortrait()
  oPrint:StartPage()
		             
  // Insere imagem no relatório	            
  // Neste momento o tamanho da imagem pode assumir
  // o tamanho necessário pelo desenvolvedor, lembrando
  // que pode haver certa distorção no desenho dependendo
  // da altura e largura definida
  oPrint:SayBitmap( 4,4,cFile,1500,1000 )
 
  // Exibe preview
  oPrint:EndPage()
  oPrint:Preview() 
Return