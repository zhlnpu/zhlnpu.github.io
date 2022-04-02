// JavaScript Document for reset password
function resetPass(user,mail) {
  	var url = "resetPassword.asp?username=" + escape(user) + "&email=" + escape(mail);
  	xmlHttp.open("GET", url, true);
  	xmlHttp.onreadystatechange = getResult;
  	xmlHttp.send(null);
}

function getResult() {
  	if (xmlHttp.readyState == 4) {
    	var response = xmlHttp.responseText;
		if(response == "100"){
			document.getElementById("showResult").innerHTML="<font color=blue>密码重设成功，新密码已发送至您的邮箱，请查收！</font>";
		}else if(response == "101"){
			document.getElementById("showResult").innerHTML="<font color=red>密码重设失败，请检查您输入的用户名和邮箱是否相符</font>！";
		}
  	}
}

function checkForm(){
	var form=document.getElementById("form1");
	with(form){
		if(username.value==""){
			alert("请输入用户名！");
			username.focus();
			return false;
		}else if(email.value==""){
			alert("请输入邮箱地址！");
			email.focus();
			return false;
		}
		if(checkMail(email)){
			resetPass(username.value,email.value);		//reset password
		}
	}
}