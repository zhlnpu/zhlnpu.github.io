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

function showClass(rowNum,showNum,gapStr,styleStr,target)
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

'--------------������ʼ��---------------
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

'on error resume next		'�������

for j=0 to rowNum-1
	if(InStr(showNum,",")>0 and j<rowNum-1) then 
	
		tempRow=arrShowNum(j)	'�������ÿ�ж�һ��
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