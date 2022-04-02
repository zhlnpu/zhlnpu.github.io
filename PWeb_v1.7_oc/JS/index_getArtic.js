function showArticle(articID) {
  	var url = "getArticle.asp?articID=" + escape(articID);
  	xmlHttp.open("GET", url, true);
	document.getElementById("showArticle").innerHTML="<p class='subMenu'>Loading...</p>";
  	xmlHttp.onreadystatechange = updateArticle;
  	xmlHttp.send(null);
}

function updateArticle() {	
  	if (xmlHttp.readyState == 4) {
	    var response = xmlHttp.responseText;
		setInnerHTML(document.getElementById("showArticle"),response);
  	}
}