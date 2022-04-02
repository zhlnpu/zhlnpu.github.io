<%
function showTable(classID,rowNum,charLen,gapStr,styleStr,target)
		'classID	文章分类的ID序号
 		'rowNum 	需要显示多少行
	 	'charLen 	每行显示字数
		'gapStr 	显示间隔符号及其样式，可为空
		'styleStr 	链接的样式表达式，可为空
		'target 	打开链接网址的方式，为_blank,_self,_parent,_top之一
		
'-------------数据库变量----------------		
dim conn,rs,sql

'-------------中间变量------------------
dim i,j,k					'循环变量

'-------------环境初始化----------------
if(classID="" or IsNumeric(classID)=false) then		'classID check
	response.Write("Wrong classID input!")
	exit function	'exit
end if

if(rowNum="" or IsNumeric(rowNum)=false) then
	rowNum=5		'set default rowNum=5
end if

if(charLen="" or IsNumeric(charLen)=false) then
	charLen=15		'set default charLen=15
end if

if(gapStr="") then
	gapStr="<span style='font-size:14px'>·</span>"		'set default gapStr and style
end if

'--------------变量初始化---------------
i=0
j=0
k=0
'on error resume next
set conn=getconn()		'必须配合conn.asp文件使用
set rs=getrs()
sql="select * from articles where menu=(select menu_en from menus where [id]="&classID&")"
rs.open sql,conn,1,1

'---------------输出表格---------------
if(not rs.bof and not rs.eof) then
	do while not rs.eof
		if(i=rowNum) then exit do	'if have showed rowNum rows then exit do
		if(charLen<len(rs("title"))) then	'check title string length
			titleStr=left(rs("title"),charLen)		'get the title string
		else
			titleStr=rs("title")&":"&left(rs("topic"),charLen-len(rs("title")))
		end if
%>
<!--out table start-->
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>

<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td><%=gapStr%>
<a href='<%=rs("articName")%>' target="<%=target%>"><span style="<%=styleStr%>"><%=titleStr%></span></a>
</td></tr>
</table>
<!--out table end-->
<%
		i=i+1
		rs.movenext
	loop
end if
rs.close
conn.close
'---------------------------------------

end function

function showMoreTable(classID,rowNum,page,charLen,gapStr,styleStr,target)
		'classID	文章分类的ID序号
 		'rowNum 	需要显示多少行
	 	'charLen 	每行显示字数
		'gapStr 	显示间隔符号及其样式，可为空
		'styleStr 	链接的样式表达式，可为空
		'target 	打开链接网址的方式，为_blank,_self,_parent,_top之一
		
'-------------数据库变量----------------		
dim conn,rs,sql

'-------------中间变量------------------
dim i,j,k					'循环变量

'-------------环境初始化----------------
if(classID="" or IsNumeric(classID)=false) then		'classID check
	response.Write("Wrong classID input!")
	exit function	'exit
end if

if(rowNum="" or IsNumeric(rowNum)=false) then
	rowNum=5		'set default rowNum=5
end if

if(charLen="" or IsNumeric(charLen)=false) then
	charLen=15		'set default charLen=15
end if

if(gapStr="") then
	gapStr="<span style='font-size:14px'>·</span>"		'set default gapStr and style
end if

'--------------变量初始化---------------
i=0
page=CInt(page)
'on error resume next
set conn=getconn()		'必须配合conn.asp文件使用
set rs=getrs()
sql="select * from articles where menu=(select menu_en from menus where [id]="&classID&")"
rs.open sql,conn,1,1

'---------------输出表格---------------
%>
<!--out table start-->
<table width="100%" border="0" cellpadding="0" cellspacing="2">
<%
if(not rs.bof and not rs.eof) then
	recordNum=rs.recordcount
	if(rowNum>rs.recordcount) then rowNum=rs.recordcount 
	rs.pagesize=rowNum     		'设置每页显示数目
	pagenum=rs.pagecount        '获取页面数目
	'response.Write("pagenum:"&pagenum)
	
    if(page < 1 or page="") then page = 1 
    if(page>pagenum) then page = pagenum  
	rs.absolutepage=page 	 '设置当前页面
	'response.Write("page:"&page)
	
	'rs.movefirst
	do while not rs.eof
		if(i=rowNum) then exit do	'if have showed rowNum rows then exit do
%>
  <tr>
    <td class="moreTable_title"><a href="<%=rs("articName")%>" target="_blank"><%=rs("title")%></a></td><!--Title-->
  </tr>
  <tr height="40px" valign="top">
    <td class="moreTable_topic"><%=rs("topic")%></td><!--Topic-->
  </tr>
  <tr height="22px" valign="top">
    <td class="moreTable_info"><table width="100%"  border="0" cellspacing="0" cellpadding="0" class="moreTable_info">
      <tr>
        <td width="15%">作者:<%=rs("author")%></td>
        <td width="25%">来源:<%=rs("fromUrl")%></td>
        <td width="45%">发表时间:<%=rs("pubTime")%></td>
        <td width="15%">人气:<%=rs("readCounter")%></td>
      </tr>
    </table></td>
  </tr>
<!--out table end-->
<%
		i=i+1
		rs.movenext
	loop
%>
	<tr><td align="center" class="moreTable_link">
<%
		response.Write("共"&recordNum&"条记录 ")
    	If page <> 1 Then 
      		response.write("<a href="&thepage&"?id="&classID&"&page=1>首页</a> " )
      		response.write("<a href="&thepage&"?id="&classID&"&page="&(page-1)&">上页</a> " )
    	End If 
    	If page <> pagenum Then 
      		response.write("<a href="&thepage&"?id="&classID&"&page="&(page+1)&">下页</a> ")
      		response.write("<a href="&thepage&"?id="&classID&"&page="&pagenum&">尾页</a>") 
    	End If 	

    	response.Write("  当前"&page&"/"&pagenum&"页 &nbsp;&nbsp;到")
%>	
      <select name="menu1" onChange="MM_jumpMenu('parent',this,0)">
<%for i=1 to pagenum%>
        <option value='<%=thepage&"?id="&classID&"&page="&i%>'><%=i%></option>
<%next%>
      </select>页
	</td></tr>
</table>
<%	
	
end if
rs.close
conn.close
'---------------------------------------

end function
%>