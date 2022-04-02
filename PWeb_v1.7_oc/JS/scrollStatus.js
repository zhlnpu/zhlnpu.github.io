var msg="【推荐】98元企业、个人快速建站，详情见置顶文章《98元建站》";	//首页状态兰滚动文字广告内容
var delay=300;

function scrollStatus() {
	window.status=msg;
	msg=msg.substring(1,msg.length)+msg.substring(0,1);
	timeID=setTimeout("scrollStatus()",delay);
}

scrollStatus();