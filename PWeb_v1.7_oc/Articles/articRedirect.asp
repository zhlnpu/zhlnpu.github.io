<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
</head>
<!--#include file="../Inc/config.asp"-->
<body>
<%
fileName="../"&request("linkid")
page=request("page")
%>
<script language="javascript">
<!--
var d=new Date();
window.open("<%=fileName%>","newpage"+d.getSeconds());
history.back(0);
//-->
</script>
</body>
</html>