// JavaScript Document for show title alert
function oc_showTitleAlert(evt,msg,showObjId){
	//evt == event;  msg == message to show
	try{
		var evtX=evt.x;
		var evtY=evt.y;
		var divObj=document.getElementById(showObjId);
		var msgObj=document.getElementById(showObjId + "_msg");
		
		if(divObj.style.display != "block"){
			divObj.style.display = "block";
		}
		
		divObj.style.pixelLeft=divObj.clientLeft + evtX -20 - document.body.scrollLeft;
		divObj.style.pixelTop=divObj.clientTop + evtY - 75 + document.body.scrollTop;
		msgObj.innerHTML=msg;
	}catch(exception){}
}

function oc_hideTitleAlert(showObjId){
	try{
		var divObj=document.getElementById(showObjId);
		
		if(divObj.style.display != "none"){
			divObj.style.display = "none";
		}
	}catch(exception){}
}