function saveMenu(){
	var re=/(\D)+/;
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
		else if(re.test(index.value)==true){
			alert("请填写数字作为序号!");
			index.focus();
			return false;			
		}
	
		submit();
	}
}