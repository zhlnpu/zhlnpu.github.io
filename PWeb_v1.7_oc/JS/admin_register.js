function ifAgree(){
  with(form1){
	if(agreeit.checked == true){
		username.disabled=false;
		pass1.disabled=false;
		pass2.disabled=false;
		email.disabled=false;
		Submit.disabled=false;
	}
	else{
		username.disabled=true;
		pass1.disabled=true;
		pass2.disabled=true;
		email.disabled=true;
		Submit.disabled=true;		
	}
  }

}

function checkForm(){
	with(form1){
		var theName=username.value;
		var re=/<+|&+|\\+|\/+|#+|!+|\s+/;
		if(re.test(theName)){
			alert("�Բ����û������зǷ��ַ���");
			username.focus();
			return false;
		}

		if(username.value==""){
			alert("�û�������Ϊ�գ�");
			username.focus();
			return false;
		}
		else if(!isNaN(theName.substr(0,1))){
			alert("�û�����������ĸ�����»��߿�ͷ��");
			username.focus();
			return false;
		}
		else if(pass1.value==""){
			alert("���벻��Ϊ�գ�");
			pass1.focus();
			return false;
		}
		else if(pass1.value!=pass2.value){
			alert("��ȷ���������������һ����");
			pass2.value="";
			pass2.focus();
			return false;
		}
		if(checkMail(email)){
			userpass.value=MD5(pass1.value);
			action="saveRegister.asp";
			submit();
		}
	}
}

function checkUserName(userId) {
	var userObj=document.getElementById(userId);
	var checkName=userObj.value;
	if(checkName==""){return false;alert("error");}
  	var url = "checkUsername.asp?username=" + escape(checkName);
  	xmlHttp.open("GET", url, true);
  	xmlHttp.onreadystatechange = getResult;
  	xmlHttp.send(null);
}

function getResult() {
  	if (xmlHttp.readyState == 4) {
    		var response = xmlHttp.responseText;
		document.getElementById("showResult").innerHTML=response;
  	}
}