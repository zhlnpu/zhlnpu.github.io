var msg="���Ƽ���98Ԫ��ҵ�����˿��ٽ�վ��������ö����¡�98Ԫ��վ��";	//��ҳ״̬���������ֹ������
var delay=300;

function scrollStatus() {
	window.status=msg;
	msg=msg.substring(1,msg.length)+msg.substring(0,1);
	timeID=setTimeout("scrollStatus()",delay);
}

scrollStatus();