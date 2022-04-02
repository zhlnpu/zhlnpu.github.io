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
			document.getElementById("showResult").innerHTML="<font color=blue>��������ɹ����������ѷ������������䣬����գ�</font>";
		}else if(response == "101"){
			document.getElementById("showResult").innerHTML="<font color=red>��������ʧ�ܣ�������������û����������Ƿ����</font>��";
		}
  	}
}

function checkForm(){
	var form=document.getElementById("form1");
	with(form){
		if(username.value==""){
			alert("�������û�����");
			username.focus();
			return false;
		}else if(email.value==""){
			alert("�����������ַ��");
			email.focus();
			return false;
		}
		if(checkMail(email)){
			resetPass(username.value,email.value);		//reset password
		}
	}
}