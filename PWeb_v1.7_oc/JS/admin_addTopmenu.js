function saveMenu(){
	var re=/(\D)+/;
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
		else if(re.test(index.value)==true){
			alert("����д������Ϊ���!");
			index.focus();
			return false;			
		}
	
		submit();
	}
}