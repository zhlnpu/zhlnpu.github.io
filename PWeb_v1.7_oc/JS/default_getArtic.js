function showArticle(articID) {
  	var url = "getHtmArticle.asp?articID=" + escape(articID);
  	xmlHttp.open("GET", url, true);
  	xmlHttp.onreadystatechange = updateArticle;
  	xmlHttp.send(null);
}

function updateArticle() {
  	if (xmlHttp.readyState == 4) {
		var response = xmlHttp.responseText;
		document.getElementById("showArticle").src=response;
  	}
}