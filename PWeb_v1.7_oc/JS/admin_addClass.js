function saveClass(){
	with(addclassForm){
		if(menu_cn.value==""){
			alert("菜单名不能为空!");
			menu_cn.focus();
			return false;
		}
		else if(menu_en.value==""){
			alert("英文名不能为空!");
			menu_en.focus();
			return false;
		}
		else if(index.value==""){
			alert("排序不能为空!");
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
			alert("此英文名菜单已经存在！");
			document.getElementById("showCheckResult").innerHTML="";
			document.getElementById("menu_en").focus();
			return false;
		}
		else{
			document.getElementById("showCheckResult").innerHTML="<a href='javascript:void(0);'>此名可用</a>";
		}
  	}
}

function checkIndexNum(){
	with(addclassForm){
		var re=/\D/;
		testStr=index.value;
		if(re.test(testStr)==true){
			alert("排序只能是数字序号！");
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
			alert("菜单英文名只能由字母、数字和下划线组成！");
			menu_en.focus();
			return false;
		}
	}
	return true;
}