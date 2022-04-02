<%
function getconn() 
  dim conn,ifsql
  ifsql=IfSqlDataBase		'0 = sql server  1 = access server 
  set conn = server.CreateObject("ADODB.Connection") 
  if(ifsql=0) then
  	conn.Open "Provider=SQLOLEDB;Persist Security Info=True;User ID=xxx;password=xxx;Initial Catalog=xxx;Data Source=127.0.0.1"
  else				'Access Database
	conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & server.MapPath(dbstr&"Data/xg.asp") &";"
  end if

  set getconn=conn
end function

function closeconn(conn) 
	conn.close
  	set conn=nothing
end function
 
function getrs()    
  dim rs
  set rs=server.createobject("ADODB.recordset")
  set getrs=rs
end function

function closers(rs)   
	rs.close
	set rs=nothing
end function
%>