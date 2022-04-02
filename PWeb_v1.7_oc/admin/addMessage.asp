<%Function addMessage(articID)%>
<hr width="98%" size="1" class='xuxian'></hr>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" class="usualText">
<form name="addMessageForm" method="post">  
  <tr>
    <td align="left" colspan="2">&nbsp;&#x53D1;&#x8868;&#x7559;&#x8A00;:</td>
  </tr>
  <tr>
<%if(IfNeedAdbyMsg=1) then %>
	<td width="130" align="center" valign="top">
	<iframe src="<%=replace(ADbyMsg_frame,"../","")%>" frameborder=0 width=125 height=110 scrolling="no" allowtransparency="true"></iframe>
	</td>
<%else%>
	<td>&nbsp;</td>
<%end if%>
    <td align="center"><table width="10"  border="1" cellspacing="0" cellpadding="0" bordercolorlight="#FFCAFF" bordercolordark="#EFEEFF">
      <tr>
        <td><textarea name="msgcontent" id="msgcontent" style="width:350px; height:100px; border-color:#C8BFFB; border:0px; background-color:#EFEEFF;"></textarea></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
	<td>&nbsp;</td>
    <td align="center"><input type="reset" name="resetit" value="&#x91CD;&#x7F6E;" style="height:22px;width:48px;">
      <input type="button" name="saveit" value="&#x53D1;&#x8868;" style="height:22px;width:48px;" onclick="javascript:saveMessage(addMessageForm.articID.value);">
      <input type="hidden" name="articID" value="<%=articID%>">
    </td>
  </tr>
</form>
</table>
<%End Function%>