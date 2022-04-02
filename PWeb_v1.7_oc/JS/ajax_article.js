function resizeParentPage(){
	try{
		if (window.navigator.userAgent.indexOf("MSIE")>=1) { 		//IE 
			parent.document.getElementById("showArticle").style.width=document.body.scrollWidth;
			parent.document.getElementById("showArticle").style.height=document.body.scrollHeight + 10;
		}else if (window.navigator.userAgent.indexOf("fox")>=1) { 	//firefox 
			parent.document.getElementById("showArticle").width=document.body.scrollWidth;
			parent.document.getElementById("showArticle").height=document.body.scrollHeight + 10;
		}
	}catch(e){}
}

function showMsgs(articID){
	var url = "../getMsgs.asp?articID=" + escape(articID);
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
		resizeParentPage();
	}
}

function saveMessage(articID){
	with(addMessageForm){
		var theMsg=msgcontent.value;
		var re=/<+|&+|\\+|\/+/;
		if(re.test(theMsg)){
			alert("对不起，留言内容中含有非法字符！");
			msgcontent.focus();
			return false;
		}
		if(msgcontent.value==""){
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

	var url = "../admin/saveMessage.asp?articID=" + escape(articID)+"&msgcontent=" + escape(addMessageForm.msgcontent.value);
	xmlHttp.open("GET", url, true);
	document.getElementById("showReaderMsg").innerHTML="<p class='subMenu'>Loading...</p>";
	xmlHttp.onreadystatechange = updateSaveMessage;
	xmlHttp.send(null);
}

function updateSaveMessage() {
	var theArticId;
	indexstr=indexstr.replace("showMsgs('","");
	indexstr=indexstr.replace("')","");
	theArticId=parseInt(indexstr);
	if (xmlHttp.readyState == 4) {
		var response = xmlHttp.responseText;
		if(response=='loginFalse'){
			alert('对不起，您还未登陆！');
			document.getElementById("showReaderMsg").innerHTML="";
			showMsgs(theArticId);
			return false;
		}else if(response=="e101"){
			alert("there is a invalid letter in your words!");
			document.getElementById("showReaderMsg").innerHTML="";
			showMsgs(theArticId);
			return false;
		}else if(response=="e102"){
			alert("Sorry,your msg is too long!");
			document.getElementById("showReaderMsg").innerHTML="";
			showMsgs(theArticId);
			return false;
		}else if(response=="e103"){
			alert("Sorry, your reply is too quick!");
			document.getElementById("showReaderMsg").innerHTML="";
			showMsgs(theArticId);
			return false;
		}
		showMsgs(response);
	}
}

function openWithSubwindow(url,width,height,top,left){
	var d=new Date();
	window.open(url,'newpage'+d.getSeconds(),'width='+width+',height='+height+',top='+top+',left='+left+',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no,fullscreen=2');
}

function getCounter(articID) {
	var url = "../updateCounter.asp?articID=" + escape(articID);
	xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange = showCounter;
	xmlHttp.send(null);
}

function showCounter() {
	if (xmlHttp.readyState == 4) {
		var response = xmlHttp.responseText;
		document.getElementById("readCounter").innerHTML=response;
		resizeParentPage();
	}	
}