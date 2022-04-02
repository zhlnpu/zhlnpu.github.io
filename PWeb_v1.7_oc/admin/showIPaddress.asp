<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>IP来源</title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
</head>
<!--#include file="../Inc/config.asp"-->
<!--#include file="../Inc/ipCheck.inc"-->
<script type="text/javascript" src="../Inc/xmlHttpRequest.js"></script>
<body>
<%
IPstr=request("linkid")
dim conn,rs,sql
dbstr="../"
set conn = server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & server.MapPath(dbstr&IPDataPath)
set rs=server.createobject("ADODB.recordset")

sql="select top 1 * from [ip] where "&cip(IPstr)&" >=ip1 and "&cip(IPstr)&"<=ip2"
rs.open sql,conn,1,1
ipaddress=rs("addr")
rs.close
conn.close
%>
<table width="100%" height="100%" border="0" cellspacing="3" cellpadding="0" class="usualText">
<form name="form1" method="get">
  <tr>
    <td>IP：<%=IPstr%></td>
  </tr>
  <tr>
    <td>来自：</td>
  </tr>
  <tr bgcolor="#E8E8E8">
    <td height="80%" valign="top"><table width="96%" border="0" cellspacing="5" cellpadding="0">
	<tr><td class="subMenu" id="orAddr" style="color:#6D6AFD;"><%=ipaddress%></td></tr>
	<tr><td class="subMenu">实际位置：<br/><textarea name="ipfrom" style="width:230px;height:60px;" onfocus="this.value=''"></textarea></td></tr>
      </table>
    </td>
  </tr>
  <tr>
    <td align="center">
      <input type="button" name="cancle" value="取消" onClick="javascript:window.opener=null;window.close();">
      <input type="button" name="updateip" value="更新" onClick="updateit()">
    </td>
  </tr>
</form>
</table>
</body>
</html>
<script language="javascript">
<!--
var ipaddr;
function updateIpFrom(ipstr,ipfrom) {
  	var url = "updateIpFrom.asp?ipstr=" + escape(ipstr) + "&ipfrom=" + escape(ipfrom);
  	xmlHttp.open("GET", url, true);
	document.getElementById("updateip").disabled=true;
  	xmlHttp.onreadystatechange = updateOk;
  	xmlHttp.send(null);
}

function updateOk() {
  	if (xmlHttp.readyState == 4) {
    		var response = xmlHttp.responseText;
		if(response=="updateOK"){
			document.getElementById("updateip").disabled=false;
			document.getElementById("orAddr").innerText=ipaddr;
			document.getElementById("cancle").value="关闭";
			document.getElementById("ipfrom").value="IP来源更新成功！";
		}
		else{
			document.getElementById("updateip").disabled=false;
			document.getElementById("ipfrom").value="IP来源更新失败！";
		}
  	}
}

function updateit(){
	var ip="<%=IPstr%>";
	var ipf=document.getElementById("ipfrom").value;
	ipaddr=ipf;
	if(ipf==""){
		return false;
	}
	updateIpFrom(ip,ipf);
}
//-->
</script>