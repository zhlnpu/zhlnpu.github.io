<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����Ŀ</title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../JS/admin_addTopmenu.js"></script>
</head>

<body>
<table align="center" border="0" cellspacing="5" cellpadding="0" class="usualText">
<form name="addclassForm" method="post" action="saveTopmenu.asp">
  <tr>
    <td valign="middle">�˵���:
      <input type="text" name="menu_cn"></td>
  </tr>
  <tr>
    <td valign="middle">Ӣ����:
      <input type="text" name="menu_en"></td>
  </tr>
  <tr>
    <td valign="middle">��&nbsp;&nbsp;��:
      <input type="text" name="index" maxlength="5"></td>
  </tr>
  <tr>
    <td align="center" valign="middle"><input type="button" name="cancle" value="ȡ��" onClick="javascript:window.opener=null;window.close();">
      &nbsp;&nbsp;
      <input type="button" name="saveit" value="����" onClick="saveMenu()"></td>
  </tr>
</form>
</table>
</body>
</html>
<script language="javascript" for="document" event="onkeydown"> 
<!-- 
if(event.keyCode==13){ 
	saveMenu();
}
-->
</script>