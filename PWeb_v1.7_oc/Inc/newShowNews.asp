<%
'-------------���Դ����������---------------------
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

function showClass(rowNum,showNum,sql,fieldName,gapStr,styleStr,target)
 		'rowNum ��Ҫ�ּ�����ʾ
	 	'showNum ÿ����ʾ��Ŀ�����ÿ����ʾ��Ŀ��һ�������Զ���","������
		'������Ŀ��������һ,�磺��3����ʾ��������ǰ������Ŀ���ɣ�"5,8"�ȵȣ�
		'sql ��ѯ���
		'linkField �����ֶ���
		'fieldName ��ʾ�ֶε�����
		'gapStr ��ʾ�������
		'link ������ַ
		'styleStr ���ӵ���ʽ���ʽ
		'target ��ʾ������ַ�ķ�ʽ 0 Ϊ��ҳ 1 Ϊ�¿�����
		
'-------------�м����------------------
dim i,j,k					'ѭ������
dim recordNum,tempRow,arrShowNum	'��������
dim rs,conn

'--------------������ʼ��---------------
set conn=getconn()
set rs=getrs()

i=0
j=0
k=0
arrShowNum=split(showNum,",")
if(target=0) then
	target="_self"
else
	target="_blank"
end if

'------------------������ʾ������Ŀ---------------------------
rs.open sql,conn,1,1
recordNum=rs.recordcount

'on error resume next		'�������
if not rs.eof and not rs.bof then

for j=0 to rowNum-1
	if(InStr(showNum,",")>0 and j<rowNum-1) then 
	
		tempRow=arrShowNum(j)	'�������ÿ�ж�һ��
		for i=0 to tempRow-1
			if(rs.eof) then exit for
%>
			<font size="2"><a style="<%=styleStr%>" href='javascript:void(0);' onClick='javascript:showUpmenu("<%=classcode(k)%>");' target="<%=target%>"><%=rs(fieldName)%></a>
			<%if(i<tempRow-1) then response.Write(gapStr)%>
			</font>
			<%
			rs.movenext
			k=k+1
		next
		response.write("<br/>")
	else
		while not rs.bof and not rs.eof
			k=k+1
%>			
			<font size="2">
			<a style="<%=styleStr%>" href="javascript:void(0)" onClick='javascript:showUpmenu("<%=k%>");' target="<%=target%>"><%=rs(fieldName)%></a>
			<%if(k<>recordNum) then response.Write(gapStr)%>
			</font>
			<%
			rs.movenext
		wend
	end if
next

end if

	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
'------------------------------------------
end function
%>