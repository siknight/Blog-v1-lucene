/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.17-log : Database - db_blog_v1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_blog_v1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_blog_v1`;

/*Table structure for table `t_a_blog_type` */

DROP TABLE IF EXISTS `t_a_blog_type`;

CREATE TABLE `t_a_blog_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `order_no` int(11) NOT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `use_it` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_a_blog_type` */

insert  into `t_a_blog_type`(`id`,`create_date_time`,`name`,`order_no`,`update_date_time`,`url`,`use_it`,`count`) values (1,'2019-05-22 09:22:08','分类1',1,'2019-06-15 23:24:38',NULL,1,6),(2,'2019-05-22 09:24:04','分类2',2,'2019-06-09 23:27:20',NULL,1,1),(3,'2019-06-09 23:43:43','SpringBoot资料',4,'2019-06-09 23:43:47',NULL,1,0),(4,'2019-06-19 16:54:19','其它分类',88,'2019-06-19 16:54:19',NULL,1,2);

/*Table structure for table `t_a_role` */

DROP TABLE IF EXISTS `t_a_role`;

CREATE TABLE `t_a_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `order_no` int(11) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_a_role` */

insert  into `t_a_role`(`id`,`create_date_time`,`name`,`order_no`,`remark`,`update_date_time`) values (3,'2019-02-20 11:35:54','管理员',1,NULL,'2019-06-05 23:19:19');

/*Table structure for table `t_a_user` */

DROP TABLE IF EXISTS `t_a_user`;

CREATE TABLE `t_a_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `order_no` int(11) NOT NULL,
  `pwd` varchar(200) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `true_name` varchar(200) NOT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK76cs7cu4h4y8vc1vd4qyw36rt` (`role_id`),
  CONSTRAINT `FK76cs7cu4h4y8vc1vd4qyw36rt` FOREIGN KEY (`role_id`) REFERENCES `t_a_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_a_user` */

insert  into `t_a_user`(`id`,`create_date_time`,`name`,`order_no`,`pwd`,`remark`,`true_name`,`update_date_time`,`role_id`,`image_url`) values (1,'2019-02-18 08:40:27','admin',1,'ba61ce8fa1e3725876e6363c76043c8d',NULL,'陈豪','2019-06-08 17:07:41',3,'/static/upload_image/user_cover/20190608/20190608170739.jpg');

/*Table structure for table `t_blog` */

DROP TABLE IF EXISTS `t_blog`;

CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `content_no_tag` longtext,
  `create_date_time` datetime DEFAULT NULL,
  `image_url` varchar(220) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `use_it` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `blog_type_id` int(11) DEFAULT NULL,
  `click_hit` int(11) DEFAULT NULL,
  `reply_hit` int(11) DEFAULT NULL,
  `summary` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8ky5rrsxh01nkhctmo7d48p82` (`user_id`),
  KEY `FKgecuq8t3wgd4kt4gvbut6e6s8` (`blog_type_id`),
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_a_user` (`id`),
  CONSTRAINT `FKgecuq8t3wgd4kt4gvbut6e6s8` FOREIGN KEY (`blog_type_id`) REFERENCES `t_a_blog_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `t_blog` */

insert  into `t_blog`(`id`,`content`,`content_no_tag`,`create_date_time`,`image_url`,`state`,`title`,`update_date_time`,`use_it`,`user_id`,`blog_type_id`,`click_hit`,`reply_hit`,`summary`) values (2,'<p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">var begintime_ms = Date.parse(new Date(begintime.replace(/-/g, &quot;/&quot;))); //begintime 为开始时间</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">var endtime_ms = Date.parse(new Date(endtime.replace(/-/g, &quot;/&quot;)));&nbsp;&nbsp; // endtime 为结束时间</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">得到的结果为 毫秒数，可根据 毫秒数的大小，来判断时间。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">当然根据毫秒数 可以根据他们的差值 来求相差的天数或是小时等。</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">-------------------------------</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5; font-size: 13px; font-family: Verdana, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(254, 254, 242);\">以上是求得 用户输入时间的毫秒数</p><p>var date1=new Date(); &nbsp;//开始时间</p><p>&nbsp;</p><p>var date2=new Date(); &nbsp; &nbsp;//结束时间</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5;\">var date3=date2.getTime()-date1.getTime() &nbsp;//时间差的毫秒数</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5;\">------------------------------</p><p>//计算出相差天数</p><p>var days=Math.floor(date3/(24*3600*1000))</p><p>&nbsp;</p><p style=\"margin: 10px auto; padding: 0px; line-height: 1.5;\">//计算出小时数</p><p>var leave1=date3%(24*3600*1000) &nbsp; &nbsp;//计算天数后剩余的毫秒数</p><p>var hours=Math.floor(leave1/(3600*1000))</p><p>//计算相差分钟数</p><p>var leave2=leave1%(3600*1000) &nbsp; &nbsp; &nbsp; &nbsp;//计算小时数后剩余的毫秒数</p><p>var minutes=Math.floor(leave2/(60*1000))</p><p>//计算相差秒数</p><p>var leave3=leave2%(60*1000) &nbsp; &nbsp; &nbsp;//计算分钟数后剩余的毫秒数</p><p>var seconds=Math.round(leave3/1000)</p><p>alert(&quot; 相差 &quot;+days+&quot;天 &quot;+hours+&quot;小时 &quot;+minutes+&quot; 分钟&quot;+seconds+&quot; 秒&quot;)</p><p><br/></p>','var begintime_ms = Date.parse(new Date(begintime.replace(/-/g, \"/\"))); //begintime 为开始时间var endtime_ms = Date.parse(new Date(endtime.replace(/-/g, \"/\")));   // endtime 为结束时间得到的结果为 毫秒数，可根据 毫秒数的大小，来判断时间。当然根据毫秒数 可以根据他们的差值 来求相差的天数或是小时等。-------------------------------以上是求得 用户输入时间的毫秒数var date1=new Date();  //开始时间 var date2=new Date();    //结束时间var date3=date2.getTime()-date1.getTime()  //时间差的毫秒数------------------------------//计算出相差天数var days=Math.floor(date3/(24*3600*1000)) //计算出小时数var leave1=date3%(24*3600*1000)    //计算天数后剩余的毫秒数var hours=Math.floor(leave1/(3600*1000))//计算相差分钟数var leave2=leave1%(3600*1000)        //计算小时数后剩余的毫秒数var minutes=Math.floor(leave2/(60*1000))//计算相差秒数var leave3=leave2%(60*1000)      //计算分钟数后剩余的毫秒数var seconds=Math.round(leave3/1000)alert(\" 相差 \"+days+\"天 \"+hours+\"小时 \"+minutes+\" 分钟\"+seconds+\" 秒\")','2019-06-09 11:25:09',NULL,1,'js计算时间差,包括计算，天，时，分，秒','2019-06-15 23:25:55',1,1,1,1,0,NULL),(3,'<pre class=\"brush:html;toolbar:false\">&lt;a&nbsp;href=&quot;javascript:window.opener&nbsp;=&nbsp;null;window.open(&#39;&#39;,&nbsp;&#39;_self&#39;);window.close();window.history.go(-1);\nwindow.location.href=&#39;https://www.baidu.com&#39;;&quot;&nbsp;class=&quot;btn-blue&quot;&nbsp;role=&quot;button&quot;&gt;关闭窗口&lt;/a&gt;</pre><p><br/></p><p><br/></p><p>&lt;a href=&quot;javascript:window.opener = null;window.open(&#39;&#39;, &#39;_self&#39;);window.close();window.history.go(-1);window.location.href=&#39;https://www.baidu.com&#39;;&quot; class=&quot;btn-blue&quot; role=&quot;button&quot;&gt;关闭窗口&lt;/a&gt;</p><p><br/></p><p><br/></p>','<a href=\"javascript:window.opener = null;window.open(\'\', \'_self\');window.close();window.history.go(-1);window.location.href=\'https://www.baidu.com\';\" class=\"btn-blue\" role=\"button\">关闭窗口</a><a href=\"javascript:window.opener = null;window.open(\'\', \'_self\');window.close();window.history.go(-1);window.location.href=\'https://www.baidu.com\';\" class=\"btn-blue\" role=\"button\">关闭窗口</a>','2019-06-09 17:33:16',NULL,1,'关闭按钮','2019-06-15 23:25:18',0,1,1,0,0,NULL),(4,'<p><br/></p><p><br/></p><p><span style=\"white-space:pre\">			</span>&lt;input id=&quot;q&quot;&nbsp; onkeydown=&quot;if(event.keyCode==13) search()&quot;&nbsp; placeholder=&quot;输入搜索内容&quot;&nbsp; type=&quot;text&quot;&nbsp; &nbsp;/&gt;</p><p>&nbsp;</p><p><br/></p><p><br/></p>','			<input id=\"q\"  onkeydown=\"if(event.keyCode==13) search()\"  placeholder=\"输入搜索内容\"  type=\"text\"   /> ','2019-06-10 09:07:14',NULL,1,'input 输入框  回车事件','2019-06-15 23:25:20',0,1,1,0,0,NULL),(5,'<p><br/></p><pre class=\"brush:java;toolbar:false\">&lt;style&gt;\n.info{padding:10px;&nbsp;margin-top:5px;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;background-color:&nbsp;#f8f8f8;}\n.info&nbsp;img{&nbsp;&nbsp;\n	display:inline-block;\n	float:left;&nbsp;&nbsp;\n	width:&nbsp;45px;\n	height:&nbsp;45px;\n	border-radius:&nbsp;2px;\n}\n.info&nbsp;a{&nbsp;&nbsp;&nbsp;&nbsp;\n	color:&nbsp;#01AAED;\n}\n&lt;/style&gt;\n&lt;div&nbsp;class=&quot;model&quot;&nbsp;style=&quot;background-color:&nbsp;#9e9e9e40;&quot;&gt;\n	&lt;div&nbsp;class=&quot;content&quot;&nbsp;style=&quot;&nbsp;padding-top:&nbsp;20px;&nbsp;padding-bottom:&nbsp;20px;&quot;&gt;\n			\n			&lt;div&nbsp;style=&quot;width:&nbsp;100%;&nbsp;overflow:&nbsp;hidden;&nbsp;display:&nbsp;flex;display:&nbsp;-webkit-flex;&quot;&gt;\n				\n				&lt;div&nbsp;&nbsp;style=&quot;flex:1;-webkit-flex:1;&quot;&nbsp;&nbsp;&gt;\n					&lt;div&nbsp;class=&quot;fly-card&quot;&nbsp;style=&quot;min-height:&nbsp;200px;&quot;&nbsp;&gt;\n						&lt;div&nbsp;style=&quot;padding:&nbsp;20px;&quot;&gt;\n							&lt;h1&nbsp;th:text=&quot;${blog.title}&quot;&gt;&lt;/h1&gt;\n							\n							&lt;div&nbsp;style=&quot;position:&nbsp;relative;&nbsp;overflow:&nbsp;hidden;&nbsp;&nbsp;margin-top:5px;&nbsp;&nbsp;&quot;&gt;\n								&lt;span&nbsp;style=&quot;display:inline-block;&nbsp;float:&nbsp;right;&quot;&gt;浏览:121&lt;/span&gt;\n							&lt;/div&gt;\n							\n							&lt;div&nbsp;class=&quot;info&quot;&nbsp;style=&quot;min-height:&nbsp;56px;&nbsp;&quot;&gt;\n								&lt;img&nbsp;th:src=&quot;${blog.user.imageUrl}&quot;&nbsp;&nbsp;/&gt;\n								&lt;div&nbsp;style=&quot;float:&nbsp;left;&nbsp;padding-left:&nbsp;10px;&quot;&gt;\n									&lt;a&nbsp;href=&quot;#&quot;&nbsp;class=&quot;fly-list-name&quot;&nbsp;th:text=&quot;${blog.user.trueName}&quot;&gt;作者&lt;/a&gt;\n									\n									&lt;span&nbsp;style=&quot;padding-left:&nbsp;10px;&quot;&gt;2018-55-55&lt;/span&gt;\n								&lt;/div&gt;\n							&lt;/div&gt;\n							\n							&lt;div&nbsp;th:utext=${blog.content}&nbsp;style=&quot;margin-top:&nbsp;20px;&nbsp;min-height:&nbsp;300px;&quot;&gt;\n							&lt;/div&gt;\n							\n							\n						&lt;/div&gt;\n						\n					&lt;/div&gt;\n				&lt;/div&gt;\n				\n				&lt;div&nbsp;&nbsp;style=&quot;width:&nbsp;350px;&nbsp;padding-left:&nbsp;10px;&quot;&nbsp;&nbsp;&nbsp;th:include=&quot;/pc/common/index_right_page&quot;&gt;\n				&lt;/div&gt;\n			&lt;/div&gt;\n			\n		&lt;div&nbsp;style=&quot;&nbsp;clear:both;&quot;&gt;&lt;/div&gt;&lt;!--content&nbsp;内部&nbsp;&nbsp;&nbsp;清除浮动&nbsp;--&gt;\n	&lt;/div&gt;\n&lt;/div&gt;\n\n\n&lt;!--&nbsp;底部&nbsp;内容&nbsp;模块&nbsp;--&gt;\n&lt;div&nbsp;class=&quot;model&quot;&nbsp;style=&quot;background-color:&nbsp;#0c0d0e;&quot;&nbsp;&nbsp;&nbsp;th:include=&quot;/pc/common/foot&quot;&gt;\n&lt;/div&gt;\n&lt;!--&nbsp;底部&nbsp;内容&nbsp;模块&nbsp;--&gt;\n			\n&lt;/div&gt;\n&lt;/body&gt;\n\n&lt;script&gt;\n	layui.use([&nbsp;&#39;laydate&#39;,&nbsp;&#39;laypage&#39;,&nbsp;&#39;layer&#39;,&nbsp;&#39;table&#39;,&nbsp;&#39;carousel&#39;,\n			&#39;upload&#39;,&nbsp;&#39;element&#39;&nbsp;],&nbsp;function()&nbsp;{\n		var&nbsp;laydate&nbsp;=&nbsp;layui.laydate&nbsp;//日期\n		,&nbsp;laypage&nbsp;=&nbsp;layui.laypage&nbsp;//分页\n		,layer&nbsp;=&nbsp;layui.layer&nbsp;//弹层\n		,&nbsp;table&nbsp;=&nbsp;layui.table&nbsp;//表格\n		,&nbsp;carousel&nbsp;=&nbsp;layui.carousel&nbsp;//轮播\n		,&nbsp;upload&nbsp;=&nbsp;layui.upload&nbsp;//上传\n		,&nbsp;element&nbsp;=&nbsp;layui.element;&nbsp;//元素操作\n		\n		&nbsp;//常规轮播\n		&nbsp;&nbsp;carousel.render({\n		&nbsp;&nbsp;&nbsp;&nbsp;elem:&nbsp;&#39;#lunbo&#39;\n		&nbsp;&nbsp;&nbsp;&nbsp;	&nbsp;,width:&nbsp;&#39;100%&#39;\n		&nbsp;&nbsp;&nbsp;&nbsp;		&nbsp;&nbsp;&nbsp;&nbsp;,height:&nbsp;&#39;400px&#39;\n		&nbsp;&nbsp;&nbsp;&nbsp;,arrow:&nbsp;&#39;always&#39;\n		&nbsp;&nbsp;});\n		\n		&nbsp;&nbsp;//总页数低于页码总数\n		&nbsp;&nbsp;laypage.render({\n		&nbsp;&nbsp;&nbsp;&nbsp;elem:&nbsp;&#39;demo0&#39;\n		&nbsp;&nbsp;&nbsp;&nbsp;,count:&nbsp;50&nbsp;//数据总数\n		&nbsp;&nbsp;});\n		&nbsp;&nbsp;\n		&nbsp;&nbsp;\n	});\n&lt;/script&gt;</pre><p><br/></p><p><br/></p><p><br/></p><p><iframe width=\"100%\" height=\"500px;\" src=\"//player.bilibili.com/player.html?aid=54551523&cid=95422785&page=1\" border=\"0\" frameborder=\"no\"> </iframe></p><p><br/></p>','<style>.info{padding:10px; margin-top:5px;     background-color: #f8f8f8;}.info img{  	display:inline-block;	float:left;  	width: 45px;	height: 45px;	border-radius: 2px;}.info a{    	color: #01AAED;}</style><div class=\"model\" style=\"background-color: #9e9e9e40;\">	<div class=\"content\" style=\" padding-top: 20px; padding-bottom: 20px;\">						<div style=\"width: 100%; overflow: hidden; display: flex;display: -webkit-flex;\">								<div  style=\"flex:1;-webkit-flex:1;\"  >					<div class=\"fly-card\" style=\"min-height: 200px;\" >						<div style=\"padding: 20px;\">							<h1 th:text=\"${blog.title}\"></h1>														<div style=\"position: relative; overflow: hidden;  margin-top:5px;  \">								<span style=\"display:inline-block; float: right;\">浏览:121</span>							</div>														<div class=\"info\" style=\"min-height: 56px; \">								<img th:src=\"${blog.user.imageUrl}\"  />								<div style=\"float: left; padding-left: 10px;\">									<a href=\"#\" class=\"fly-list-name\" th:text=\"${blog.user.trueName}\">作者</a>																		<span style=\"padding-left: 10px;\">2018-55-55</span>								</div>							</div>														<div th:utext=${blog.content} style=\"margin-top: 20px; min-height: 300px;\">							</div>																				</div>											</div>				</div>								<div  style=\"width: 350px; padding-left: 10px;\"   th:include=\"/pc/common/index_right_page\">				</div>			</div>					<div style=\" clear:both;\"></div><!--content 内部   清除浮动 -->	</div></div><!-- 底部 内容 模块 --><div class=\"model\" style=\"background-color: #0c0d0e;\"   th:include=\"/pc/common/foot\"></div><!-- 底部 内容 模块 -->			</div></body><script>	layui.use([ \'laydate\', \'laypage\', \'layer\', \'table\', \'carousel\',			\'upload\', \'element\' ], function() {		var laydate = layui.laydate //日期		, laypage = layui.laypage //分页		,layer = layui.layer //弹层		, table = layui.table //表格		, carousel = layui.carousel //轮播		, upload = layui.upload //上传		, element = layui.element; //元素操作				 //常规轮播		  carousel.render({		    elem: \'#lunbo\'		    	 ,width: \'100%\'		    		    ,height: \'400px\'		    ,arrow: \'always\'		  });				  //总页数低于页码总数		  laypage.render({		    elem: \'demo0\'		    ,count: 50 //数据总数		  });		  		  	});</script> ','2019-06-10 14:09:58',NULL,1,'测试代码  ','2019-06-15 23:25:19',0,1,1,0,0,NULL),(6,'<p><br/></p><p>var d = new Date();</p><p><br/></p><p><br/></p><p>d.getDay()&nbsp; &nbsp;返回表示星期的某一天的数字。 返回值是 0（周日） 到 6（周六） 之间的一个整数。</p><p><br/></p><p><br/></p><p><br/></p><p><br/></p><p>d.getFullYear() 方法可返回一个表示年份的 4 位数字。</p><p>d.getMonth() 方法可返回表示月份的数字。</p><p>d.getDate()&nbsp; 返回现在的 日</p><p><br/></p><p><br/></p><p>d.getHours() 返回值是 0 （午夜） 到 23 （晚上 11 点）之间的一个整数。</p><p>d.getMinutes() 返回值是分&nbsp; &nbsp; 0 ~ 59 之间的一个整数。</p><p>d.getSeconds()&nbsp; 返回时间的秒。返回值是 0 ~ 59 之间的一个整数。</p><p>d.getMilliseconds() 方法可返回时间的毫秒。</p><p><br/></p><p><br/></p><p><br/></p>','var d = new Date();d.getDay()   返回表示星期的某一天的数字。 返回值是 0（周日） 到 6（周六） 之间的一个整数。d.getFullYear() 方法可返回一个表示年份的 4 位数字。d.getMonth() 方法可返回表示月份的数字。d.getDate()  返回现在的 日d.getHours() 返回值是 0 （午夜） 到 23 （晚上 11 点）之间的一个整数。d.getMinutes() 返回值是分    0 ~ 59 之间的一个整数。d.getSeconds()  返回时间的秒。返回值是 0 ~ 59 之间的一个整数。d.getMilliseconds() 方法可返回时间的毫秒。','2019-06-10 23:12:00',NULL,1,'js 日期 类。操作','2019-06-15 23:27:26',0,1,2,5,0,'var d = new Date();d.getDay()   返回表示星期的某一天的数字。 返回值是 0（周日） 到 6（周六） 之间的一个整数。d.getFullYear() 方法可返回一个表示年份的 4 位数字。d.getMonth() 方法可返回表示月份的数字。d.getDate()  返回现在的 日'),(8,'<p>关于站长</p><p><br/></p>','关于站长','2019-06-19 16:54:38',NULL,0,'关于站长',NULL,0,1,4,1,0,'关于站长'),(9,'<p>本站源码下载</p>','本站源码下载','2019-06-19 16:55:10',NULL,0,'本站源码下载',NULL,0,1,4,1,0,'本站源码下载'),(13,'<p>在在在在</p>','在在在在','2019-06-18 00:17:07',NULL,0,'在在在在',NULL,0,1,1,1,0,'在在在在');

/*Table structure for table `t_config` */

DROP TABLE IF EXISTS `t_config`;

CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `css_version` varchar(20) DEFAULT NULL,
  `station_name` varchar(50) DEFAULT NULL,
  `web_name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `index_title` varchar(200) DEFAULT NULL,
  `keywords` varchar(200) DEFAULT NULL,
  `allpage_size` int(11) DEFAULT NULL,
  `index_page_size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_config` */

insert  into `t_config`(`id`,`css_version`,`station_name`,`web_name`,`description`,`index_title`,`keywords`,`allpage_size`,`index_page_size`) values (1,'22111','程序员聚集地','程序员聚集地','陈豪博客-程序员聚集地','陈豪博客-程序员聚集地','陈豪博客-程序员聚集地',50,20);

/*Table structure for table `t_link` */

DROP TABLE IF EXISTS `t_link`;

CREATE TABLE `t_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `order_no` int(11) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `use_it` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_link` */

insert  into `t_link`(`id`,`create_date_time`,`name`,`order_no`,`remark`,`update_date_time`,`url`,`use_it`) values (4,'2019-06-01 21:17:14','JSON在线解析及格式化验证',1,' ','2019-06-04 23:34:16','https://www.json.cn/',1),(5,'2019-06-01 21:24:10','阿里巴巴矢量图标库',0,' ','2019-06-04 23:33:42','https://www.iconfont.cn/',1),(6,'2019-06-04 23:34:56','PNG转ICO',2,'','2019-06-04 23:35:01','https://www.easyicon.net/covert/',1);

/*Table structure for table `t_lunbo` */

DROP TABLE IF EXISTS `t_lunbo`;

CREATE TABLE `t_lunbo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `order_no` int(11) NOT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `use_it` int(11) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_lunbo` */

insert  into `t_lunbo`(`id`,`create_date_time`,`name`,`order_no`,`update_date_time`,`url`,`use_it`,`image_url`) values (2,'2019-06-01 09:14:30',' ',1,'2019-06-16 10:38:55','/blog/6',1,'/static/upload_image/lunbo_cover/20190616/20190616103407.jpg'),(3,'2019-06-01 17:45:29','',2,'2019-06-16 10:38:40','/blog/6',1,'/static/upload_image/lunbo_cover/20190616/20190616103550.jpg'),(4,'2019-06-09 18:35:49','',3,'2019-06-16 10:38:49','/blog/6',1,'/static/upload_image/lunbo_cover/20190616/20190616103712.jpg'),(5,'2019-06-09 18:35:55',' ',4,'2019-06-16 10:38:52','/blog/6',1,'/static/upload_image/lunbo_cover/20190616/20190616103814.jpg');

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `div_id` varchar(50) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `permissions` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `order_no` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`div_id`,`icon`,`name`,`p_id`,`permissions`,`state`,`type`,`url`,`order_no`) values (1,'','','基本维护',-1,'',0,0,'',1),(2,'user_manage','&#xe67a;','用户管理',1,'用户管理',1,1,'/houtai/user/manage',1),(3,'','','博客',-1,'',0,0,'',2),(4,'blogtype','&#xe67a;','博客类型',3,'菜单2的菜单',1,0,'/houtai/blog/type/manage',1),(5,'role_manage','&#xe67a;','角色管理',1,'角色管理',1,0,'/houtai/role/manage',2),(6,'menu_manage','&#xe67a;','菜单管理',1,'菜单管理',1,0,'/houtai/menu/manage?pId=-1',3),(7,'blog','&#xe67a;','博文管理',3,'博文管理',1,0,'/houtai/blog/manage',2),(8,'lunbo','&#xe67a;','轮播管理',3,'轮播管理',1,0,'/houtai/lunbo/manage',3),(9,'link','&#xe67a;','友情链接',3,'友情链接',1,0,'/houtai/link/manage',4),(10,'config','&#xe67a;','网站配置',1,'网站配置',1,0,'/houtai/config/manage',4);

/*Table structure for table `t_role_menu` */

DROP TABLE IF EXISTS `t_role_menu`;

CREATE TABLE `t_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhayg4ib6v7h1wyeyxhq6xlddq` (`menu_id`),
  KEY `FKsonb0rbt2u99hbrqqvv3r0wse` (`role_id`),
  CONSTRAINT `FKhayg4ib6v7h1wyeyxhq6xlddq` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `FKsonb0rbt2u99hbrqqvv3r0wse` FOREIGN KEY (`role_id`) REFERENCES `t_a_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

/*Data for the table `t_role_menu` */

insert  into `t_role_menu`(`id`,`menu_id`,`role_id`) values (64,1,3),(65,2,3),(66,5,3),(67,6,3),(68,10,3),(69,3,3),(70,4,3),(71,7,3),(72,8,3),(73,9,3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
