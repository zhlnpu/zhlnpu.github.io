<script language="javascript">
<!--
function setBgcolor(idname,sid,colorstr){
/*----set bgcolor----
    idname	element name
    sid		element index
    colorstr	bgcolor String
*/	
	var maxnum;
	var thename;
	var theid;
	thename=eval(idname);
	maxnum=thename.length;
	if(isNaN(maxnum)==false){
		for(i=0;i<maxnum;i++){
			theid = eval(idname+"["+i+"]");
			theid.style.backgroundColor="";
		}
		theid = eval(idname+"["+sid+"]");
		theid.style.backgroundColor=colorstr;
	}else{
		thename.style.backgroundColor=colorstr;
	}
}
-->
</script>