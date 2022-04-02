// JavaScript Document for hide online menu
function hide_QQMenu(divId,imgId){
	try{
		var divObj=document.getElementById(divId);
		var orWidth=parseInt((divObj.style.width).replace("px",""));
		var orLeft=parseInt((divObj.style.left).replace("px",""));

		var imgObj=document.getElementById(imgId);
		var orSrc=imgObj.src;
		
		var alertObj=document.getElementById("qqOnline_alert");
		
		var re=/close.gif/;
		if(re.test(orSrc)){
			divObj.style.left=(-orWidth + 10 + "px");
			imgObj.src="images/qqOnline/open.gif";
			alertObj.style.display="block";
		}else{
			divObj.style.left=(orLeft + orWidth - 8 + "px");
			imgObj.src="images/qqOnline/close.gif";
			alertObj.style.display="none";
		}
	}catch(exception){}
}