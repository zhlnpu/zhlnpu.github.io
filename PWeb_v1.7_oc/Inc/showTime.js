<SCRIPT language=javascript>
<!--
function datetime(){ 
	AllMyDate=new Date();
	MyYear=AllMyDate.getYear();
	MyMonth=AllMyDate.getMonth();
	MyDate=AllMyDate.getDate();
	MyHours=AllMyDate.getHours();
	MyMinutes=AllMyDate.getMinutes();
	MySeconds=AllMyDate.getSeconds();

	timeshow.innerHTML=MyYear+"年"+MyMonth+"月"+ MyDate+"日 "+MyHours+":"+MyMinutes+":"+MySeconds;
	setTimeout("datetime()",1000);
}

function getWeek(){
	AllMyDate=new Date();
	if (AllMyDate.getDay() == 5){weekday="星期五";}
	if (AllMyDate.getDay() == 6){weekday="星期六";}
	if (AllMyDate.getDay() == 0){weekday="星期日";}
	if (AllMyDate.getDay() == 1){weekday="星期一";}
	if (AllMyDate.getDay() == 2){weekday="星期二";}
	if (AllMyDate.getDay() == 3){weekday="星期三";}
	if (AllMyDate.getDay() == 4){weekday="星期四";}
	document.write(weekday);
}
-->
</SCRIPT>