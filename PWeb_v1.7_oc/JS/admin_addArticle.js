function saveArtic(userQx){
	with(addForm){
		if(title.value==""){
			alert("请填写标题！");
			title.focus();
			return false;
		}
		else if((title.value).length>50){
			alert("标题长度请不要超过50个字符！");
			title.focus();
			return false;			
		}
		else if(topic.value==""){
			alert("请填写摘要！");
			topic.focus();
			return false;
		}
		else if((topic.value).length>200){
			alert("摘要内容长度请不要超过200个字符！");
			topic.focus();
			return false;			
		}
		else if(fromUrl.value==""){
			alert("请填写出处！");
			fromUrl.focus();
			return false;
		}
		repDownUrl(downloadUrl);
		filterScript(userQx);	
		submit();		
	}
}

function repDownUrl(obj){	//替换下载Url为转向Url
	var a=eval(obj);
	var b=a.value;
	var re=/downloads\//;
	a.value=b.replace(re,"admin/downloader.asp?fn=");
}

function filterScript(userQx){	//过滤script脚本
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