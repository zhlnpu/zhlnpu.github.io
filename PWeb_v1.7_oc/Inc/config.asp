<!--#include file="conn.asp"-->
<%
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆
'★								 ★
'☆                         网站配置文件      	          	 ☆
'★								 ★
'☆  版权所有: www.oncecode.com					 ☆
'★                                                              ★
'☆  程序制作: shemily开发团队					 ☆
'★            email:lagtan@gmail.com				 ★
'☆            QQ群:群1：35650974 群2：35651086 群2：27582343	 ☆
'☆            请根据您的实际情况，将需要修改的项目中＝号后面	 ☆
'☆            双引号里面的内容修改成您自己的内容		 ☆
'☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆

'------------网站用户相关内容设置-----
Index_Title="重用网(Resue Studio)—走正路，做正当生意！"		'页面标题
LocalHostUrl="www.oncecode.com"						'本站网址
Sys_Email="lagtan@gmail.com"						'本站联系邮箱
'------------模板相关内容设置-----(此处模板指本站提供的免费以及收费模板)--
Index_corName="OC软件"							'首页公司中文名
Index_corEnName="oncecode Soft"						'首页公司英文名
Index_corAddress="中国-广东-东莞"					'首页公司地址
Index_corPhone="0755-8888****"						'首页公司电话
Index_showClass="include_asp"						'首页初始显示分类英文名

'------------网站初始化设置----------
Index_showMenu=0							'首页初始显示栏目id序号
Index_articID=27							'Ajax首页初始显示文章id序号

'------------(建议此处内容不做修改，因为修改后可能导致无法正常运行)----
ArticleSavePath="Articles/"						'文章保存路径(相对根目录的相对路径)
LocalAd_frame="../ADs/ocAd.htm"						'插入每篇文章头部的本站广告文件路径(相对文章目录的路径)
ADbyMsg_frame="../ADs/ocAdbyMsg.htm"					'插入每篇文章留言框旁边的广告文件路径(相对文章目录的路径)
AD_seacher="ADs/ocAd_search_l_top.htm"					'首页显示的搜索框广告（大小：120宽×100高）(相对根目录的路径)
IPDataPath="Data/worldip.asp"						'IP数据库相对根目录的路径(注意带后缀名)
errlogin_nouser="此用户名还未注册!"					'用户未注册提示
errlogin_wrongpass="您输入的密码错误!"					'密码错误提示

'------------网站功能类设置----------
IfSqlDataBase=1								'数据库类型 		0 为MSSQL 1 为Access
IfAllowReg=1								'是否允许用户注册会员 	0为否 1为是
IfNeedAd=1								'是否开启广告显示	0为否 1为是
IfNeedAdbyMsg=1								'是否开启文章留言框左边广告	0为否 1为是
IfNeedMsg=1								'是否开启留言功能	0为否 1为是（IfNeedLogin的前提）
	IfNeedLogin=0							'是否需要登陆才能留言 	0为否 1为是
IfShowTopArtics=1							'是否显示右边悬浮热门文章	0为否1为是
	TopArticOrderBy=0						'热门文章排序		0为按发布日期倒序 1为按当日点击数量倒序
MsgLinkColor="#3399FF"							'文章留言链接的字体颜色（此处设置的必须是一个有效的颜色值）

'-----Jmail邮件组件设置
JMailServerUserName = "test"						'输入smtp服务器验证登陆名
JMailServerPassword = "123456"						'输入smtp服务器验证密码
SmtpServer = "smtp.163.com"						'smtp服务器地址
Const PwebVersion="PWeb v1.7"						'当前版本
%>