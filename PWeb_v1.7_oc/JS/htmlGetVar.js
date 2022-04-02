// JavaScript Document HTML get request var
String.prototype.getQueryString  =  function(name)  {   //main function
 	var reg = new RegExp("(^|&|\\?)"+  name  +"=([^&]*)(&|$)"), r;  
    if (r=this.match(reg)){
		return unescape(r[2]);
	}
 	return  null;  
};  

var htmlGet = location.search;

//var  sName  =  sSearch.getQueryString("Name");   //get var
//var  sYear  =  sSearch.getQueryString("Year");  