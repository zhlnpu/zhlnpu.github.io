<%
function showIndexTable(sql,rowNum,page,charLen,gapStr,styleStr,target)
		'classID	���·����ID���
 		'rowNum 	��Ҫ��ʾ������
	 	'charLen 	ÿ����ʾ����
		'gapStr 	��ʾ������ż�����ʽ����Ϊ��
		'styleStr 	���ӵ���ʽ���ʽ����Ϊ��
		'target 	��������ַ�ķ�ʽ��Ϊ_blank,_self,_parent,_top֮һ
		
'-------------���ݿ����----------------		
dim conn,rs		',sql

'-------------�м����------------------
dim i,j,k					'ѭ������

'-------------������ʼ��----------------
if(rowNum="" or IsNumeric(rowNum)=false) then
	rowNum=5		'set default rowNum=5
end if

if(charLen="" or IsNumeric(charLen)=false) then
	charLen=15		'set default charLen=15
end if

if(gapStr="") then
	gapStr="<span style='font-size:14px'>��</span>"		'set default gapStr and style
end if

'--------------������ʼ��---------------
i=0
page=CInt(page)
'on error resume next
set conn=getconn()		'�������conn.asp�ļ�ʹ��
set rs=getrs()

rs.open sql,conn,1,1
'---------------������---------------
%>
<!--out table start-->
<table width="100%" border="0" cellpadding="0" cellspacing="2">
<%
if(not rs.bof and not rs.eof) then
	recordNum=rs.recordcount
	if(rowNum>rs.recordcount) then rowNum=rs.recordcount 
	rs.pagesize=rowNum     		'����ÿҳ��ʾ��Ŀ
	pagenum=rs.pagecount        '��ȡҳ����Ŀ
	'response.Write("pagenum:"&pagenum)
	
    if(page < 1 or page="") then page = 1 
    if(page>pagenum) then page = pagenum  
	rs.absolutepage=page 	 '���õ�ǰҳ��

	do while not rs.eof
		if(i=rowNum) then exit do	'if have showed rowNum rows then exit do
%>
  <tr>
    <td class="moreTable_title"><a href="<%=dbstr&"articles.asp?linkid="&rs("id")%>" target="_blank"><%=rs("title")%></a></td><!--Title-->
  </tr>
  <tr height="40px" valign="top">
    <td class="moreTable_topic"><%=rs("topic")%></td><!--Topic-->
  </tr>
  <tr height="22px" valign="top">
    <td class="moreTable_info"><table width="100%"  border="0" cellspacing="0" cellpadding="0" class="moreTable_info">
      <tr>
        <td width="15%">����:<%=rs("author")%></td>
        <td width="25%">��Դ:<%=rs("fromUrl")%></td>
        <td width="45%">����ʱ��:<%=rs("pubTime")%></td>
        <td width="15%">����:<%=rs("readCounter")%></td>
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
		response.Write("��"&recordNum&"����¼ ")
    	If page <> 1 Then 
      		response.write("<a href="&thepage&"?page=1>��ҳ</a> " )
      		response.write("<a href="&thepage&"?page="&(page-1)&">��ҳ</a> " )
    	End If 
    	If page <> pagenum Then 
      		response.write("<a href="&thepage&"?page="&(page+1)&">��ҳ</a> ")
      		response.write("<a href="&thepage&"?page="&pagenum&">βҳ</a>") 
    	End If 	

    	response.Write("  ��ǰ"&page&"/"&pagenum&"ҳ &nbsp;&nbsp;��")
%>	
      <select name="menu1" onChange="MM_jumpMenu('parent',this,0)">
<%for i=1 to pagenum%>
        <option value='<%=thepage&"?page="&i%>'><%=i%></option>
<%next%>
      </select>ҳ
	</td></tr>
<%
else
%>
<tr><td class="usualText"><br/><br/> Sorry to alert you , zero back for your search!</td></tr>
<%
end if
%>
</table>
<%

rs.close
conn.close
'---------------------------------------

end function
%>