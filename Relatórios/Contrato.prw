#INCLUDE "RWMAKE.CH"
#INCLUDE "COLORS.CH"
#INCLUDE "FONT.CH"
#INCLUDE "TOPCONN.CH"
#INCLUDE "PROTHEUS.CH"


User Function PLS260BUT
	Local aArea := GetArea()
	Local aButtons := {}
		
		aAdd(aButtons,{'CONTRATO', {||u_Contrato()}, 'CONTRATO'})
		
	RestArea(aArea)
Return(aButtons)

User Function Contrato()
	Private	cImag001	:=	"C:\Users\daday\Pictures\Centtralmed.png"
	Private	cImag002	:=	"C:\Users\daday\Pictures\Clausulas.png"
	Private oArial30  	:=	TFont():New("Arial",,30,,.F.,,,,,.F.,.F.)
	Private oArial14  	:=	TFont():New("Arial",,14,,.F.,,,,,.F.,.F.)
	Private oArial11  	:=	TFont():New("Arial",,11,,.F.,,,,,.F.,.F.)
	Private oArial11N	:=	TFont():New("Arial",,11,,.T.,,,,,.F.,.F.)
	Private oArial14N	:=	TFont():New("Arial Narrow",,14,,.T.,,,,,.F.,.F.)
	Private oArial15N	:=	TFont():New("Arial Narrow",,15,,.T.,,,,,.F.,.F.)
	Private oArial10N	:=	TFont():New("Arial",,10,,.T.,,,,,.F.,.F.)
	Private oArial10  	:=	TFont():New("Arial",,10,,.F.,,,,,.F.,.F.)
	Private o14N	:=	TFont():New("",,14,,.T.,,,,,.F.,.F.)
	Private o10  	:=	TFont():New("",,10,,.F.,,,,,.F.,.F.)
	Private o11  	:=	TFont():New("",,11,,.F.,,,,,.F.,.F.)
	Private oPrinter  	:=	tAvPrinter():New("Contrato")

	If 	MSGYESNO("Deseja imprimir Contrato?","Atenção")
	
	oPrinter:Setup()
	oPrinter:SetPortrait()
	oPrinter:StartPage()
	printPage()
	printPage2()
	oPrinter:SetPage(1)
	oPrinter:Preview()

	Endif
	
Return

Static Function printPage()
	Local nMensal := 200.00
	//Buscar usuário incluído
	dbSelectArea("BA1")
	BA1->(dbSetOrder(1)) //BA1_FILIAL+BA1_CODINT+BA1_CODEMP+BA1_MATRIC+BA1_TIPUSU+BA1_TIPREG+BA1_DIGITO                                                                                    
	//BA1->(dbGoTop())
	
	oPrinter:SayBitMap(0153,0126,cImag001,0667,0173)

	oPrinter:SayBitMap(2055,0165,cImag002,2063,1156)

	oPrinter:Say(0182,0987,"Unidade Cruzeiro",oArial30,,0)

	oPrinter:Say(0300,0984,"Rua:Capitao Avelino Bastos 756 - Centro",oArial14,,0)

	oPrinter:Say(0364,1257,"(12) 3144-4243",oArial11,,0)

	oPrinter:Box(0415,0126,0417,2310)

	oPrinter:Say(0480,0135,"Pelo presente instrumento de contrato celebrado de um lado:",oArial11N,,0)

	oPrinter:Say(0564,0133,"Nome: " + ALLTRIM(BA1_NOMUSR),oArial14N,,0)

	oPrinter:Say(0560,1474,"Data de Nascimento: " + cValtoChar(DtoC(BA1_DATNAS)),oArial14N,,0)

	oPrinter:Say(0677,0135,"RG: " + ALLTRIM(BA1_DRGUSR),oArial14N,,0)

	oPrinter:Say(0668,1477,"CPF: " + TRANSFORM(cValtoChar(BA1_CPFUSR),"@R 999.999.999-99"),oArial14N,,0)

	oPrinter:Say(0786,0133,"Endereco: " +ALLTRIM(BA1_ENDERE)+", Nº "+ALLTRIM(BA1_NR_END),oArial14N,,0)

	oPrinter:Say(0777,1479,"Bairro: " +ALLTRIM(BA1_BAIRRO),oArial14N,,0)

	oPrinter:Say(0913,0126,"Telefones: "+ TRANSFORM(cValtoChar(BA1_TELEFO),"@R (99)99999-9999"),oArial15N,,0)

	oPrinter:Say(0902,1474,"Cidade: " +ALLTRIM(BA1_MUNICI),oArial15N,,0)

	oPrinter:Say(1026,0128,"MATRICULA: "+ TRANSFORM(ALLTRIM(BA1_CODINT+BA1_CODEMP+BA1_MATRIC+BA1_TIPREG+BA1_DIGITO),"@R 9999.9999.999999.99-9"),oArial15N,,0)

	oPrinter:Say(1148,0123,"Solicito minha adesao bem como a de meus dependentes, no Sistema Auto Programa de Saude a partir de " +cValtoChar(DtoC(BA1_DATINC)) +".",oArial10N,,0)

	//Buscar valor da Mensalidade.
	dbSelectArea("BBU")
	BBU->(dbSetOrder(1))
	
	oPrinter:Say(1231,0128,"Valor de mensalidade de R$ " + cValtoChar(BBU_VALFAI),oArial10N,,0)

	oPrinter:Say(1304,0130,"Por ser um contrato de prestacao de servicos, podera sofrer reajustes no periodo com aviso de 60 dias de antecedencia.",oArial10N,,0)

	oPrinter:Say(1400,0130,"BENEFICIOS:",oArial14N,,0)

	oPrinter:Say(1506,0140,"-Servico Odontologico 40% a menos que particulares conforme tabela APCD.",oArial10,,0)

	oPrinter:Say(1593,0144,"-Consultas médicas valor conforme tabela AMB (todos os médicos credenciados em toda nossa rede)",oArial10,,0)

	oPrinter:Say(1673,0144,"-Servicos Auxiliares de Diag. e Terapia (Laboratorios,Clinicas de Diagnosticos por Imagem) de 10 a 40% a menos que",oArial10,,0)

	oPrinter:Say(1722,0158,"Particulares conforme tabela AMB.",oArial10,,0)

	oPrinter:Say(1788,0147,"-Farmacias e Farmacias de Manipulacao de 15 a 28%",oArial10,,0)

	oPrinter:Say(1882,0186,"CONTRATO DE PRESTACAO DE SERVICOS DE INFORMACOES E AGENDAMENTO DE PROCEDIMENTOS MEDICOS-USUARIOS",oArial10N,,0)

	oPrinter:Say(1975,0165,"Condicoes gerais:",oArial11,,0)

	//Buscar CNS da Vida incluída
	dbSelectArea("BTS")
	BTS->(dbSetOrder(1))
	
	oPrinter:Say(1011,1477,"Carteira SUS: "+ cValtoChar(BTS_NRCRNA),oArial15N,,0)

	oPrinter:EndPage()
Return

Static Function printPage2()
	Private	cImag002	:=	"C:\Users\daday\Pictures\Clausulas2.png"
	oPrinter:StartPage()
	oPrinter:SetPage(2)

	oPrinter:SayBitMap(0088,0961,cImag001,0635,0156)

	oPrinter:SayBitMap(0346,0228,cImag002,2063,2416)

	oPrinter:Box(0260,0149,0262,2268)

Return

