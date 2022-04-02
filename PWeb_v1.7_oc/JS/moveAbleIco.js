// JavaScript Document create a moveable table
var init_x;
var init_y;

function icoTable(id,width,height,left,top,title,icoSrc,type,display)	//create table
{
this.id   = id;
this.width  = width;
this.height = height;
this.left  = left;
this.top   = top;
this.zIndex = zindex + 5;
this.title  = title;
this.icoSrc = icoSrc;
this.type=type;
this.display=display;
this.obj   = null;
this.icoInit  = icoInit;
this.icoInit();
}

function icoInit(){				//table init
	var tableStr = ""
	+ "<div id='" + this.id + "' class='"+ this.type +"' style='position:absolute;display:"+ this.display
	+ "; z-Index:"+ this.zIndex
	+";top:"+ this.top +";left:"+this.left+";width:"+ this.width +";height:"+this.height+";'>"
	+ "<table width='100%' height='100%' border='0' cellpadding='0' cellspacing='0' style='cursor:default'"
	+ " onmousedown='icoOnclick(this.parentNode,event); setCapture();'"
	+ " onmouseup='icoMouseUp(" + this.id + "); releaseCapture();'"
	+ " onmousemove='moveIcoTable(this.parentNode,event)'"
	+ " onDblClick='icoOnDbclick(this.parentNode)'>"
  	+ "<tr><td><table id='" + this.id + "_title' style='font-size:"+tbc_fontSize+";"
	+ " color:"+tbc_color+";' width='100%'  border='0' cellspacing='0' cellpadding='0'>"
	+ "<tr><td align='center'><img src='"+ this.icoSrc +"' border='0'></td></tr>"
        + "<tr>"
          + "<td align='center' height='30' valign='middle'>"
		  + "<a href='javascript:void(0);' onclick='icoOnDbclick(document.getElementById(\""+this.id+"\"))'>" + this.title + "</a>"
		  + "</td>"
        + "</tr>"
      + "</table></td></tr>"
	+ "</table>"
	+ "</div>";
	
	document.write(tableStr);
}

function icoOnclick(obj,evt){				//tabel onclick
	zindex +=5;
	obj.style.zIndex=zindex;
	
	init_x=evt.x - obj.style.pixelLeft;
	init_y=evt.y - obj.style.pixelTop;
}

function icoMouseUp(obj){				//release table
	
}

function moveIcoTable(obj,evt){		//move the table
	if(evt.button==1){ 
		var orX=obj.clientLeft; 
		var orY=obj.clientTop; 
		obj.style.pixelLeft=orX+(evt.x-init_x); 
		obj.style.pixelTop=orY+(evt.y-init_y); 
	}
}

function icoOnDbclick(obj){
	try{
		var obj_s=document.getElementById(obj.id + "_s");
		obj_s.style.display="block";
	}catch(exception){}
}

function closeIcoTable(tableObj){		//close the table
	if(tableObj.style.display=="block"){
		tableObj.style.display="none";
	}
}