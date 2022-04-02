<link href="CSS/qqOnline.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/qqOnline.js"></script>
<script type="text/javascript" src="js/openWithSubWindow.js"></script>
<script type="text/javascript" src="js/hideQQ.js"></script>
<script type="text/javascript" src="JS/ocChat_moveable_sub.js"></script>
<!-- QQ在线开始 -->
<DIV id="qqOnline" style="display:block; position: absolute; z-index: 1; left: 2px; top: 150px; width: 118px; height: 225px;"> 
<table width="110" border="0" cellspacing="0" cellpadding="0" 
background="images/qqOnline/ocChat_client_bgHead.gif" class="qqOnlineTable" 
onMouseDown="javascript:ocChat_Onclick(document.getElementById('qqOnline'),event);setCapture();" 
onMouseMove="javascript:ocChat_moveTable(document.getElementById('qqOnline'),event);" 
onMouseUp="javascript:ocChat_MouseUp(this);releaseCapture();">
  <tr>
    <td height="25" class="qqOnlineTitle">&nbsp;</td>
  </tr>
</table>
  <TABLE width=118 style="BORDER-COLLAPSE: collapse; background-image:url(images/qqOnline/ocChat_client_bgBody.gif); background-repeat:repeat-y;" 
   class="qqOnlineTable" cellSpacing="0" cellPadding="0" border="0">
    <TR>
		<td colspan="2"><img src="Images/1x1_pix.gif" width="110" height="4"></td>
	</TR>
    <TR>
      <TD width="108" height="30" align="center"><a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=17470538&Site=test.oncecode.com&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=1:17470538:8 alt="点击这里给我发消息"></a></TD>
      <TD width="8" align="center"><img id="qqOnline_closeImg" src="images/qqOnline/close.gif" width="8" height="33" border="0" 
	  onClick="hide_QQMenu('qqOnline','qqOnline_closeImg')" style="cursor:pointer;"><div id="qqOnline_alert" style="position:absolute; left:112px; top:70px; display:none; 
	  background-color:#E3E3E3; font-size:12px; color:#8686FF;">
点击客服名字进行交谈
</div></TD>
    </TR>
    <TR> 
      <TD height="30" align="center">
	  <a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=17470538&Site=test.oncecode&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=1:17470538:8 alt="点击这里给我发消息"></a>
	  </TD>
    </TR>
    <TR> 
      <TD height="30" align="center">
	  <a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=17470538&Site=test.oncecode&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=1:17470538:8 alt="点击这里给我发消息"></a> 
	  </TD>
    </TR>	  
  </TABLE>
<table width="110" border="0" cellspacing="0" cellpadding="0" background="images/qqOnline/ocChat_client_bgBot.gif">
  <tr>
    <td height="2"><img src="Images/1x1_pix.gif" width="110" height="2"></td>
  </tr>
</table>
</DIV>
<!-- QQ在线结束 -->
<script language="javascript">
<!--
if(NS || IE || fir){
	window.setInterval("floatIt('qqOnline')",1);
}
//-->
</script>