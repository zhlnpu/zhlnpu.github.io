function saveClass(){
	with(addclassForm){
		if(menu_cn.value==""){
			alert("�˵�������Ϊ��!");
			menu_cn.focus();
			return false;
		}
		else if(menu_en.value==""){
			alert("Ӣ��������Ϊ��!");
			menu_en.focus();
			return false;
		}
		else if(index.value==""){
			alert("������Ϊ��!");
			index.focus();
			return false;
		}
		if(checkEnmenu() && checkIndexNum()){	
			submit();
		}
	}
}

function checkMenuName(menuname) {
  	var url = "checkMenuName.asp?menu_en=" + escape(menuname);
  	xmlHttp.open("GET", url, true);
  	xmlHttp.onreadystatechange = showResult;
  	xmlHttp.send(null);
}

function alterCheckMenuName(menuname,menuID) {
  	var url = "checkMenuName.asp?menu_en=" + escape(menuname) + "&id=" + escape(menuID);
  	xmlHttp.open("GET", url, true);
  	xmlHttp.onreadystatechange = showResult;
  	xmlHttp.send(null);
}

function showResult() {
  	if (xmlHttp.readyState == 4) {
    	var response = xmlHttp.responseText;
		if(response == "1"){
			alert("��Ӣ�����˵��Ѿ����ڣ�");
			document.getElementById("showCheckResult").innerHTML="";
			document.getElementById("menu_en").focus();
			return false;
		}
		else{
			document.getElementById("showCheckResult").innerHTML="<a href='javascript:void(0);'>��������</a>";
		}
  	}
}

function checkIndexNum(){
	with(addclassForm){
		var re=/\D/;
		testStr=index.value;
		if(re.test(testStr)==true){
			alert("����ֻ����������ţ�");
			index.focus();
			return false;
		}
	}
	return true;
}

function checkEnmenu(){
	with(addclassForm){
		var re=/\W/;
		testStr=menu_en.value;
		if(re.test(testStr)==true){
			alert("�˵�Ӣ����ֻ������ĸ�����ֺ��»�����ɣ�");
			menu_en.focus();
			return false;
		}
	}
	return true;
}