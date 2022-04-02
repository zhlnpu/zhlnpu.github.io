<%
function getMenu()
dim rstop,rshigher,rssub,conn,sql,n
n=0
set conn=getconn()
set rstop=getrs()
set rshigher=getrs()
set rssub=getrs()

on error resume next
sql="select distinct menuName,ordernum from vip_sys_menu where menu_level=-1 order by ordernum"
rstop.open sql,conn,1,1
topNum=rstop.recordcount

for k=0 to topNum-1
sql="select * from vip_sys_menu where menu_level=0 and higherMenu='"&rstop("menuName")&"' and master_qx>="&session("masterqx")&" order by ordernum"
rshigher.open sql,conn,1,1
higherNum=rshigher.recordcount	'获取一级菜单数量

%>
<table cellspacing="0" cellpadding="0" width="145" align="center">
  <tr><td id="topmenushow<%=k+1%>" <%if(k<>0) then response.write("style=""display:none;""")%>>
	<div id="topmenu">
<%
for i=0 to higherNum-1
sql="select * from vip_sys_menu where higherMenu='"&rshigher("menuName")&"' and master_qx>="&session("masterqx")&" and menu_level=1 order by ordernum"
rssub.open sql,conn,1,1
subNum=rssub.recordcount		'获取子菜单数量
%>
	<table cellspacing="0" cellpadding="0" width="145">
		<tr>
			<td class="menuTitle" id="menuTitle" onclick="showsubmenu(<%=n+1%>)" style="cursor:hand" height="24" background="<%=rshigher("picpath")%>">
			<table cellspacing="0" cellpadding="0" boder="0" with="100%"><tr align="center">
				<td width="40" align="center"><img id="topimg<%=n+1%>" src="../admin/images/menu/arrow_show.gif" border="0" alt="showmenu"></img></td>	
				<td><span><%=rshigher("menuName")%></span></td>
			</tr></table>
			</td>
		</tr>
		<tr>
			<td id="submenu<%=n+1%>" style="DISPLAY: none">
			<div id="menushow" class="sec_menu" style="WIDTH: 145px">
				<table cellspacing="0" cellpadding="0" width="135" align="center">
				<%for j=0 to subNum-1%>				
					<tr>
						<td height="20" align="center"><a target="<%=rssub("targetName")%>" href="<%=rssub("linkPage")%>">
						<img src="<%=rssub("picpath")%>" border="0" alt="<%=rssub("menuName")%>"></img><br/>
						<%=rssub("menuName")%></a></td>
					</tr>
				<%
					rssub.movenext
				next%>
				</table>
			</div>
			<br>
			</td>
		</tr>
  	</table>
<%
rssub.close
rshigher.movenext
n=n+1
next

%>
  </div></td></tr>
</table>
<%
rshigher.close
rstop.movenext
next

'closers(rstop)
'closers(rshigher)
'closers(rssub)
closeconn(conn)

end function
%>
<script language="javascript">
<!--
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
topimgshow = eval("topimg" + sid);
maxnum=menushow.length;
if (whichEl.style.display == "none")
{
	eval("submenu" + sid + ".style.display=\"\";");
	topimgshow.src="../admin/images/menu/arrow_top.gif";

	if (sid<maxnum){
		for(i=1;i<=sid-1;i++){
			eval("submenu" + i + ".style.display=\"none\";");
			eval("topimg" + i + ".src=\"../admin/images/menu/arrow_show.gif\";");
		}		
		for(i=sid+1;i<=maxnum;i++){
			eval("submenu" + i + ".style.display=\"none\";");
			eval("topimg" + i + ".src=\"../admin/images/menu/arrow_show.gif\";");
		}	
	}
	else{
		for(i=1;i<=sid-1;i++){
			eval("submenu" + i + ".style.display=\"none\";");
			eval("topimg" + i + ".src=\"../admin/images/menu/arrow_show.gif\";");
		}
	}
}
else
{	
	eval("submenu" + sid + ".style.display=\"none\";");
	topimgshow.src="../admin/images/menu/arrow_show.gif";
}
}

function showTopMenu(sid){
	whichEl = eval("topmenushow" + sid);
	maxnum=topmenu.length;

	if (whichEl.style.display == "none")
	{
		eval("topmenushow" + sid + ".style.display=\"\";");

		if (sid<maxnum){
			for(i=1;i<=sid-1;i++){
				eval("topmenushow" + i + ".style.display=\"none\";");
			}		
			for(i=sid+1;i<=maxnum;i++){
				eval("topmenushow" + i + ".style.display=\"none\";");
			}	
		}
		else{
			for(i=1;i<=sid-1;i++){
			eval("topmenushow" + i + ".style.display=\"none\";");
		}
	}


	}
	else
	{	
		//eval("topmenushow" + sid + ".style.display=\"none\";");
	}

	//Change bgcolor
	for(i=1;i<=maxnum;i++){
		whichTd = eval("div"+i);
		whichTd.style.backgroundColor="#EFEBDE";
	}
	whichTd = eval("div"+sid);
	whichTd.style.backgroundColor="#BDCBE7";//#66FFFF
}
-->
</script>