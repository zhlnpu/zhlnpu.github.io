<%
'-------------------------------颜色控制、Target控制-----------------------------------------------
function ShowNews(sql,idname,titlename,shownum,showlen,linkpage,thispage,usecolor,usetarget,ifbr,ifname)
'--------参数说明：shownum 显示记录数目，showlen 显示标题长度（字数）--------------
'------------------sql 数据库查询语句，titlename 新闻标题字段名 不同的字段用,号隔开;如"title,content"，linkpage 链接页面-------
'------------------usecolor 链接的颜色，usetarget 是否弹出页面 2-width-height-top-left，ifbr 是否换行显示--thispage 当前页面---
'------------------ifname 是否显示列名 0 为显示，1 为不显示
gapStr="<span style='font-size:14px'>·</span>"
dim title,newsnum
dim conn,rs	'连接，数据集
set conn=getconn()
set rs=getrs()
rs.open sql,conn,1,1

'----------------2006.06.13添加是否换行判断--------------------
if(ifbr=0) then		'0为关闭
	br=""
elseif(ifbr=1) then	'1为开放
	br="<br>"
end if

'----------------2006.06.15添加是否设置链接颜色----------------
if(usecolor="0") then	'0为关闭设置颜色
	setcolor=""
else			'其他为开放
	setcolor="style='color:"&usecolor&";'"
end if
'--------------------------------------------------------------
dim titlenames
titlenames=split(titlename,",")	'获取字段数组

if not rs.bof and not rs.eof then
	newsnum=rs.recordcount		'新闻总数
	if shownum>newsnum then shownum=newsnum
	rs.movefirst
	for i=1 to shownum
		if rs.eof then exit for	'如果到最后的记录就跳出
		title=""
		for j=0 to UBound(titlenames)
			if(ifname=0) then
				title=title&titlenames(j)&":"&left(rs(titlenames(j)),showlen)&"&nbsp;&nbsp;"
			else
				title=title&left(rs(titlenames(j)),showlen)&" "
			end if
		next
		if(left(usetarget,1)="2") then
			dim haw,clickstr
			haw=split(usetarget,"-")
			if(showlen<len(title)) then
				clickstr="openWithSubwindow("&""""&linkpage&"?linkid="&rs(idname)&"&url="&thispage&""""&","&CStr(haw(1))&","&CStr(haw(2))&","&CStr(haw(3))&","&CStr(haw(4))&")"
				Response.Write(gapStr&"<a href='javascript:void(0)' title='"&rs(titlenames(0))&"' "&setcolor&" onclick='"&clickstr&"'>"&title&"...</a>"&br)
			else
				clickstr="openWithSubwindow("&""""&linkpage&"?linkid="&rs(idname)&"&url="&thispage&""""&","&CStr(haw(1))&","&CStr(haw(2))&","&CStr(haw(3))&","&CStr(haw(4))&")"
				Response.Write(gapStr&"<a href='javascript:void(0)' title='"&rs(titlenames(0))&"' "&setcolor&" onclick='"&clickstr&"'>"&title&"</a>"&br)
			end if				
		else
			Response.Write(gapStr&"<a href='"&linkpage&"?linkid="&rs(idname)&"&url="&thispage&"' title='"&rs(titlenames(0))&"' target='"&usetarget&"' "&setcolor&">"&title&"</a>"&br)
		end if
		rs.movenext
	next
end if

rs.close
conn.close
end function
%>