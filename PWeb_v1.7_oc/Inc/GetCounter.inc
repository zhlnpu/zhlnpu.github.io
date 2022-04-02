<%  
'------从字符串中查找某个字符个数并将原字符串截取用数组返回-------2006.04.28改进版
function charcount(str,findchar,strs())
'str 为索引字符串，findchar 为需要查找的字符  strs()用来返回被截取的字符串
    	dim counter   	'计数器
	dim startfrom 	'查找开始位置 
	dim theindex  	'字符的位置
	
	startfrom=1   	'初始化查找开始位置
	counter=0    	'初始化计数器
	theindex=-1   	'初始化
	
	do while theindex<>0	'获取字符重复出现次数
      	theindex=InStr(startfrom,str,findchar)
		
	  	if theindex<>0 then counter=counter+1
	  	startfrom=theindex+1
    	loop 	
	
if(counter<>0) then
	redim strs(counter)	'重新定义数组大小
	startfrom=1   	'初始化查找开始位置
	counter=0    	'初始化计数器
	theindex=-1   	'初始化
	
	do while theindex<>0
      	theindex=InStr(startfrom,str,findchar)
		
	  	if theindex<>0 then 
			strs(counter)=mid(str,startfrom,theindex-startfrom)	'截取字符串
			counter=counter+1
		else
			strs(counter)=mid(str,startfrom,len(str)-startfrom+1)	'截取字符串	
		end if
		
	  	startfrom=theindex+1
    	loop 
end if
	
	charcount=counter
end function

'-----------insert string------------字符插入函数
function insertstr(str1,str2,start)
	dim templeftstr 
	dim temprightstr 
	templeftstr=left(str1,start-1)
	temprightstr=right(str1,len(str1)-start+1)
	str1=templeftstr&str2&temprightstr
end function  
%>