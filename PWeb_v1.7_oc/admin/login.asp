<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��½</title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
<%
action=request("action")
page=request("page")
If(action="") Then action="check"
%>
<script language="javascript">
<!--
var gowhere="<%=action%>";
-->
</script>
<script type="text/javascript" src="../JS/admin_login.js"></script>
<script type="text/javascript" src="../JS/MD5.js"></script>
</head>

<body onload='changeValue()'>
<%
if(action="add" or action="alter") then
	dim usertype,userid
	if(action="alter") then
		dbstr="../"
		userid=request("linkid")
		dim conn,rs,sql
		set conn=getconn()
		set rs=getrs()
		sql="select * from users where [id]="&userid
		rs.open sql,conn,1,1
		if not rs.bof and not rs.eof then
			username=rs("username")
			usertype=rs("usertype")
			if(usertype<session("masterqx")) then	'safe check
				response.write("�Բ�����û���޸Ĵ��ʺŵ�Ȩ�����������Ա��ϵ��")
				response.end
			end if
			ifalive=rs("alive")
		end if
		rs.close
		closeconn(conn)
	end if

	dim selectitems(3)
	selectitems(0)="��������Ա"
	selectitems(1)="�߼�����Ա"
	selectitems(2)="��ͨ�ʺ�"
	outstr="Ȩ&nbsp;&nbsp;��:<select name=""usertype"">"&Chr(13)
	for i=0 to 2
		if(usertype=i) then
			outstr=outstr&"<option value="""&i&""" selected=""selected"">"&selectitems(i)&"</option>"&Chr(13)
		else
			outstr=outstr&"<option value="""&i&""">"&selectitems(i)&"</option>"&Chr(13)
		end if
	next
	outstr=outstr&"</select>"
	outstr1="����:<input type='checkbox' value='alive' name='ifalive'"
	if(ifalive=0) then outstr1=outstr1&" checked='checked'"
	outstr1=outstr1&">"
else
	outstr="&nbsp;"
	outstr1="&nbsp;"
end if
%>
<table align="center" border="0" cellspacing="5" cellpadding="0" class="usualText">
<form id="loginForm" method="post" action="">
  <tr>
    <td colspan="2">�û���:<input type="text" id="username" name="username" style="width:132px" value="<%=username%>">
    <input type="hidden" name="page" value="<%=page%>">
    </td>
  </tr>
  <tr>
    <td colspan="2">��&nbsp;&nbsp;��:<input type="password" id="userpass" name="userpass" style="width:132px"><input type="checkbox" value="true" id="ifalterpass" name="ifalterpass" onclick="alterPass()"></td>
  </tr>
  <tr>
    <td><%=outstr%><input type="hidden" name="linkid" id="linkid" value="<%=userid%>"></td><td><%=outstr1%></td>
  </tr>
  <tr>
    <td align="center" colspan="2"><input type="button" name="cancel" value="ȡ��" onClick="javascript:window.opener=null;window.close();">
      <input type="button" name="reg" value="ע��" onClick="regUser()">&nbsp;&nbsp;
      <input type="button" name="ok" value="��½" onClick="loginIt()">
    </td>
    </tr>
</form>
</table>
</body>
</html>
<script language="javascript" for="document" event="onkeydown"> 
<!-- 
if(event.keyCode==13){ 
	loginIt();
}
-->
</script>