<%
'-------------测试代码参数设置---------------------
'dim rowNum,showNum,sql,linkField,fieldName,gapStr,styleStr,target
'rowNum=5
'showNum="4,4,4,4"
'sql="select top 20 * from articles"
'linkField="id"
'fieldName="title"
'gapStr=""
'link="#"
'styleStr="font-size:12px;"
'target=0
'dbstr="../"

'Call showClass(rowNum,showNum,sql,fieldName,gapStr,styleStr,target)
'----------------------------------------

function showClass(rowNum,showNum,gapStr,styleStr,target)
 		'rowNum 需要分几行显示
	 	'showNum 每行显示数目，如果每行显示数目不一样，则以逗号","隔开，
		'逗号数目比行数少一,如：分3行显示，则设置前两行数目即可："5,8"等等，
		'sql 查询语句
		'linkField 链接字段名
		'fieldName 显示字段的名字
		'gapStr 显示间隔符号
		'link 链接网址
		'styleStr 链接的样式表达式
		'target 显示链接网址的方式 0 为本页 1 为新开窗口
		
'-------------中间变量------------------
dim i,j,k					'循环变量
dim recordNum,tempRow,arrShowNum	'行数数组

'--------------变量初始化---------------
i=0
j=0
k=0
arrShowNum=split(showNum,",")
if(target=0) then
	target="_self"
else
	target="_blank"
end if

'------------------分行显示分类项目---------------------------

'on error resume next		'出错继续

for j=0 to rowNum-1
	if(InStr(showNum,",")>0 and j<rowNum-1) then 
	
		tempRow=arrShowNum(j)	'如果设置每行都一样
		for i=0 to tempRow-1
			if(k=UBound(className)-1) then exit for
%>
			<font size="1"><a style="<%=styleStr%>" href='javascript:void(0);' onClick='javascript:showUpmenu("<%=classCode(k)%>");' target="<%=target%>"><%=className(k)%></a>
			<%if(i<tempRow-1) then response.Write(gapStr)%>
			</font>
			<%
			k=k+1
		next
		response.write("<br/>")
	else
		while k<UBound(className)
%>			
			<font size="2">
			<a style="<%=styleStr%>" href="javascript:void(0)" onClick='javascript:showUpmenu("<%=classCode(k)%>");' target="<%=target%>"><%=className(k)%></a>
			<%
			k=k+1
			if(k<>UBound(className)) then response.Write(gapStr)%>
			</font>
			<%
		wend
	end if
next
'------------------------------------------
end function
%>