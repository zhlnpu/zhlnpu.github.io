<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�������� --<%=Index_Title%></title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../JS/xmlHttpRequest.js"></script>
<script type="text/javascript" src="../JS/mailCheck.js"></script>
<script type="text/javascript" src="../JS/admin_resetPass.js"></script>
</head>
<%if(IfAllowReg="0") then response.redirect("../")%>
<body>
  <table width="600"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#CFCFCF">
    <tr>
      <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="usualText">
        <form id="form1" method="post" action="">
          <tr>
            <td colspan="2" align="center">��������</td>
          </tr>
          <tr>
            <td colspan="2">��ܰ��ʾ��</td>
          </tr>
          <tr>
            <td colspan="2">�����������û�����ע�������ַ��</td>
          </tr>
          <tr>
            <td colspan="2">�����뽫���͵��������䣬��ע����գ�</td>
          </tr>
          <tr>
            <td colspan="2" id="showResult">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><table width="57%"  border="0" align="center" cellpadding="0" cellspacing="0" class="usualText">
                <tr>
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr>
                  <td width="24%">�û���</td>
                  <td colspan="2"><input type="text" name="username" style="width:150px"></td>
                </tr>
                <tr>
                  <td>�����ַ</td>
                  <td colspan="2"><input type="text" name="email" style="width:150px"></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" align="center"><input type="button" name="cancel" value="ȡ��" onClick="javascript:location.href='../default.asp'">
&nbsp;&nbsp;<input type="button" name="Submit" value="ȷ��" onClick="checkForm()"></td>
          </tr>
        </form>
      </table></td>
    </tr>
  </table>
</body>
</html>