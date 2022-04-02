function ipOk(ipObj){
	var re=/\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}/;
	var re2=/\D/;
	var ipstr=ipObj.value;

	if(re.test(ipstr)==false){
		alert("请输入正确的IP!");
		ipObj.focus();
		return false;	
	}
	else{
		var ipArray = ipstr.split(".");
		i = ipArray.length
		if(i!=4)
		{
			alert("请输入正确的IP!");
			ipObj.focus();
			return false;
		}

		for(i=0;i<4;i++)
		{
			if(ipArray[i].length==0 || ipArray[i]>255 || re2.test(ipArray[i]))
			{
				alert("请输入正确的IP!");
				ipObj.focus();
				return false;
			}
		}
	}
	return true;
}