<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=Index_Title%></title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css" />
</head>
<!--#include file="../Inc/Turn.inc"-->
<!--#include file="foot.asp"-->
<!--#include file="topMenu.asp"-->
<body onload="showUser.style.backgroundColor='#AED7FF'">
<!--#include file="top.asp"-->
<table align="center" width="800" height="80%" border="0" cellspacing="0" cellpadding="0">
  <tr><td valign="top"><%
  userName=trim(request("userName"))

  dim sql,thepage,shownum,page,pagenum,alterpage,delpage  
  sql="select [id],username as �û���,email as �����ַ,usertype as �û�Ȩ��,"
  sql=sql&"alive as ״̬,regDate as ע������ from users"
  if(userName<>"") then 
	sql=sql&" where InStr(username,'"&userName&"')>0 "
  	if(session("masterqx")>0) then sql=sql&" and usertype>="&session("masterqx")&" and username<>'administrator'"
  else
 	if(session("masterqx")>0) then sql=sql&" where username<>'administrator' and usertype>="&session("masterqx")&""
  end if
  sql=sql&" order by usertype"
  thepage="showUsers.asp"
  shownum=16
  alterpage="login.asp"
  delpage="saveAlterUser.asp"
  dbstr="../"

  call ShowTable(sql,thepage,shownum,page,pagenum,"2-228-130-212-400",alterpage,delpage,"�޸�",0)  
  %></td></tr>
<form name="searchUser" method="post" action="showUsers.asp">
	<tr bgcolor="#EDC4FB" height="22px"><td align="center" class="classTxt">�������û���������
		<input type="text" name="userName" style="width:200px;height:22px;" />
		<input type="button" value="��ѯ" onclick="checkForm()" style="height:20px;" />
	</td></tr>
</form>
  <tr>
    <td><%Call getFoot()%></td>
  </tr>
</table>
</body>
</html>
<script language="javascript">
<!--
function checkForm(){
	with(searchUser){
		if(userName.value==""){
			alert("�������û���������");
			userName.focus();
			return false;
		}
		submit();
	}
}
//-->
</script>