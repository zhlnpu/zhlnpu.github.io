<%@LANGUAGE="VBSCRIPT.Encode" CODEPAGE="936"%>
<!-- #include file="../Inc/config.asp" -->
<!-- #include file="../Inc/ch2utf8.asp" -->
<%
	dbstr="../"
	username=Trim(request("username"))
	dim conn,rs,sql
	set conn=getconn()
	set rs=getrs()
	
	sql="select * from users where username='"&username&"'"
	rs.open sql,conn,1,1
	if rs.bof and rs.eof then 
		errormsg="���û������ã�"
		Call chinese2unicode(errormsg)
	else
		errormsg="�Բ��𣬴��û����ѱ�ע�ᣡ"
		Call chinese2unicode(errormsg)
	end if
	
	if errormsg<>"" then response.write("<p class='midBlue'>"&errormsg&"</p>")
	
	rs.close
	closeconn(conn)	
%>