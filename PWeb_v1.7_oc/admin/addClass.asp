<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>��ӷ���</title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../JS/xmlHttpRequest.js"></script>
<script type="text/javascript" src="../JS/admin_addClass.js"></script>
</head>
<!--#include file="../Inc/config.asp"-->
<%dbstr="../"%>
<!--#include file="../Inc/ClassConfig.inc"-->
<body>
<table align="center" border="0" cellspacing="5" cellpadding="0" class="usualText">
<form name="addclassForm" method="post" action="saveClass.asp">
  <tr>
    <td valign="middle">��&nbsp;&nbsp;Ŀ:<select name="upmenu"><%for i=0 to UBound(classname)-1
		response.Write("<option value="&classcode(i)&">"&classname(i)&"</option>")
	next%>
        </select>
    </td>
	<td id="showCheckResult">&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" colspan="2">�˵���:<input type="text" name="menu_cn" style="width:150px"></td>
  </tr>
  <tr>
    <td valign="middle">Ӣ����:<input type="text" name="menu_en" style="width:90px"></td>
	<td><a href="javascript:void(0);" onclick="checkMenuName(document.getElementById('menu_en').value)">����ظ�</a></td>
  </tr>
  <tr>
    <td valign="middle" colspan="2">��&nbsp;&nbsp;��:<input type="text" name="index" style="width:150px"></td>
  </tr>
  <tr>
    <td align="center" valign="middle" colspan="2"><input type="button" name="cancle" value="ȡ��" onClick="javascript:window.opener=null;window.close();">
      &nbsp;&nbsp;
      <input type="button" name="saveit" value="����" onClick="saveClass()"></td>
  </tr>
</form>
</table>
</body>
</html>
<script language="javascript" for="document" event="onkeydown"> 
<!-- 
if(event.keyCode==13){ 
	saveClass();
}
-->
</script>