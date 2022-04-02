function loginCheck(){
	var theForm=document.getElementById("loginForm");
	with(theForm){
		if(username.value==""){
			alert("用户名不能为空！");
			username.focus();
			return false;
		}
		else if(userpass.value==""){
			alert("密码不能为空！");
			userpass.focus();
			return false;
		}		
		userpass.value=MD5(userpass.value);
		sendCheck(username.value,userpass.value);
	}
}

function sendCheck(user,pass){
  	var url = "admin/checkIndexLogin.asp?username=" + escape(user) + "&userpass=" + escape(pass);
  	xmlHttp.open("GET", url, true);
  	xmlHttp.onreadystatechange = ifLoginOk;
  	xmlHttp.send(null);	
}

function ifLoginOk(){
  	if (xmlHttp.readyState == 4) {
    		var response = xmlHttp.responseText;
		if(response.indexOf("|")>0){
			var arrRs=response.split("|");
			location.href=arrRs[1];
		}else{
			alert(response);
			document.getElementById("username").focus();
		}
  	}
}