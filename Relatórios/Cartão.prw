#INCLUDE "RWMAKE.CH"
#INCLUDE "COLORS.CH"
#INCLUDE "FONT.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "PROTHEUS.CH"

User Function MyFunction()
Local aArea := GetArea()
Private	cImag001	:=	"C:\Users\daday\Pictures\Amor.Jpeg"
Private oAria14NI	:=	TFont():New("Arial",,14,,.T.,,,,,.F.,.T.)
Private oAria11NI	:=	TFont():New("Arial",,11,,.T.,,,,,.F.,.T.)
Private oPrinter  	:=	tAvPrinter():New("MyFunction")

  oPrinter:Setup()
  oPrinter:SetPortrait()
  oPrinter:StartPage()
  oPrinter:SetPaperSize(1) 
  printPage()
  oPrinter:Preview()

  RestArea(aArea)
Return

Static Function printPage()

	dbSelectArea("BA1")
	dbSetOrder(1)
	

  oPrinter:SayBitMap(1777,0147,cImag001,0233,0158)

  oPrinter:Say(1824,0450,"Cartão de Identificação",oAria14NI,,0)

  oPrinter:Say(1975,0184,("NOME: " + ALLTRIM(BA1_NOMUSR)),oAria14NI,,0)

  oPrinter:Say(2040,0179,("Matrícula: " + ALLTRIM(BA1_MATRIC)),oAria14NI,,0)

  oPrinter:Say(2106,0177,("Data Inclusão: " + cValtoChar(DtoC(BA1_DATINC))),oAria14NI,,0)

  oPrinter:Say(2220,0702,"Família Amaral´s",oAria11NI,,0)

  oPrinter:Box(1780,0142,1937,0375)

  oPrinter:Box(1764,0137,2262,1073)

Return
