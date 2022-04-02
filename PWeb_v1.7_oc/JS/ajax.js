//--------Iframe-窗口自动适应----------
function resizePage(){
	try{
		if(window.navigator.userAgent.indexOf("MSIE")>=1) { 		//IE 
			document.getElementById("showArticle").style.width=document.getElementById("showArticle").body.scrollWidth;
			document.getElementById("showArticle").style.height=document.getElementById("showArticle").body.scrollHeight + 10;
		}else if(window.navigator.userAgent.indexOf("fox")>=1) { 	//firefox 
			document.getElementById("showArticle").width=document.getElementById("showArticle").body.scrollWidth;
			document.getElementById("showArticle").height=document.getElementById("showArticle").body.scrollHeight + 10;
		}
	}catch(Exception){}
}

function showUpmenu(upmenu) {
  	var url = "getTopmenu.asp?upmenu=" + escape(upmenu);
  	xmlHttp.open("GET", url, true);
	document.getElementById("showSubPage").innerHTML="<p class='subMenu'>Loading...</p>";
  	xmlHttp.onreadystatechange = updateUpmenu;
  	xmlHttp.send(null);
}

function updateUpmenu() {
  	if (xmlHttp.readyState == 4) {
    		var response = xmlHttp.responseText;
		var arrStr=response.split("|");
		document.getElementById("showSubPage").innerHTML=arrStr[0];
		try{	// try to show first class and first article (2006.11.30added)
			if(arrStr[2]!="0"){showArticle(arrStr[2]);}
			if(arrStr[1]!="0"){
				var laterShow="chengepic('" + arrStr[1] + "',0)";
				setTimeout(laterShow,2000);
			}
		}catch(Exception){}
  	}
}

var subdivid=0;
function chengepic(submenu,sid){
	subdivid=sid;
	var picpath=document.getElementById("upmenu"+sid).src;
	var thepic=document.getElementById("upmenu"+sid);
	var folderpic=document.getElementById("upmenufolder"+sid);
	var subdiv=document.getElementById("submenu"+sid);
	
	if(picpath.indexOf("open_pic") != -1){
		thepic.src="images/close_pic.gif";
		folderpic.src="images/folderopen.gif";
		subdiv.style.display="";
	}
	else if(picpath.indexOf("openpic2") != -1){
		thepic.src="images/closepic2.gif";
		folderpic.src="images/folderopen.gif";
		subdiv.style.display="";
	}
	else if(picpath.indexOf("close_pic") != -1){
		thepic.src="images/open_pic.gif";
		folderpic.src="images/folder.gif";
		subdiv.style.display="none";
	}
	else if(picpath.indexOf("closepic2") != -1){
		thepic.src="images/openpic2.gif";
		folderpic.src="images/folder.gif";
		subdiv.style.display="none";
	}
	
	if(subdiv.innerHTML==""){	//如果是首次点击
		showSubmenu(submenu);
	}
}

function showSubmenu(submenu) {
  	var url = "getSubmenu.asp?submenu=" + escape(submenu);
  	xmlHttp.open("GET", url, true);
	document.getElementById("submenu"+subdivid).innerHTML="<p class='subMenu'>Loading...</p>";
  	xmlHttp.onreadystatechange = updateSubmenu;
  	xmlHttp.send(null);
}

function updateSubmenu() {
	var subdiv=document.getElementById("submenu"+subdivid);
	
  	if (xmlHttp.readyState == 4) {
    		var response = xmlHttp.responseText;
		var showStr=response.split("|");
		subdiv.innerHTML=showStr[0];
		try{
			if(showStr[1]!="0"){showArticle(showStr[1]);}
		}catch(Exception){}
  	}
}

function showMsgs(articID){
  	var url = "getMsgs.asp?articID=" + escape(articID);
  	xmlHttp.open('GET', url, true);
	document.getElementById("showReaderMsg").innerHTML="<p class='subMenu'>Loading...</p>";
  	xmlHttp.onreadystatechange = updateMsgs;
  	xmlHttp.send(null);
}

function updateMsgs() {
  	if (xmlHttp.readyState == 4) {
	    	var response = xmlHttp.responseText;
		document.getElementById("showReaderMsg").innerHTML=response;
		document.getElementById("msgcontent").value="";
		resizePage();
  	}
}

function saveMessage(articID){
	var iflogin="<%=iflogin%>";
	var IfNeedLogin="<%=IfNeedLogin%>";
	with(addMessageForm){
		if(IfNeedLogin=="1"){		//if need login befor pub a message
			if(iflogin=="0"){
				alert("对不起，您还未登陆！");
				msgcontent.focus();
				return false;
			}
		}

		var theMsg=msgcontent.value;
		var re=/<+|&+|\\+|\/+/;
		if(re.test(theMsg)){
			alert("对不起，留言内容中含有非法字符！");
			msgcontent.focus();
			return false;
		}
		else if(msgcontent.value==""){
			alert("留言内容不能为空！");
			msgcontent.focus();
			return false;
		}
		else if((msgcontent.value).length>200){
			alert("留言内容不能超过200个字符！");
			msgcontent.focus();
			return false;
		}
	}

  	var url = "admin/saveMessage.asp?articID=" + escape(articID)+"&msgcontent=" + escape(addMessageForm.msgcontent.value);
  	xmlHttp.open("GET", url, true);
	document.getElementById("showReaderMsg").innerHTML="<p class='subMenu'>Loading...</p>";
  	xmlHttp.onreadystatechange = updateMessage;
  	xmlHttp.send(null);
}

function updateMessage() {	
  	if (xmlHttp.readyState == 4) {
		var response = xmlHttp.responseText;
		showMsgs(response);
  	}
}