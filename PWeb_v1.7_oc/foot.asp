<!--#include file="Inc/ClassConfig.inc"-->
<%function getFoot()%>
<table align="center" width="100%" height="25" border="0" cellspacing="0" cellpadding="0" class="footMenu">
	<tr align="center"><td>		
<%
For i=0 To UBound(classname)-1
	If(i<(UBound(classname)-1)) Then
		response.write("<a href=default.asp?id="&i&">"&classname(i)&"</a>&nbsp;&nbsp;|&nbsp;&nbsp;")
	Else
		response.write("<a href=default.asp?id="&i&">"&classname(i)&"</a>")
	End If
Next
If(session("master")="") Then
	response.write("&nbsp;&nbsp;|&nbsp;&nbsp;<a href='admin/index.asp'>��½/ע��</a>")
Else
	response.write("&nbsp;&nbsp;|&nbsp;&nbsp;<a href='admin/register.asp' target='_blank'>ע��</a>")
End If
%>	
	</td></tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="midBlue" bgcolor="#FFFFFF">
      <tr>
        <td align="center"><a href="http://www.oncecode.com" target="_blank"><%=PwebVersion%></a> for <a href="http://<%=LocalHostUrl%>" style="color:blue; font-size:14px;"><%=LocalHostUrl%></a> by shemily</td>
      </tr>
      <tr><td>
	<table align="center" class="midBlue"><tr><td>Email: <%=Sys_Email%> 
| <a href="javascript:void(0);" onclick="openWithSubwindow('admin/showOnlineUsers.asp',400,300,215,300)">��ǰ <font color=red><%=Application("ActiveUserCounter")%></font> ������</a>
| <a href="admin/ipindex.asp" target="_blank">IP��Դ</a>
	</td></tr></table>
      </tr></td>
</table>
<%end function%>