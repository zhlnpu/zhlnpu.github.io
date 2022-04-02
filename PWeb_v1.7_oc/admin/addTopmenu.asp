<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加栏目</title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../JS/admin_addTopmenu.js"></script>
</head>

<body>
<table align="center" border="0" cellspacing="5" cellpadding="0" class="usualText">
<form name="addclassForm" method="post" action="saveTopmenu.asp">
  <tr>
    <td valign="middle">菜单名:
      <input type="text" name="menu_cn"></td>
  </tr>
  <tr>
    <td valign="middle">英文名:
      <input type="text" name="menu_en"></td>
  </tr>
  <tr>
    <td valign="middle">排&nbsp;&nbsp;序:
      <input type="text" name="index" maxlength="5"></td>
  </tr>
  <tr>
    <td align="center" valign="middle"><input type="button" name="cancle" value="取消" onClick="javascript:window.opener=null;window.close();">
      &nbsp;&nbsp;
      <input type="button" name="saveit" value="保存" onClick="saveMenu()"></td>
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