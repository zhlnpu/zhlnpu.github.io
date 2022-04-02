<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!--#include file="../Inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>用户注册 --<%=Index_Title%></title>
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
            <td width="634" colspan="2" align="center">用户协议</td>
          </tr>
          <tr>
            <td colspan="2" class="subMenu">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" class="subMenu">欢迎您加入参加本网站的交流和讨论，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：</br></br>
一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：</br>
&nbsp;&nbsp;&nbsp;&nbsp;（一）煽动抗拒、破坏宪法和法律、行政法规实施的；</br>
&nbsp;&nbsp;&nbsp;&nbsp;（二）煽动颠覆国家政权，推翻社会主义制度的；</br>
&nbsp;&nbsp;&nbsp;&nbsp;（三）煽动分裂国家、破坏国家统一的；</br>
&nbsp;&nbsp;&nbsp;&nbsp;（四）煽动民族仇恨、民族歧视，破坏民族团结的；</br>
&nbsp;&nbsp;&nbsp;&nbsp;（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；</br>
&nbsp;&nbsp;&nbsp;&nbsp;（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；</br>
&nbsp;&nbsp;&nbsp;&nbsp;（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；</br>
&nbsp;&nbsp;&nbsp;&nbsp;（八）损害国家机关信誉的；</br>
&nbsp;&nbsp;&nbsp;&nbsp;（九）其他违反宪法和法律行政法规的；</br>
&nbsp;&nbsp;&nbsp;&nbsp;（十）进行商业广告行为的。</br>

二、互相尊重，对自己的言论和行为负责。</br></br>

注：<br/><font color=red>
&nbsp;&nbsp;&nbsp;&nbsp;本站会员注册后，需管理员激活才能发表文章，否则只能留言。</br>
&nbsp;&nbsp;&nbsp;&nbsp;管理员会在一个工作日内激活您的帐号，请您注册成功后到“关于我们”栏目的“关于本站”中</br>
&nbsp;&nbsp;&nbsp;&nbsp;《会员签到》文章留言，以便我们及时地激活您的帐号！谢谢支持！</font>
</td>
          </tr>
          <tr>
            <td colspan="2" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2"><table width="57%"  border="0" align="center" cellpadding="0" cellspacing="0" class="usualText">
                <tr>
                  <td width="24%">同意</td>
                  <td width="10%"><input type="checkbox" id="agreeit" onClick="ifAgree()" checked="checked"></td>
                  <td width="66%" id="showResult">&nbsp;</td>
                </tr>
                <tr>
                  <td>用户名</td>
                  <td colspan="2"><input type="text" id="username" name="username" style="width:150px">
                  &nbsp;<a href="javascript:void(0)" onClick='javascript:checkUserName("username");'>检查</a></td>
                </tr>
                <tr>
                  <td>密码</td>
                  <td colspan="2"><input type="password" id="pass1" name="pass1" style="width:150px"></td>
                </tr>
                <tr>
                  <td>确认密码</td>
                  <td colspan="2"><input type="password" id="pass2" name="pass2" style="width:150px"><input type="hidden" id="userpass" name="userpass"></td>
                </tr>
                <tr>
                  <td>邮箱地址</td>
                  <td colspan="2"><input type="text" id="email" name="email" style="width:150px"></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2" align="center">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" align="center"><input type="button" id="cancel" value="取消" onClick="javascript:location.href='../default.asp'">
&nbsp;&nbsp;<input type="button" id="Submit" value="注册" onClick="checkForm()"></td>
          </tr>
        </form>
      </table></td>
    </tr>
  </table>
</body>
</html>