#Include "TOTVS.CH"
User Function TstWordExcel()

  DEFINE DIALOG oDlg TITLE "Como abrir documentos do Microsoft Word e Microsoft Excel" FROM 180,180 TO 550,700 PIXEL
	                                         
    // Abrindo um documento do Microsoft Word
    oTOleContainer := TOleContainer():New( 01,01,260,092,oDlg,.T.,;
                                     'C:\TOTVS\Atividades mensais Ana.docx' )

    // Abrindo uma planilha do Microsoft Excel
    oTOleContainer := TOleContainer():New(094,001,260,092,oDlg,.T.,;
                                     'C:\TOTVS\QUALIFIC.xlsx' )
                                     
  ACTIVATE DIALOG oDlg CENTERED 

Return