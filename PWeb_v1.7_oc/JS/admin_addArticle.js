function saveArtic(userQx){
	with(addForm){
		if(title.value==""){
			alert("����д���⣡");
			title.focus();
			return false;
		}
		else if((title.value).length>50){
			alert("���ⳤ���벻Ҫ����50���ַ���");
			title.focus();
			return false;			
		}
		else if(topic.value==""){
			alert("����дժҪ��");
			topic.focus();
			return false;
		}
		else if((topic.value).length>200){
			alert("ժҪ���ݳ����벻Ҫ����200���ַ���");
			topic.focus();
			return false;			
		}
		else if(fromUrl.value==""){
			alert("����д������");
			fromUrl.focus();
			return false;
		}
		repDownUrl(downloadUrl);
		filterScript(userQx);	
		submit();		
	}
}

function repDownUrl(obj){	//�滻����UrlΪת��Url
	var a=eval(obj);
	var b=a.value;
	var re=/downloads\//;
	a.value=b.replace(re,"admin/downloader.asp?fn=");
}

function filterScript(userQx){	//����script�ű�
	var str=eWebEditor2.getHTML();
	if(userQx>1){
		str = DecodeFilter(str,"SCRIPT");
	}
	document.getElementById("content").value=str;
}

function selectClass(){
	with(addForm){
		if(ifSelectClass.checked==true){
			topclass.disabled=false;
			menu.disabled=true;
		}
		else{
			topclass.disabled=true;
			menu.disabled=false;
		}
	}	
}