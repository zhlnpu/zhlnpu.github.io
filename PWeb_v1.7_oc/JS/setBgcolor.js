function setBgcolor(idname,maxnum,colorstr){
/*----set bgcolor----
    idname	element name
    sid		element index
    colorstr	bgcolor String
*/	
	var thisObj = document.getElementById(idname);
	var arrName = idname.split("_");
	var theid;

	try{
		var ts=arrName[0];
		for(i=0;i<maxnum;i++){
			theid = document.getElementById(arrName[0] +"_"+ i);
			theid.style.backgroundColor="";
		}
		thisObj.style.backgroundColor=colorstr;
	}catch(Exception){
		thisObj.style.backgroundColor=colorstr;
	}
}