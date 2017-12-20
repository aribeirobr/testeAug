#Include "Protheus.Ch"
#Include "rwmake.Ch"
#Include "TopConn.Ch"     
#Include "tbiconn.Ch"



/*ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
ฑฑษออออออออออัออออออออออหอออออออัออออออออออออออออออออหออออออัอออออออออออออปฑฑ
ฑฑบPrograma  ณ tstobjxml บAutor ณAugusto Ribeiro     บ Data ณ 15/05/2013  บฑฑ
ฑฑฬออออออออออุออออออออออสอออออออฯออออออออออออออออออออสออออออฯอออออออออออออนฑฑ
ฑฑบDesc.     ณ                                                            บฑฑ
ฑฑบ          ณ                                                            บฑฑ
ฑฑศออออออออออฯออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผฑฑ
ฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑฑ
฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿฿*/
User Function tstobjxml(cEntidade)
Local oXML, oXML2, NI
Local cXML := ""
Local cAviso	:= ""
Local cErro	:=  ""
Local aEndereco	:= {}

	//| Altera็ใo Upload

	//cXML	:= "<cliente><codigo>000010</codigo><nome>AUGUSTO RIBEIRO</nome>  <endereco>    <rua>Av. Paulista</rua>    <Numero>2006</Numero>     </endereco>  <endereco>    <rua>Av. 23 de maio</rua>    <Numero>124</Numero>  </endereco></cliente>"
	//cXML	:= "<cliente><codigo>000010</codigo><nome>AUGUSTO</nome><sobrenome><![CDATA[RIBEIRO <NATURALIDADE>TESTE</NATURALIDADE>]]></sobrenome>  <endereco>    <rua>Av. Paulista</rua>    <Numero>2006</Numero>     </endereco>  <endereco>    <rua>Av. 23 de maio</rua>    <Numero>124</Numero>  </endereco></cliente>"

	cXML	:= '<cliente><codigo>000010</codigo><nome TAMANHO="7">AUGUSTO</nome><sobrenome><![CDATA[RIBEIRO <NATURALIDADE>TESTE</NATURALIDADE>]]></sobrenome>  <endereco>    <rua>Av. Paulista</rua>    <Numero>2006</Numero>     </endereco>  <endereco>    <rua>Av. 23 de maio</rua>    <Numero>124</Numero>  </endereco></cliente>'
	
  
	oXML := XmlParser(EncodeUTF8(cXML),"_",@cErro, @cAviso) //| ### CORRETO  
	//| oXML := XmlParser(EncodeUTF8(cXML),"_",@cAviso,@cErro) //| ### ERRADO
	

	IF VALTYPE(XmlChildEx(oXML, "_ENDERECO")) == "O" 	
		
		IF VALTYPE(oXML:_CLIENTE:_ENDERECO) == "O"
			AADD(aEndereco, oXML:_CLIENTE:_ENDERECO)
		ELSEIF VALTYPE(oXML:_CLIENTE:_ENDERECO) == "A"
			aEndereco	:= ACLONE(oXML:_CLIENTE:_ENDERECO)
		ENDIF
		
	ENDIF
	
	
	FOR NI := 1 TO LEN(aEndereco)
		CONOUT("### tstobjxml "+aEndereco[NI]:_RUA:TEXT )
	NEXT NI 
	
	
	oXML	:= oXML
	

Return()

