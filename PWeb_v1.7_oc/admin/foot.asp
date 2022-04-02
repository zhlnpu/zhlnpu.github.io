<%function getFoot()%>
<!--#include file="../Inc/openWithSubWindow.js"-->
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="midBlue">
      <tr>
        <td align="center"><a href="http://www.oncecode.com" target="_blank"><%=PwebVersion%></a> for <a href="http://<%=LocalHostUrl%>" style="color:blue; font-size:14px;"><%=LocalHostUrl%></a> by shemily</td>
      </tr>
      <tr>
        <table align="center" class="midBlue"><tr><td>Email: <%=Sys_Email%> 
| <a href="javascript:void(0);" onclick="openWithSubwindow('showOnlineUsers.asp',400,300,215,300)">当前 <font color=red><%=Application("ActiveUserCounter")%></font> 人在线</a>
| <a href="ipindex.asp" target="_blank">IP来源</a>
	</td></tr></table>
      </tr>
</table>
<%end function%>