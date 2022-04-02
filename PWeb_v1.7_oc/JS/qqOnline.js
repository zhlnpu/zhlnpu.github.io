// JavaScript Document for float AD
self.onError=null;
var currentX = 0;  
var currentY = 0;
var whichIt = null;           
var lastScrollX = 0; 
var lastScrollY = 0;
var NS = (document.layers) ? 1 : 0;		//check navigations
var IE = (document.all) ? 1: 0;
var fir= (window.navigator.userAgent.indexOf("fox")>=1) ? 1: 0;

function floatIt(div) {
	var obj=document.getElementById(div);
	var diffX,diffY;
	
 	if(IE || fir) {		//get diffrents
     	diffY = document.body.scrollTop; 
     	diffX = document.body.scrollLeft; 
  	}
  
  	if(NS) { 
		diffY = self.pageYOffset; 
		diffX = self.pageXOffset; 
	}
  
  	if(diffY != lastScrollY) {		//move the div
        percent = .1 * (diffY - lastScrollY);
        if(percent > 0) percent = Math.ceil(percent);
        else percent = Math.floor(percent);
		
		if(IE){obj.style.pixelTop += percent;}
   		if(NS){obj.style.top += percent;}
		if(fir){
			var orTop=parseInt((obj.style.top).replace("px",""));
			orTop += percent;
			obj.style.top = orTop + "px";
		}
		
        lastScrollY = lastScrollY + percent;
  	}
  
  	if(diffX != lastScrollX) {
   		percent = .1 * (diffX - lastScrollX);
   		if(percent > 0) percent = Math.ceil(percent);
   		else percent = Math.floor(percent);
		
   		if(IE){obj.style.pixelLeft += percent;}
   		if(NS){obj.style.left += percent;}
		
		if(fir){
			var orLeft=parseInt((obj.style.left).replace("px",""));
			orLeft += percent;
			obj.style.left = orLeft + "px";
		}		
		
		
   		lastScrollX = lastScrollX + percent;
  	} 
}

var delta=0.2;
function slowIn(div){
	var obj=document.getElementById(div);
	
	if(obj.offsetTop!=(document.documentElement.scrollTop+200)) { 
		var dy=(document.documentElement.scrollTop+200-obj.offsetTop)*delta; 
		dy=(dy>0?1:-1)*Math.ceil(Math.abs(dy)); 
		obj.style.top=(obj.offsetTop+dy) + "px"; 
	}
} 