<%
if(session("master")="") then
%>
<script language="javascript">
<!--
window.open('login.asp?action=check','login','width=220,height=130,top=250,left=380,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no,fullscreen=2');
-->
</script>
<%
elseif(session("masterqx")>1) then
	response.redirect("showArticle.asp")
else
	response.redirect("showIPRecord.asp")
end if
%>