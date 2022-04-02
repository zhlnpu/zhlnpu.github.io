// JavaScript Document for move the ocChater table
var ocChat_click_x;
var ocChat_click_y;

function ocChat_Onclick(obj,evt){			//tabel onclick		
	ocChat_click_x=evt.x - obj.style.pixelLeft;
	ocChat_click_y=evt.y - obj.style.pixelTop;
}

function ocChat_MouseUp(obj){
	//obj.style.backgroundColor=titleBgcolor;
}

function ocChat_moveTable(obj,evt){			//move the table
  try{
	if(evt.button==1){
		var orX=obj.clientLeft; 
		var orY=obj.clientTop; 

		obj.style.pixelLeft=orX+(evt.x-ocChat_click_x); 
		obj.style.pixelTop=orY+(evt.y-ocChat_click_y); 
	}
  }catch(exception){}
}

function ocChat_closeTable(tableObj){		//close the table
	try{
		tableObj.style.display="none";
	}catch(exception){}
}