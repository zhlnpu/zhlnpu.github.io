// JavaScript Document for Email check
function checkMail(mailObj){
	var email_re=/(\d|[a-z]|_)+@(\d|[a-z])+.(com|net|cn)/;

	if(email_re.test(mailObj.value)==false){
		alert("请输入正确的邮箱地址！");
		mailObj.focus();
		return false;	
	}
	return true;
}