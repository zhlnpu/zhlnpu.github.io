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

	timeshow.innerHTML=MyYear+"��"+MyMonth+"��"+ MyDate+"�� "+MyHours+":"+MyMinutes+":"+MySeconds;
	setTimeout("datetime()",1000);
}

function getWeek(){
	AllMyDate=new Date();
	if (AllMyDate.getDay() == 5){weekday="������";}
	if (AllMyDate.getDay() == 6){weekday="������";}
	if (AllMyDate.getDay() == 0){weekday="������";}
	if (AllMyDate.getDay() == 1){weekday="����һ";}
	if (AllMyDate.getDay() == 2){weekday="���ڶ�";}
	if (AllMyDate.getDay() == 3){weekday="������";}
	if (AllMyDate.getDay() == 4){weekday="������";}
	document.write(weekday);
}
-->
</SCRIPT>