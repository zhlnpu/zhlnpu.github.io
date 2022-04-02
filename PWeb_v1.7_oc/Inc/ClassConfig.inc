<%	'ю╦д©еДжц
dim classname(),classcode()

Function getClassNames()
dim conn,rs,sql
set conn=getconn()
set rs=getrs()
sql="select * from sys_classConfig order by [index]"
rs.open sql,conn,1,1
if not rs.bof and not rs.eof then
	nums=rs.recordcount
	redim classname(nums),classcode(nums)
	for i=0 to nums-1
		if(rs.eof) then	exit for
		classname(i)=rs("menu_cn")
		classcode(i)=rs("menu_en")
		rs.movenext
	next
end if
rs.close
conn.close
End Function
Call getClassNames()
%>