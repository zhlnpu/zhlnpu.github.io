<!--#include file="conn.asp"-->
<%
'����������������������������������
'��								 ��
'��                         ��վ�����ļ�      	          	 ��
'��								 ��
'��  ��Ȩ����: www.oncecode.com					 ��
'��                                                              ��
'��  ��������: shemily�����Ŷ�					 ��
'��            email:lagtan@gmail.com				 ��
'��            QQȺ:Ⱥ1��35650974 Ⱥ2��35651086 Ⱥ2��27582343	 ��
'��            ���������ʵ�����������Ҫ�޸ĵ���Ŀ�У��ź���	 ��
'��            ˫��������������޸ĳ����Լ�������		 ��
'����������������������������������

'------------��վ�û������������-----
Index_Title="������(Resue Studio)������·�����������⣡"		'ҳ�����
LocalHostUrl="www.oncecode.com"						'��վ��ַ
Sys_Email="lagtan@gmail.com"						'��վ��ϵ����
'------------ģ�������������-----(�˴�ģ��ָ��վ�ṩ������Լ��շ�ģ��)--
Index_corName="OC���"							'��ҳ��˾������
Index_corEnName="oncecode Soft"						'��ҳ��˾Ӣ����
Index_corAddress="�й�-�㶫-��ݸ"					'��ҳ��˾��ַ
Index_corPhone="0755-8888****"						'��ҳ��˾�绰
Index_showClass="include_asp"						'��ҳ��ʼ��ʾ����Ӣ����

'------------��վ��ʼ������----------
Index_showMenu=0							'��ҳ��ʼ��ʾ��Ŀid���
Index_articID=27							'Ajax��ҳ��ʼ��ʾ����id���

'------------(����˴����ݲ����޸ģ���Ϊ�޸ĺ���ܵ����޷���������)----
ArticleSavePath="Articles/"						'���±���·��(��Ը�Ŀ¼�����·��)
LocalAd_frame="../ADs/ocAd.htm"						'����ÿƪ����ͷ���ı�վ����ļ�·��(�������Ŀ¼��·��)
ADbyMsg_frame="../ADs/ocAdbyMsg.htm"					'����ÿƪ�������Կ��ԱߵĹ���ļ�·��(�������Ŀ¼��·��)
AD_seacher="ADs/ocAd_search_l_top.htm"					'��ҳ��ʾ���������棨��С��120���100�ߣ�(��Ը�Ŀ¼��·��)
IPDataPath="Data/worldip.asp"						'IP���ݿ���Ը�Ŀ¼��·��(ע�����׺��)
errlogin_nouser="���û�����δע��!"					'�û�δע����ʾ
errlogin_wrongpass="��������������!"					'���������ʾ

'------------��վ����������----------
IfSqlDataBase=1								'���ݿ����� 		0 ΪMSSQL 1 ΪAccess
IfAllowReg=1								'�Ƿ������û�ע���Ա 	0Ϊ�� 1Ϊ��
IfNeedAd=1								'�Ƿ��������ʾ	0Ϊ�� 1Ϊ��
IfNeedAdbyMsg=1								'�Ƿ����������Կ���߹��	0Ϊ�� 1Ϊ��
IfNeedMsg=1								'�Ƿ������Թ���	0Ϊ�� 1Ϊ�ǣ�IfNeedLogin��ǰ�ᣩ
	IfNeedLogin=0							'�Ƿ���Ҫ��½�������� 	0Ϊ�� 1Ϊ��
IfShowTopArtics=1							'�Ƿ���ʾ�ұ�������������	0Ϊ��1Ϊ��
	TopArticOrderBy=0						'������������		0Ϊ���������ڵ��� 1Ϊ�����յ����������
MsgLinkColor="#3399FF"							'�����������ӵ�������ɫ���˴����õı�����һ����Ч����ɫֵ��

'-----Jmail�ʼ��������
JMailServerUserName = "test"						'����smtp��������֤��½��
JMailServerPassword = "123456"						'����smtp��������֤����
SmtpServer = "smtp.163.com"						'smtp��������ַ
Const PwebVersion="PWeb v1.7"						'��ǰ�汾
%>