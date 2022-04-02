// JavaScript Document create a moveable table
var click_x;
var click_y;

function mTable(id,width,height,left,top,title,contentFrame,type,display)	//create table
{
zindex = zindex+5;
this.id   = id;
this.width  = width;
this.height = height;
this.left  = left;
this.top   = top;
this.zIndex = zindex;
this.title  = title;
this.contentFrame = contentFrame;
this.type=type;
this.display=display;
this.obj   = null;
this.mInit  = mInit;
this.mInit();
}

function mInit(){				//table init
	var tableStr = ""
	+ "<div id='" + this.id + "' class='"+ this.type +"' style='position:absolute; display:"+ this.display+";" 
	+" z-Index:"+ this.zIndex +"; top:"+ this.top +";left:"+this.left+";width:"+ this.width +";height:"+this.height+";'>"
	
	+ "<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0' style='cursor:default'"
	+ " onmousedown='mOnclick(this.parentNode);setCapture();'"
	+ " onmouseup=\"mMouseUp('" + this.id + "_title');releaseCapture();\""
	+ " onmousemove='moveTable(this.parentNode)'>"
  	+ "<tr><td><table id='" + this.id + "_title' style='background-color:" +tbc_normal + ";"
	+ "font-size:"+tbc_fontSize+"; color:"+tbc_color+";' width='100%'  border='0' cellspacing='0' cellpadding='0'>"
       + "<tr>"
           + "<th width='96%' height='20' align='left'><img src='../img/winxp/explorer.gif'"
		   + " border='0' onDblClick=\"closeTable('" + this.id + "')\"> " + this.title + "</th>"
           + "<td width='4%' align='right'><a href='javascript:void(0);' onClick=\"closeTable('" + this.id + "')\"> "
		   + "<img src='../img/winxp/closeWin.gif' border='0'></a></td>"
        + "</tr>"
      + "</table></td></tr>"
	+ "<tr><td height='100%' width='100%'><iframe id='" + this.id + "_frame' frameborder='0' src='" + this.contentFrame 
	+ "' scrolling='no' width='100%' height='100%'></iframe></td></tr>"
	+ "</table>"
	+ "</div>";
	
	document.body.insertAdjacentHTML("beforeEnd",tableStr);
}

function mOnclick(obj){			//tabel onclick
	zindex = zindex+5;
	obj.style.zIndex=zindex;
	var titleId=obj.id + "_title";
	var titleObj=document.getElementById(titleId);
	titleBgcolor=titleObj.style.backgroundColor;
	titleObj.style.backgroundColor=tbc_hover;
	
	click_x=event.x - obj.style.pixelLeft;
	click_y=event.y - obj.style.pixelTop;
}

function mMouseUp(objId){
	try{
		var obj=document.getElementById(objId);
		obj.style.backgroundColor=titleBgcolor;
	}catch(exception){}
}

function moveTable(obj){			//move the table
	if(event.button==1){ 
		var orX=obj.clientLeft; 
		var orY=obj.clientTop; 
		obj.style.pixelLeft=orX+(event.x-click_x); 
		obj.style.pixelTop=orY+(event.y-click_y); 
	} 
}

function closeTable(divId){		//close the table
	try{
		var divObj=document.getElementById(divId);
		divObj.style.display="none";
	}catch(exception){}
}