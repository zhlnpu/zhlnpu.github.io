function loginIt(){
	var logF=document.getElementById("loginForm");
	with(logF){
		if(username.value==""){
			alert("用户名不能为空！");
			username.focus();
			return false;
		}
		else if(userpass.value=="" && userpass.disabled==false){
			alert("密码不能为空！");
			userpass.focus();
			return false;
		}		
		userpass.value=MD5(userpass.value);
		if(gowhere=="add"){
			action="saveUser.asp";
		}
		else if(gowhere=="check"){
			action="checkUser.asp";
		}
		else if(gowhere=="alter"){
			action="saveAlterUser.asp?action=alter";
		}
		submit();
	}
}

function changeValue(){
	var logF=document.getElementById("loginForm");
	with(logF){
		username.focus();
		if(gowhere=="add" || gowhere=="alter"){
			ok.value="保存";
			userpass.disabled=true;
			reg.style.display="none";
			cancel.style.display="";
		}
		else{
			ifalterpass.style.display="none";
			reg.style.display="";
			cancel.style.display="none";
		}
	}
}

function alterPass(){
	var logF=document.getElementById("loginForm");
	with(logF){
		if(ifalterpass.checked==true){
			userpass.disabled=false;
		}
		else{
			userpass.disabled=true;
		}
	}
}

function regUser(){
	if(window.opener==null){
		location.href="register.asp";
	}
	window.opener.location.href="register.asp";
	window.opener=null;
	window.close();
}