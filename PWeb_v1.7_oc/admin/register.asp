<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�û�ע�� --<%=Index_Title%></title>
<link href="../CSS/xg.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../JS/xmlHttpRequest.js"></script>
<script type="text/javascript" src="../JS/admin_register.js"></script>
<script type="text/javascript" src="../JS/mailCheck.js"></script>
<script type="text/javascript" src="../JS/MD5.js"></script>
</head>
<%if(IfAllowReg="0") then response.redirect("../")%>
<body onLoad="ifAgree()">
  <table width="600"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#FFFFFF" bordercolordark="#CFCFCF">
    <tr>
      <td><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="usualText">
        <form name="form1" method="post" action="">
          <tr>
            <td width="634" colspan="2" align="center">�û�Э��</td>
          </tr>
          <tr>
            <td colspan="2" class="subMenu">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="subMenu">��ӭ������μӱ���վ�Ľ��������ۣ�Ϊά�����Ϲ������������ȶ��������Ծ������������</br></br>
һ���������ñ�վΣ�����Ұ�ȫ��й¶�������ܣ������ַ�������Ἧ��ĺ͹���ĺϷ�Ȩ�棬�������ñ�վ���������ƺʹ���������Ϣ��</br>
&nbsp;&nbsp;&nbsp;&nbsp;��һ��ɿ�����ܡ��ƻ��ܷ��ͷ��ɡ���������ʵʩ�ģ�</br>
&nbsp;&nbsp;&nbsp;&nbsp;������ɿ���߸�������Ȩ���Ʒ���������ƶȵģ�</br>
&nbsp;&nbsp;&nbsp;&nbsp;������ɿ�����ѹ��ҡ��ƻ�����ͳһ�ģ�</br>
&nbsp;&nbsp;&nbsp;&nbsp;���ģ�ɿ�������ޡ��������ӣ��ƻ������Ž�ģ�</br>
&nbsp;&nbsp;&nbsp;&nbsp;���壩�������������ʵ��ɢ��ҥ�ԣ������������ģ�</br>
&nbsp;&nbsp;&nbsp;&nbsp;����������⽨���š����ࡢɫ�顢�Ĳ�����������ɱ���ֲ�����������ģ�</br>
&nbsp;&nbsp;&nbsp;&nbsp;���ߣ���Ȼ�������˻���������ʵ�̰����˵ģ����߽����������⹥���ģ�</br>
&nbsp;&nbsp;&nbsp;&nbsp;���ˣ��𺦹��һ��������ģ�</br>
&nbsp;&nbsp;&nbsp;&nbsp;���ţ�����Υ���ܷ��ͷ�����������ģ�</br>
&nbsp;&nbsp;&nbsp;&nbsp;��ʮ��������ҵ�����Ϊ�ġ�</br>

�����������أ����Լ������ۺ���Ϊ����</br></br>

ע��<br/><font color=red>
&nbsp;&nbsp;&nbsp;&nbsp;��վ��Աע��������Ա������ܷ������£�����ֻ�����ԡ�</br>
&nbsp;&nbsp;&nbsp;&nbsp;����Ա����һ���������ڼ��������ʺţ�����ע��ɹ��󵽡��������ǡ���Ŀ�ġ����ڱ�վ����</br>
&nbsp;&nbsp;&nbsp;&nbsp;����Աǩ�����������ԣ��Ա����Ǽ�ʱ�ؼ��������ʺţ�лл֧�֣�</font>
</td>
          </tr>
          <tr>
            <td colspan="2" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><table width="57%"  border="0" align="center" cellpadding="0" cellspacing="0" class="usualText">
                <tr>
                  <td width="24%">ͬ��</td>
                  <td width="10%"><input type="checkbox" id="agreeit" onClick="ifAgree()" checked="checked"></td>
                  <td width="66%" id="showResult">&nbsp;</td>
                </tr>
                <tr>
                  <td>�û���</td>
                  <td colspan="2"><input type="text" id="username" name="username" style="width:150px">
                  &nbsp;<a href="javascript:void(0)" onClick='javascript:checkUserName("username");'>���</a></td>
                </tr>
                <tr>
                  <td>����</td>
                  <td colspan="2"><input type="password" id="pass1" name="pass1" style="width:150px"></td>
                </tr>
                <tr>
                  <td>ȷ������</td>
                  <td colspan="2"><input type="password" id="pass2" name="pass2" style="width:150px"><input type="hidden" id="userpass" name="userpass"></td>
                </tr>
                <tr>
                  <td>�����ַ</td>
                  <td colspan="2"><input type="text" id="email" name="email" style="width:150px"></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" align="center"><input type="button" id="cancel" value="ȡ��" onClick="javascript:location.href='../default.asp'">
&nbsp;&nbsp;<input type="button" id="Submit" value="ע��" onClick="checkForm()"></td>
          </tr>
        </form>
      </table></td>
    </tr>
  </table>
</body>
</html>