<%
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'★                           翻页函数             	   	     ☆
'☆  版权所有: www.oncecode.com                                      ☆
'★  程序制作: shemily开发团队                                       ☆
'☆            email:lagtan@gmail.com                                ★
'★            QQ群:23378070                                         ☆
'☆                                                                  ★
'★  备    注: 以表格形式显示数据，通过CSS样式控制；                 ☆
'☆            提供全选、记录被选项ID、点击列名进行排序功能          ★
'★            附加打印功能，使用示例：                              ★
'☆ 	dim sql,thepage,shownum,page,pagenum,linkpage                ☆
'★  	sql="select * from xxxx"                                     ☆
'☆  	thepage="XXX.asp"                                            ☆
'★  	shownum=20                                                   ☆
'☆  	alterpage="XXX.asp"                                          ☆
'★  	delpage="XXX.asp"                                            ☆
'☆call ShowTable(sql,thepage,shownum,page,pagenum,1,alterpage,delpage,"修改",1) ☆
'★                                                                  ★
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'====以表格形式显示查询内容并提供翻页、超链接功能========By  Shemily==@2006.06.27================================
function ShowTable(sql,thepage,shownum,page,pagenum,checkbox,alterpage,delpage,dowhat,ifdel)
  '参数说明：sql 数据库查询语句；thepage 用来分页显示数据的页面名称； shownum 每页显示数据条数 
        ' page 当前显示的页码 pagenum 返回总页数 alterpage 修改页面(可含删除)	delpage 删除页面
	' checkbox 是否需要复选框 0 为开 1 为关闭 2-width-height-top-left为弹出窗口加宽、高、上边距、左边距 
	'ifdel 是否需要修改、删除页面 0为开 1为关闭
   	sql=CStr(sql)
	thepage=CStr(thepage)
	shownum=Clng(shownum)
	width=Clng(width)
	startrow=CInt(startrow)
	endrow=CInt(endrow)
	dim widanheight
	dim conn,rs
        set conn=getconn()
        set rs=getrs()    
   
	dim fieldnum  '字段数	
	dim linkid    '超链接传递的参数
	
	if (Request("page")<>"") then 
		page = CLng(Request("page")) 	'string型转化为long型 
	else 
		page = 0
	end if
'------------------排序处理-------------------------------
	if page=0 or session("thePage")<>thepage then
	 	session("thePage")=thepage
		session("tempsql")=""
		'response.write(session("thePage"))
	end if

	dim ordernum
	ordernum=InStrRev(sql,"order by")
	fromnum=InStrRev(sql,"from")
	if ordernum<>0 and fromnum<ordernum then 
		tempsql=CStr(left(sql,ordernum+8)&request("order"))
	else
		tempsql=CStr(sql&" order by "&request("order"))
	end if
	if request("order")<>"" then	'如果存在order by则替换
		if session("orderby")=0 then
			session("orderby")=1
			sql=CStr(tempsql&" desc")
		else
			session("orderby")=0
			sql=CStr(tempsql)
		end if
		session("tempsql")=sql	'记录查询语句
	end if
	if(session("tempsql")<>"") and session("thePage")=thepage then sql=CStr(session("tempsql"))
	'response.write(sql)
'-----------------------------------------------------------
	'on error resume next        '错误处理   
    	rs.open sql,conn,1,1
	
if(rs.bof and rs.eof) then
	response.Write("<div align='center'><p style=""color:blue;font-size:13px;""><br/>对不起，查询结果为零！</p></div> ")
	page=-1
else	
	recordnum=rs.recordcount    '记录数
	if(shownum>=rs.recordcount) then shownum=rs.recordcount 
	rs.pagesize=shownum     '设置每页显示数目
	pagenum=rs.pagecount        '获取页面数目
	fieldnum=rs.fields.count    '获取字段数
	redim fieldname(fieldnum)   '重新定义表字段数组
	redim tablecontent(shownum,fieldnum)  '重新定义表内容数组
	
	'page = CLng(Request("page")) 'string型转化为long型 
    	If page < 1 Then 
		page = 1 
    	elseIf page > pagenum Then 
	  	page = pagenum 
	end if  
	
	rs.absolutepage=page  '设置当前页面
	
	'显示表头
	  response.write("<table id='printTable' width='100%' border='0' cellpadding='0' cellspacing='0'><tr><td>")
	  response.write("<table id='ShowTable' class='turnTable' width='100%' align='center' border='1' cellpadding='2' cellspacing='0' style='border-collapse:collapse;' bordercolor='#AA9FFF'>")	
	  'bordercolorlight='#52A2FF' bordercolordark='#CCFFFF'	'细线表格属性
	  response.Write("<tr bgcolor='#52A2FF'>")
	  for j=1 to fieldnum  '预留序号字段用以做查询条件
		if j=fieldnum then
			if(ifdel=0) then response.Write("<th align='center' width='70' title='操作'>操作</th>")
		else
			response.Write("<th align='center' title='点击"&rs(j).name&"排序'><a style='color:#FFFFFF; font-size:14px; font-weight:bold;' href='"&thepage&"?order="&j+1&"&page="&page&"'>"&rs(j).name&"</a></th>")
		end if
	  next	
	  response.Write("</tr>")

	'rs.movefirst
	'显示表的内容
	for i=0 to shownum-1
	  if rs.eof then exit for
	  response.Write("<tr bgcolor='#CCFFFF'; onMouseOver=""this.style.backgroundColor='#E0DFFF'"" onMouseOut=""this.style.backgroundColor=''"">")
	  for j=1 to fieldnum-1  '预留序号字段用以做查询条件
	    	'输出处理
	    	showtxt=rs(rs(j).name)
		if(len(showtxt)>30) then showtxt=left(showtxt,30) 
	  
	    	response.Write("<td align='center' title='"&rs(rs(j).name)&"'>")
		if(checkbox="0" and j=1 and alterpage<>"") then  '使用第一个字段作为链接字段
			toshow="<div align='left'><input type='checkbox' name='checkbox' value='"&rs(rs(j-1).name)&"'/>&nbsp;"
			toshow=toshow&"<a href='"&alterpage&"?linkid="&rs(rs(j-1).name)&"&page="&page&"&action=alter'>"&showtxt&"<a></div>"
	      		response.Write(toshow)  '字段名称
		elseif(j=1 and alterpage<>"") then
			if(left(checkbox,1)="2") then
				widanheight=split(checkbox,"-")
				toshow="<a href='javascript:ClickAlter("&""""&alterpage&"?linkid="&rs(rs(j-1).name)&"&page="&page&"&action=alter"&""""&","&widanheight(1)&","&widanheight(2)&","&widanheight(3)&","&widanheight(4)&")'>"&showtxt&"<a>"
			else
	  			toshow="<a href='"&alterpage&"?linkid="&rs(rs(j-1).name)&"&page="&page&"&action=alter' >"&showtxt&"<a>"
			end if
	      		response.Write(toshow)  '字段名称
		else
			response.Write(showtxt)  '字段名称
		end if
		response.Write("</td>")
	  next
'----------------添加修改、保存链接---------------------
if(ifdel=0) then	  
	if(left(checkbox,1)="2") then
		widanheight=split(checkbox,"-")
		outstr="<td align='center'><a href='javascript:ClickAlter("&""""&alterpage&"?linkid="&rs(rs(0).name)&"&page="&page&"&action=alter"&""""&","&widanheight(1)&","&widanheight(2)&","&widanheight(3)&","&widanheight(4)&")'"
		outstr=outstr&">"&dowhat&"<a>&nbsp;"
		response.write(outstr)
	else
	  	response.write("<td align='center'><a href='"&alterpage&"?linkid="&rs(rs(0).name)&"&page="&page&"&action=alter'>"&dowhat&"<a>&nbsp;")
	end if
	redirecturl=delpage&"?linkid="&rs(rs(0).name)&"&page="&page&"&action=del"
	response.write("<a href='javascript:ClickDel("""&redirecturl&""")' >删除<a></td>")
end if
'-------------------------------------------------------
	response.Write("</tr>")
	rs.movenext
	next
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
	
	'翻页链接
	'response.Write("page:"&page)
	response.Write("</table></td></tr></table><br/>")
	response.write("<div align='center' class='turnTable'>")
	response.Write("共"&recordnum&"条记录 ")
	if(checkbox="0") then response.Write("全选<input type='checkbox' name='checkSelectAll' value='checkSelectAll' onclick='SelectAllCheckBox()'/>  ") 
    	If page <> 1 Then 
      		response.write("<a href="&thepage&"?page=1>首页</a> " )
      		response.write("<a href="&thepage&"?page="&(page-1)&">上页</a> " )
    	End If 
    	If page <> pagenum Then 
      		response.write("<a href="&thepage&"?page="&(page+1)&">下页</a> ")
      		response.write("<a href="&thepage&"?page="&pagenum&">尾页</a>") 
    	End If 	

    	response.Write("  当前"&page&"/"&pagenum&"页")	
	response.write("  转到<input type='text' name='TurnTo' style='height:18px;width:20px;' maxlength='5'>") 
	%>
<style type="text/css">
<!--
/* CSS Document */
.turnTable {
	font-size:13px;
}
.turnTable a:link { 
	text-decoration:none;
	color: blue;
	font-size: 13px;
}
.turnTable a:active {
	text-decoration:blink
}
.turnTable a:hover {
	text-decoration:underline;
	color: white;
	font-weight: bold;
} 
.turnTable a:visited {
	text-decoration: none;
	font-size: 13px;
}
.turnTable th {
	color:#FFFFFF; 
	font-size:14px; 
	font-weight:bold;
}

-->
</style>
	<input style="height:20px;width:25px;" type="button" name="Submit" value="Go" onclick="javascript:pageto=TurnTo.value;location.href='<%=thepage%>?page='+pageto;">
	<%
    response.write("</div>")
	
end if

end function
'============================================================================%>
<script language='javascript'>
<!--
function SelectAllCheckBox(){  //全选
 with(ShowTable){
  if(rows.length==2){
	if(checkSelectAll.checked==true)
	  checkbox.checked=true;
	else
	  checkbox.checked=false;
  } 
  else{
    for(i=0;i<rows.length-1;i++){
	if(checkSelectAll.checked==true)
	  checkbox(i).checked=true;
	else
	  checkbox(i).checked=false;
    }
  }
 } 
}

function ClickDel(redirecturl){
	if(confirm("确定删除？")){
		location.href=redirecturl;
	}
}

function ClickAlter(url,width,height,top,left){
	var d=new Date();
	window.open(url,"newpage"+d.getSeconds(),"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no,fullscreen=2");
}

function printPage(pagewith) { 
if (window.print) 
{
	var Div1 = document.all.printTable.innerHTML;
	//var Div2 = document.all.Div2.innerHTML; 
// *****************************************************
// Div1、Div2即为你在打印的区域
// 这里根据你要打印的哪些内容，从原显示页面中用
// <div id=Div1>Div1....</div><div id=Div2>Div2...</div>
// Table 等其他HTML标签也可
// ***************************************************** 

	var css='<style media="print">.Noprint { DISPLAY: none }</style>';
	/*var css = '<style type="text/css" media=all>' +
		'p { line-height: 120%}' +
		'.ftitle { line-height: 120%; font-size: 18px; color: #000000}' +
		'td { font-size: 10px; color: #000000}' +
		'</style>' ;*/
// *****************************************************
// 重定义打印用的CSS，具体你想打印出什么样的格式全看你自己
// 了，但要注意：如果此处有什么同网页中不一致的，可能打印
// 出来的页面同网页格式、字体可能会有所不同
// *****************************************************

	var webbro = '<center class=Noprint>' + 
		'<OBJECT id="WebBrowser" height="0" width="0" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" VIEWASTEXT></OBJECT>' + 
		'</center>';


	var body =webbro + '</br><table width="' +pagewith+ '" border="0" cellspacing="0" cellpadding="5">' +
		' <tr> ' +
		' <td class="fbody"> ' +
		' <div align="center" class=ftitle>' + Div1 + '</div>' 		//+ Div2 + 
		' </td>' +
		' </tr>' +
		'</table>';

// ******************************************************
// 在此处重新设置的打印格式，根据你的打印要求，将原显示的
// 网页的DIV内容重新组合，A4纸横打用920，竖打用640
// ******************************************************

	document.body.innerHTML = '<center>' + css + body + '</center>';
// ******************************************************
// 重设document.body，打印文档准备就绪
// ******************************************************

	//document.all.WebBrowser.ExecWB(7,1);	//打印预览
	window.print();
	window.history.go(0);
// ******************************************************
// 调用打印命令，打印当前窗口内容。当你打印时其实是一张新
// 的网页了，但网页文件还是原先的。紧接着调用
// window.history.go(0)，再回到打印前的页面，效果相当不差
// ******************************************************
	}
}
-->
</script>