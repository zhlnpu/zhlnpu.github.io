<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="pragma" content="no-cache">
<META NAME="Keywords" CONTENT="ip,IP��ѯ,IP��ַ��ѯ,IPλ�ò�ѯ,������,reuse,oncecode">
<meta name="robots" content="all">
<title>��������IP��Դ��ѯ��IPλ�ò�ѯ</title>
<link href="../css/xg.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../JS/ipCheck.js"></script>
</head>
<!--#include file="../Inc/config.asp"-->
<!--#include file="../Inc/ipCheck.inc"-->
<!--#include file="../Inc/RecordIP.inc"-->
<body>
<%
dbstr="../"
Call RecordIP("ipIndex.asp","IPRecord",1)		'Record IP
IPstr=request("ip")
if(IPstr="") then 
	addstr="����IP�ǣ�"
	IPstr=Request.ServerVariables("remote_addr")
else
	addstr="����ѯ��IP�ǣ�"
end if
	dim conn,rs,sql		'IP��ѯ
	set conn = server.CreateObject("ADODB.Connection")
	conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & server.MapPath(dbstr&IPDataPath)
	set rs=server.createobject("ADODB.recordset")

	sql="select top 1 * from [ip] where "&cip(IPstr)&" >=ip1 and "&cip(IPstr)&"<=ip2"
	rs.open sql,conn,1,1
	ipaddress=rs("addr")
	rs.close
	conn.close
%>
<table width="100%" height="100%" border="0" cellspacing="5" cellpadding="0" class="usualText">
<tr><td>
<table align="center" width="728" border="0" cellspacing="0" cellpadding="0" class="usualText">
<form name="form1" method="post" action="ipindex.asp">
  <tr><td>
<script type="text/javascript"><!--
google_ad_client = "pub-7076175780407848";
google_ad_width = 728;
google_ad_height = 15;
google_ad_format = "728x15_0ads_al_s";
//2006-10-26: ������, ��, ��̸, ����Ϧʰ, ������
google_ad_channel = "0116949679+3289751953+0142197962+3308672518+3695037985";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>  
  </td></tr>
  <tr>
    <td class="ipIndexText"><strong><%=addstr&IPstr%></strong></td>
  </tr>
  <tr>
    <td><font color="blue">���ԣ�</font></td>
  </tr>
  <tr bgcolor="#EEEEEE">
    <td class="ipAddressText" style="color:#6D6AFD; height:100px;" align="center"><strong><%=ipaddress%></strong></td>
  </tr>
  <tr bgcolor="#E8E8E8"><td class="usualText" height="60px" align="center"><hr size="1" class="xuxian">����IP��ַ���в�ѯ��
	<input type="text" name="ip" style="width:140px;" maxlength="15" />
	<input type="button" name="Submit" value="�ύ" onClick="checkIP()"><br/>
	ע:��վ��IP���ݿ�ÿ7�����һ��<br/><br/><br/>
  </td>
  </tr>
  <tr>
    <td class="usualText" align="center"><!--img ad--><script type="text/javascript"><!--
google_ad_client = "pub-7076175780407848";
google_ad_width = 728;
google_ad_height = 90;
google_ad_format = "728x90_as";
google_ad_type = "image";
//2006-10-27: ajax, asp, ebook, ��������, ��վ����
google_ad_channel = "2945071128+3193757684+8184353469+5731251774+2148644176";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script><!--img ad-->
<script type="text/javascript"><!--
google_ad_client = "pub-7076175780407848";
google_ad_width = 728;
google_ad_height = 90;
google_ad_format = "728x90_as";
google_ad_type = "text_image";
//2006-10-26: ajax, ASPԴ��, Ajax���, PHPԴ��, �򵥸�����վ
google_ad_channel = "2945071128+1854099870+2631571550+6665708653+5437075187";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
<br/><br/><br/>
	</td>
  </tr>
  <tr><td>������ֲ��ֲ�ѯ�������ȷ����<a href="http://www.oncecode.com" target="_blank">��ϵ����</a>���и��£�</td></tr>
</form>
</table>
</td></tr>
</table>
<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-1694921-1";
urchinTracker();
</script>
</body>
</html>
<script language="javascript">
<!--
function checkIP(){
	if(ipOk(document.getElementById("ip"))){	
		form1.submit();
	}
}
-->
</script>