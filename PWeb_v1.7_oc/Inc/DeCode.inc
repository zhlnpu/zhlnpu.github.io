<%'服务器端VBScript
'================================================
' 显示解释函数，返回根据参数允许显示的格式字符串，具体调用方法可从后台管理获得
' 输入参数：
'	s_Content	:	要转换的数据字符串
'	s_Filters	:	要过滤掉的格式集，用逗号分隔多个
'================================================
Function DeCode(s_Content, sFilters)
	Dim a_Filter, i, s_Result, s_Filters
	Decode = s_Content
	If IsNull(s_Content) Then Exit Function
	If s_Content = "" Then Exit Function
	s_Result = s_Content
	s_Filters = sFilters

	' 设置默认过滤
	If sFilters = "" Then s_Filters = "script,object"

	a_Filter = Split(s_Filters, ",")
	For i = 0 To UBound(a_Filter)
		s_Result = DecodeFilter(s_Result, a_Filter(i))
	Next
	DeCode = s_Result
End Function

'//===============================================
'// 单个过滤
'// 输入参数：
'//	s_Content	:	要转换的数据字符串
'//	s_Filter	:	要过滤掉的单个格式
'//===============================================
Function DecodeFilter(html, filter)
	Select Case filter
	case "SCRIPT"		' 去除所有客户端脚本javascipt,vbscript,jscript,js,vbs,event,...
		html = execRE("<script[^>]*>.*</script[^>]*>", "", html)
		html = execRE("(javascript|jscript|vbscript|vbs):", "$1：", html)
		html = execRE("on(mouse|exit|error|click|key)", "<I>on$1</I>", html)
		html = execRE("&#", "<I>&#</I>", html)
	case "TABLE"		' 去除表格<table><tr><td><th>
		html = execRE("</?table[^>]*>", "", html)
		html = execRE("</?tr[^>]*>", "", html)
		html = execRE("</?th[^>]*>", "", html)
		html = execRE("</?td[^>]*>", "", html)
	case "CLASS"		' 去除样式类class=""
		html = execRE("(<[^>]+) class=[^ |^>]*([^>]*>)", "$1 $2", html) 
	case "STYLE"		' 去除样式style=""
		html = execRE("(<[^>]+) style=\""[^\""]*\""([^>]*>)", "$1 $2", html)
	case "XML"			' 去除XML<?xml>
		html = execRE("<\\?xml[^>]*>", "", html)
	case "NAMESPACE"	' 去除命名空间<o:p></o:p>
		html = execRE("<\/?[a-z]+:[^>]*>", "", html)
	case "FONT"		' 去除字体<font></font>
		html = execRE("</?font[^>]*>", "", html)
	case "MARQUEE"		' 去除字幕<marquee></marquee>
		html = execRE("</?marquee[^>]*>", "", html)
	case "OBJECT"		' 去除对象<object><param><embed></object>
		html = execRE("</?object[^>]*>", "", html)
		html = execRE("</?param[^>]*>", "", html)
		html = execRE("</?embed[^>]*>", "", html)
	case "HTML"		' 去除所有HTML标签
		html = execRE("</?[^>]*>", "", html)
	case "IMGURL"
		html = execRE("src=\""(http)?.*/?downloads/","src=""http://"&LocalHostUrl&"/downloads/", html)
	End Select

	DecodeFilter = html
End Function

'// ============================================
'// 执行正则表达式替换
'// ============================================
Function execRE(re, rp, content)
	set oReg = New RegExp
	oReg.Pattern = re
	oReg.Global=True
	Set Matches = oReg.Execute(content)
  	For Each Match in Matches      ' 遍历匹配集合。
		content=replace(content,Match.value,rp)
  	Next

	execRE = content
End Function
%>