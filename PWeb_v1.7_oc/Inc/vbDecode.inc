<%
function vbDecode(str)  		'string decode
	str=replace(str,"!","")
	str=replace(str,"<","")
	str=replace(str,">","")
	str=replace(str,"&","")
	str=replace(str,"\","")
	str=replace(str,"/","")
	str=replace(str,"(","")
	str=replace(str,")","")
	str=replace(str,"+","")
	str=replace(str,"-","")
	str=replace(str,"*","")
	str=replace(str," ","")
	str=replace(str,"'","&acute;")
	str=replace(str,"[","")
	str=replace(str,"]","")
	str=replace(str,"=","")
	vbDecode=str
end function

Function execRE(re, rp, content)
	set oReg = New RegExp
	oReg.Pattern = re
	oReg.Global=True
	Set Matches = oReg.Execute(content)
  	For Each Match in Matches      'replace them
		content=replace(content,Match.value,rp)
  	Next

	execRE = content
End Function
%>