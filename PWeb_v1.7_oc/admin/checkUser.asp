<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!-- #include file="../Inc/config.asp" -->
<!-- #include file="../Inc/vbDecode.inc" -->
<%
	dbstr="../"
	username=vbDecode(Trim(request("username")))
	if(len(username)>20) then response.end
	userpass=Trim(request("userpass"))
	dim conn,rs,sql
	set conn=getconn()
	set rs=getrs()
	
	sql="select * from users where username='"&username&"'"
	rs.open sql,conn,3,3
	if rs.bof and rs.eof then 
		errormsg=errlogin_nouser
	else
		if userpass<>rs("userpass") then 
			errormsg=errlogin_wrongpass
		else 
			Session("master")=username			'记录用户名
			Session("masterqx")=rs("usertype")		'记录用户权限
			Session("masterlive")=rs("alive")		'记录用户状态
			Session("masterid")=rs("id")			'记录用户ID
			rs("ifonline")=1
			rs.update
			redirectstr="index.asp"
%>
<script language="javascript">
<!--
	if(window.opener==null){
		location.href="<%=redirectstr%>";
	}	
	window.opener.location.href="<%=redirectstr%>";
	window.opener=null;
	window.close();	
-->		
</script>	
<%				
		end if
	end if
	
	if errormsg<>"" then 
%>
<script language="javascript">
<!--
	alert("<%=errormsg%>");
	window.history.back(0);
-->		
</script>	
<%					
	end if
	
	rs.close
	closeconn(conn)	
%>