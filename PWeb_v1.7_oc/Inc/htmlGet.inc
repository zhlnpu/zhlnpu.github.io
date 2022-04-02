<script language="javascript">
<!--
String.prototype.getQueryString  =  function(name)  {  
	var  reg  =  new  RegExp("(^|&|\\?)"+  name  +"=([^&]*)(&|$)"),  r;  
    	if  (r=this.match(reg))  return  unescape(r[2]);  
	return  null;  
};  

var  sSearch = location.search;

var  sName  =  sSearch.getQueryString("Name");  	//获取变量
var  sYear  =  sSearch.getQueryString("old");  

//alert(sName);
document.all.t1.innerText=sName+sYear;			//显示变量

-->
</script>