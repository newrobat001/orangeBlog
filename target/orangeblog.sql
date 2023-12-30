/*
 Navicat Premium Data Transfer

 Source Server         : mysql80
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : orangeblog

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 18/12/2023 22:42:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int UNSIGNED NOT NULL COMMENT '用户id，可以理解为作者',
  `title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `short_title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ' ' COMMENT '副标题（简介更合适一些）',
  `picture` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `category_id` int UNSIGNED NOT NULL COMMENT '类目ID',
  `source` tinyint UNSIGNED NOT NULL COMMENT '来源，1.原创 2. 转载',
  `source_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原文链接',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态，0  未发布，1 已发布',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `作者id`(`user_id` ASC) USING BTREE,
  INDEX `类目id`(`category_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 867304771 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 1, 'Java学习之路-第一周', '', '', 1, 1, NULL, 1, 1, '2023-11-04 20:22:31', '2023-12-18 22:41:12');
INSERT INTO `article` VALUES (2, 1, '不是吧不是吧？不会还有人不知道无参方法是什么吧？', ' ', '', 1, 1, NULL, 1, 0, '2023-11-07 22:30:47', '2023-12-18 22:41:14');
INSERT INTO `article` VALUES (3, 1, '人生第一行Hello Word！——MySQL数据库的初学之旅', ' ', '', 1, 1, NULL, 1, 0, '2023-11-07 22:34:24', '2023-12-18 22:41:17');
INSERT INTO `article` VALUES (4, 1, '只会if-else、for？学java不如来做个项目吧！', ' ', '', 2, 1, NULL, 0, 0, '2023-11-08 19:44:44', '2023-12-18 22:41:19');
INSERT INTO `article` VALUES (5, 1, '不是吧阿sir，十月一都在吃吃吃？不趁假期来复习java？', ' ', '', 1, 1, NULL, 0, 0, '2023-11-16 20:58:32', '2023-12-18 22:41:20');
INSERT INTO `article` VALUES (6, 1, 'JAVA面向对象编程思想——封装', ' ', '', 1, 1, NULL, 0, 0, '2023-11-16 20:59:22', '2023-12-18 22:41:22');
INSERT INTO `article` VALUES (7, 1, 'Java面向对象编程思想————三大特性之继承（内有具体案例）', ' ', '', 1, 1, NULL, 0, 0, '2023-11-16 20:59:36', '2023-12-18 22:41:25');
INSERT INTO `article` VALUES (8, 1, 'JAVA编程思想——面向对象—重载与重写', '', '', 6, 1, NULL, 0, 0, '2023-11-23 15:14:08', '2023-11-24 13:39:20');
INSERT INTO `article` VALUES (9, 1, '2020最新JAVA多态详解', ' ', '', 11, 1, NULL, 0, 0, '2023-11-24 13:40:05', '2023-11-29 15:44:38');
INSERT INTO `article` VALUES (863819785, 1, '【第一篇】我是如何搭建出这个博客的', '关于本网站的建设。', '', 4, 1, NULL, 0, 0, '2023-11-23 18:45:46', '2023-11-29 15:32:40');
INSERT INTO `article` VALUES (863965219, 1, '2020最新Java多态详解', '关于Java多态学习心得以及一个小例子，帮助读者理解。', '', 6, 1, NULL, 0, 0, '2023-11-24 14:01:34', '2023-11-24 14:01:34');
INSERT INTO `article` VALUES (864393145, 1, '河南大学生如何走出河南？', '关于我个人的一点心得与看法', '', 1, 1, NULL, 0, 0, '2023-11-26 22:42:25', '2023-11-30 22:59:52');
INSERT INTO `article` VALUES (864393755, 2, '河南大学生如何走出河南？', '1234', '', 1, 1, NULL, 0, 1, '2023-11-26 22:47:16', '2023-11-30 21:45:33');
INSERT INTO `article` VALUES (867301667, 1, '1234', '1234', '', 1, 1, NULL, 0, 0, '2023-12-12 23:57:17', '2023-12-12 23:57:17');
INSERT INTO `article` VALUES (867301721, 1, '1234', '1234', '', 1, 1, NULL, 0, 0, '2023-12-12 23:57:42', '2023-12-12 23:57:42');
INSERT INTO `article` VALUES (867302949, 1, 'blblblblblbl', '1234', '', 1, 1, NULL, 0, 0, '2023-12-13 00:07:28', '2023-12-13 00:07:28');
INSERT INTO `article` VALUES (867304770, 1, '1234', '1234', '76d34558e653.png', 1, 1, NULL, 0, 0, '2023-12-13 00:21:56', '2023-12-13 00:21:56');

-- ----------------------------
-- Table structure for article_detail
-- ----------------------------
DROP TABLE IF EXISTS `article_detail`;
CREATE TABLE `article_detail`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `article_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章ID',
  `version` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '版本号',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_article_version`(`article_id` ASC, `version` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_detail
-- ----------------------------
INSERT INTO `article_detail` VALUES (1, 1, 1, '## JAVA学习之路\n\n\n@[TOC](文章目录)\n\n</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 前言\n\n<font color=#999AAA >JAVA是学习的第一门编程语言，本篇文章将记录学习过程</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n<font color=#999AAA >\n\n# 一、JAVA是什么？\n\n\n<font color=#999AAA >java是一门**面向对象**的编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。\n***Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程   。***\n\n# 二、变量、数据类型和运算符\n\n## 1.变量\n\n\n\n<font color=#999AAA >变量就是一个容器，能容纳数据的地方。\n<font color=#FFD700 >声明变量：\n数据类型 变量名=对应的值\n\n```java\nint a=1；//声明变量a并给a赋值1\n```\n变量名命名规则：\n<font color=#B22222>\n1、以下划线、字母、美元符开头。\n2、后面跟下划线、字母、美元符以及数字。\n3、 没有长度限制（但也不能太长！）。\n4、对大小写敏感（意思是大小写代表不同含义）\n\n## 2.数据类型\n\n<font color=#999AAA >在声明变量时提到数据类型，顾名思义就是数据的类型。在java中有很多数据类型，一般常用的有\n\n```java\nint   //整型，一般用于储存整数\ndouble//双精度，储存小数\nString//字符串，储存一串字符\n```\n\n\n\n\n\n\n\n\n\n\n## 3.运算符\n运算符分为三类\n1、算术运算符：\n<font color=9932CC>加\'+\'，减\'-\'，乘\'*\'，除\'/\'，求余\'%\'\n<font color=#1C1C1C>2、逻辑运算符：\n<font color=9932CC>逻辑与\'&&\'，逻辑或\'||\'，逻辑非\'!\'，逻辑异或\'^\'，逻辑与\'&\'，逻辑或\'|\'\n<font color=#1C1C1C>3、关系运算符\n<font color=9932CC>等于\'==\'，不等于\'!=\'，大于\'>\'，大于等于\'>=\'，小于\'<\'，小于等于\'<=\'\n\n## 4.布尔类型\n布尔类型用于判断一个值得真假。具体用法是用于作比较判断。\n\n```java\nboolean //布尔类型只有两个值，为true（真）和 False（假）\n```\n\n# 三、选择结构\n\n## 1、if选择\n\n以下为if的各种用法\n![在这里插入图片描述](https://img-blog.csdnimg.cn/202009191018077.png#pic_center)\nIF语法结构：\n\n```java\n//基本if语法结构\nif(条件语句结果必须为布尔值){\n		//所执行代码块\n}\n-------------------------------------------------------------------------------\n//if-else语法结构\nif(条件语句结果必须为布尔值){\n		//所执行代码块\n}else{\n		//所执行代码块\n}\n-------------------------------------------------------------------------------\n//if-else语法结构\nif(条件语句结果必须为布尔值){\n		//所执行代码块\n}else if(条件语句结果必须为布尔值){\n		//所执行代码块\n}else{\n		\n}\n-------------------------------------------------------------------------------\n//if嵌套\nif(条件语句结果必须为布尔值){\n		if(条件语句结果必须为布尔值){\n		//所执行代码块\n}\n}else{\n		//所执行代码块\n}\n```\n\n\n## 2、switch\n\n```java\nswitch(){\ncase 1:		//分支1\n	break;	//结束循环\ncase 2:		//分支2\n	break;	//结束循环\ncase ...:	//分支...\n	break;	//结束循环\ndefault		//当不在情况内时\n	break;	//结束循环\n}\n```\n\n\n</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 四、循环结构\n\n## 1.while\n循环结构的出现是为了解决重复操作、判断等。while循环就是一种循环结构。以下为基本结构：\n```java\nwhile(循环条件){\n    循环操作;\n}\n```\n具体用法：\n```java\nint i=0;\n2 while (i<100//限制条件按) {\n3     System.out.println(\"第\"+(i+1)+\"遍好好学习！\");//循环操作\n4     i++;\n5 }\n```\n输出结果为一百遍“好好学习！”\n  \n\n```java\n第100遍好好学习！\n```\n\n               \n## 2.do while\ndo while是while循环的进阶用法。不同于while的运行过程，do while是先判断再执行。\n\n```java\ndo {\n    循环操作\n} while(循环条件);\n```\n与while用法一致，不过先执行do后的代码块，然后执行循环操作，再返回上一步。\n## 3.FOR循环\n   for循环是与其他循环结构没有太大差别的循环结构，相较于其他的循环结构更加简洁方便且使用较为广泛。\n   \n\n```java\nfor(int i;i>0:i++)\n{\n循环体；\n}\n```\nwhile循环的例子用for写可以更简洁。例如：\n\n```java\nfor(int i;i<100;i++){\n	System.out.println(\"第\"+(i+1)+\"遍好好学习！\");//循环操作\n}\n```\n运行结果和while循环一样，由此可以看出for循环更简洁更方便。\n                                                                                                                                                                                                \n# 总结\n<font color=#999AAA >上阶段学习到此结束，以上为总结知识点。\n\n\n\n', 0, '2023-11-04 20:36:38', '2023-11-24 13:34:36');
INSERT INTO `article_detail` VALUES (2, 2, 1, '## java学习之路\n\n\n\n\n@[TOC](文章目录)\n\n</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 前言\n\n<font color=#999AAA >快速学习java之路第二周</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n<font color=#999AAA >提示：以下是本篇文章正文内容，下面案例可供参考\n\n# 一、类\n类的属性：对象所拥有的静态特征在类中表示时称为类的属性。\n类的方法：对象执行的操作称为类的方法。\n\n\n\nJava的类模板：\n```java\npublic class <类名>{	//定义类名\n    //定义属性部分\n    属性1的类型 属性1;\n    属性2的类型 属性2;\n   	......\n    属性n的类型 属性n;\n    //定义方法部分\n    方法1;\n    方法2;\n    ......\n    方法n;\n}\n```\n\n# 二、类的无参方法是什么\n\n<font color=#999AAA >无参方法就是没有参数的方法，是一种没有参数、没有返回值的一种方法体写在类中。\n\n\n下面写一个简单的例子来演示一下：\n```java\npublic class School(){\n	String stuname=\"张三\";		//学生姓名\n	String stuclass=\"软件二班\";	//学生班级\n	int stuage=\"19\";			//学生年龄\n	public void show(){\n		system.out.println(\"学生姓名为：\"+stuname+\"学生班级为：\"+stuclass+\"学生年龄为：\"+stuage)\n	}\n}\n```\n上面是写在School类中的一个show方法，下面引用一下方法。\n\n```java\npublic class Student(){\n	public static void main(String[] args) {\n		School ss=new School();  //调用类\n		ss.show;				 //调用类中的show方法\n	}\n}\n```\n运行结果为：\n<font color=#CD000>**学生姓名为：张三学生班级为：软件二班学生年龄为：19**</font>\n\n\n\n# 总结\n无参方法是java编程中的一种广泛应用的方法，这种方法有很多好处\n<font color=##CD000 >\n1-将解决问题的方法与主函数代码分开，逻辑更清晰，代码可读性更强。\n<font color=##CD000 >\n2-若方法出错，则程序可以缩小为只在该方法中查找错误，使代码更容易调试。\n<font color=##CD000 >\n3-方法是解决一类问题的抽象，一旦写成功就可以重复使用。</font >\n<font color=#999AAA >', 0, '2023-11-07 22:35:09', '2023-11-24 13:35:07');
INSERT INTO `article_detail` VALUES (3, 3, 0, '# Hello Word！\n<font color=#999AAA >没想到吧 数据库的第一行代码竟然是Hello Word!\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n\n<font color=#999AAA >提示：写完文章后，目录可以自动生成，如何生成可参考右边的帮助文档\n\n@[TOC](文章目录)\n\n</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 前言\n\n<font color=#999AAA >提示：这里可以添加本文要记录的大概内容：\n例如：随着人工智能的不断发展，机器学习这门技术也越来越重要，很多人都开启了学习机器学习，本文就介绍了机器学习的基础内容。</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n<font color=#999AAA >提示：以下是本篇文章正文内容，下面案例可供参考\n\n# 一、pandas是什么？\n\n\n<font color=#999AAA >示例：pandas 是基于NumPy 的一种工具，该工具是为了解决数据分析任务而创建的。\n\n\n\n# 二、使用步骤\n## 1.引入库\n\n\n<font color=#999AAA >代码如下（示例）：\n\n\n\n```c\nimport numpy as np\nimport pandas as pd\nimport matplotlib.pyplot as plt\nimport seaborn as sns\nimport warnings\nwarnings.filterwarnings(\'ignore\')\nimport  ssl\nssl._create_default_https_context = ssl._create_unverified_context\n```\n\n## 2.读入数据\n\n<font color=#999AAA >代码如下（示例）：\n\n\n\n```c\ndata = pd.read_csv(\n    \'https://labfile.oss.aliyuncs.com/courses/1283/adult.data.csv\')\nprint(data.head())\n```\n\n\n\n<font color=#999AAA >该处使用的url网络请求的数据。\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 总结\n<font color=#999AAA >提示：这里对文章进行总结：\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了pandas的使用，而pandas提供了大量能使我们快速便捷地处理数据的函数和方法。\n', 0, '2023-11-08 19:37:45', '2023-11-24 13:35:34');
INSERT INTO `article_detail` VALUES (142, 4, 0, '\n\n\n@[TOC](武林秘籍)\n\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 写给有幸得到这本秘籍的人\n\n<font color=#999AAA >此功法是一位魏姓高手留下来的，掌握这八个字即可练习此秘籍！\n欲练此功，必先自。。。\n咳咳！言归正传，学java了，不做个项目怎么行。就好比去当厨师，然而客人要盘蛋炒饭你都做不出来，那怎么能行！带你完成java路上的第一个项目！\n</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n\n\n# 一、项目是什么？\n\n\n<font color=#999AAA >项目啊，简单来说就是甲方爸爸的各种 ~~无脑~~  精妙绝伦的要求，你和你的队友要用一切办法来满足。（除了甲方还有你的上司！）\n</font>\n</font>\n这是对于我一个开发人员来说，只管满足项目经理的需求就行。虽然可能会有五彩斑斓的黑很让人头大。\n\n\n\n\n相信无论学习什么编程语言，第一行代码都是“HelloWord！”\n\n```java\nsystem.out.println(\"HelloWord！\")\n```\njava的第一行代码到写项目距离有多远？\n\n只需要看完这篇，看完就会。\n\n你上你也行！\n\n# 二、拿到项目\n项目，包含需求跟预算等。练手只要看需求就行了。\n\n假设我是程老板，开了一个书店。现在进了很多书需要一个图书管理系统，恰巧被你小王拿到了这个项目。\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n程：我想他有很多功能。\n\n王：请您具体说一下。\n\n程：就是该有的都得有，你明白吧。\n\n王:说实话，不明白。。。\n（打钱中...）\n（钱已到账）\n王：好嘞，懂了程老板！\n\n程：我就想要这个样子的。这里边功能都要实现！\n\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n![在这里插入图片描述](https://img-blog.csdnimg.cn/20201003153435358.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80NDk4MTgyMg==,size_16,color_FFFFFF,t_70#pic_center)\n\n\n\n<hr>\n<hr>\n<hr>\n\n# 三、思路\n<font color=#899rrr >现在需求都拿到了，就可以开始写了。\n不过在写之前都要想好思路，不能边写边改，属实浪费时间。\n## 一，分析\n### 1，主界面\n根据已有信息分析客户需求怎样实现。\n\n图书管理系统，再省不能省界面！先把主界面写出来还是so easy的。\n有很多功能块可以使用switch选择结构。\n\n```java\nScanner input=new Scanner(System.in);\n		System.out.println(\"-----------------------------------------\");\n		System.out.println(\"0.借书排名\");\n		System.out.println(\"1.新增图书\");\n		System.out.println(\"2.查看图书\");\n		System.out.println(\"3.删除图书\");\n		System.out.println(\"4.借出图书\");\n		System.out.println(\"5.归还图书\");\n		System.out.println(\"6.退       出\");\n		System.out.println(\"-----------------------------------------\");\n		System.out.print(\"请选择：\");\n		String choose=input.next();\n```\n<hr>\n主界面把基本信息打印出来就可以了，再写一个switch循环来让用户选择各个功能。\n\n<hr>\n\n### 2，功能块\n\n各个功能之中，重点讲解一下借书功能。\n总所周知，图书馆是干嘛的，有帅气的读者就要说了:“图书馆不是借书的还能干嘛！”这位帅气的观众说的非常对，所以今天就来讲讲借书功能。\n借书本质上就是把一组数的一条数据抽空，那么用java语言来写是什么样呢？\n\n```java\nSystem.out.println(\"请输入要租借的书籍（每日租金0.2元）\");\n		String name=input.next();\n		for (int i = 0; i < book.name.length; i++) {\n			if (book.name[i]!=null) {\n				if (book.name[i].equalsIgnoreCase(name)) {\n					if (book.state[i]==1) {\n						System.out.println(\"借书成功\");\n						book.state[i]=0;//0为该书已借出\n						book.count[i]++;//借出此书次数+1\n						//返回日期，格式是yyyy-mm-dd\n						book.date[i]=formate.format(new Date());\n						//返回年月日\n						ybegin=now.get(Calendar.YEAR);\n						mbegin=now.get(Calendar.MONTH);\n						dbegin=now.get(Calendar.DAY_OF_MONTH);\n						/*返回年月日\n						 * System.out.println(\"年: \" + now.get(Calendar.YEAR)); System.out.println(\"月: \"\n						 * + (now.get(Calendar.MONTH) + 1) + \"\"); System.out.println(\"日: \" +\n						 * now.get(Calendar.DAY_OF_MONTH));\n						 */\n							zhucaidan(); \n					}else {\n					System.out.println(book.name[i]+\"已寄出，无法租借\");\n						jiechu();\n					}\n				}else {\n					continue;\n				}\n			}else {\n				continue;\n			}\n		}\n```\n\n\n# 总结\n<font color=#999AAA >程序员的事情就是把人理解的东西让计算机理解，让计算机能为自己所用，当与计算机合二为一你就成为前无古人后无来者的~~人机！~~ 不对，是优秀的程序员！', 0, '2023-11-23 15:39:17', '2023-11-24 13:36:05');
INSERT INTO `article_detail` VALUES (143, 5, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n# java基础之for循环\n\n\n</font>\n\n@[TOC](文章目录)\n\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 前言\n\n<font color=#999AAA >无论是学java，还是js。有个东西会用到超级超级x100多，那就是今天的主角——for循环！</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n\n\n# 一、for循环基础结构\nfor循环，是java中循环结构的一种。同时是比while更简洁的一种循环结构。\n下面来看一下基本结构：\n用小明当例子\n```java\nfor(int i=0;i<99;i++){\n	System.out.println(\"老师我错了\");\n}\n```\n打印出来就是一百遍\n \n\n<font color=#999AAA >\n\n# 二、使用步骤\n## 1.引入库\n\n\n<font color=#999AAA >代码如下（示例）：\n\n\n\n```c\nimport numpy as np\nimport pandas as pd\nimport matplotlib.pyplot as plt\nimport seaborn as sns\nimport warnings\nwarnings.filterwarnings(\'ignore\')\nimport  ssl\nssl._create_default_https_context = ssl._create_unverified_context\n```\n\n## 2.读入数据\n\n<font color=#999AAA >代码如下（示例）：\n\n\n\n```c\ndata = pd.read_csv(\n    \'https://labfile.oss.aliyuncs.com/courses/1283/adult.data.csv\')\nprint(data.head())\n```\n\n\n\n<font color=#999AAA >该处使用的url网络请求的数据。\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 总结\n<font color=#999AAA >提示：这里对文章进行总结：\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了pandas的使用，而pandas提供了大量能使我们快速便捷地处理数据的函数和方法。\n<font color=#999AAA >提示：这里可以添加系列文章的所有文章的目录，目录需要自己手动添加\n例如：第一章 Python 机器学习入门之pandas的使用\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n\n<font color=#999AAA >提示：写完文章后，目录可以自动生成，如何生成可参考右边的帮助文档\n\n@[TOC](文章目录)\n\n</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 前言\n\n<font color=#999AAA >提示：这里可以添加本文要记录的大概内容：\n例如：随着人工智能的不断发展，机器学习这门技术也越来越重要，很多人都开启了学习机器学习，本文就介绍了机器学习的基础内容。</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n<font color=#999AAA >提示：以下是本篇文章正文内容，下面案例可供参考\n\n# 一、pandas是什么？\n\n\n<font color=#999AAA >示例：pandas 是基于NumPy 的一种工具，该工具是为了解决数据分析任务而创建的。\n\n\n\n# 二、使用步骤\n## 1.引入库\n\n\n<font color=#999AAA >代码如下（示例）：\n\n\n\n```c\nimport numpy as np\nimport pandas as pd\nimport matplotlib.pyplot as plt\nimport seaborn as sns\nimport warnings\nwarnings.filterwarnings(\'ignore\')\nimport  ssl\nssl._create_default_https_context = ssl._create_unverified_context\n```\n\n## 2.读入数据\n\n<font color=#999AAA >代码如下（示例）：\n\n\n\n```c\ndata = pd.read_csv(\n    \'https://labfile.oss.aliyuncs.com/courses/1283/adult.data.csv\')\nprint(data.head())\n```\n\n\n\n<font color=#999AAA >该处使用的url网络请求的数据。\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 总结\n<font color=#999AAA >提示：这里对文章进行总结：\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了pandas的使用，而pandas提供了大量能使我们快速便捷地处理数据的函数和方法。\n', 0, '2023-11-23 18:45:46', '2023-11-24 13:37:01');
INSERT INTO `article_detail` VALUES (144, 6, 0, '#  JAVA--封装\n<font color=#999AAA >结束java基础循环选择之后就要开始接触java核心思想——封装，继承，多态。下面来详细讲解一下封装。\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n\n\n\n@[TOC](文章目录)\n\n</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 前言\n\n<font color=#999AAA >面向对象三大特征之一封装的学习相对简单，希望这篇文章能帮助到在看的你</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n<font color=#999AAA >\n\n# 一、封装是什么？\n\n\n<font color=#999AAA >所谓面向对象编程思想，都跨不过三大特征——封装作为第一个开始学习还是比较容易的。\n_____\n\n## 封装：就是将类的某些信息隐藏在类的内部，不允许外部程序进行直接的访问调用。如果想要访问其中的信息，则需要通过该类提供的方法进行操作\n关键字：private\n\n```java\npublic class Sd {\n	private String name=\"小明\";\n	private int    age=1;\n	//getter/setter方法\n	public String getName() {\n		return name;\n	}\n	public void setName(String name) {\n		this.name = name;\n	}\n	public int getAge() {\n		return age;\n	}\n	public void setAge(int age) {\n		this.age = age;\n	}\n	\n	 void print() {\n		System.out.println(\"我叫\"+this.name+\",年龄是：\"+this.age+\"岁\");\n	}\n}	\n```\n使用此类中的值\n\n```java\npublic class Sdtest {\n	public static void main(String[] args) {\n		Sd sd=new Sd();\n		sd.getName();//获取名字\n		sd.getAge();//获取年龄\n		System.out.println(sd.getName()+sd.getAge());//输出name\n		sd.setName(\"小红\");//重新赋值为小红\n		sd.print();//输出name\n	}\n	\n}\n```\n输出结果为：\n小明1\n我叫小红,年龄是：1岁\n# 二、使用步骤\n## 1.引入库\n\n\n<font color=#999AAA >代码如下（示例）：\n\n\n\n```c\nimport numpy as np\nimport pandas as pd\nimport matplotlib.pyplot as plt\nimport seaborn as sns\nimport warnings\nwarnings.filterwarnings(\'ignore\')\nimport  ssl\nssl._create_default_https_context = ssl._create_unverified_context\n```\n\n## 2.读入数据\n\n<font color=#999AAA >代码如下（示例）：\n\n\n\n```c\ndata = pd.read_csv(\n    \'https://labfile.oss.aliyuncs.com/courses/1283/adult.data.csv\')\nprint(data.head())\n```\n\n\n\n\n\n# 总结\n<font color=#999AAA >封装类中的属性就是将访问修饰符改为private即可完成封装。\n当使用封装之后的对象时要用getter和setter方法来调用。\n', 0, '2023-11-24 13:37:47', '2023-11-24 13:37:47');
INSERT INTO `article_detail` VALUES (145, 7, 0, '\n\n\n</font>\n\n@[TOC](文章目录)\n\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n# 前言\n\n<font color=#999AAA >上篇文章讲了三大特性之———封装，本篇来给大家说一下我自己对于面向对象中继承的理解。</font>\n\n<hr style=\" border:solid; width:100px; height:1px;\" color=#000000 size=1\">\n\n\n\n# 继承的概念\n\n\n首先抛开计算机而言，继承的社会性概念就是一个儿子得到自己父亲的资产。这时儿子就得到了父亲拥有的一切。\n___\n那么在JAVA中的概念就很好理解了，<b>当一个类通过extends继承一个父类之后，那么这个过程称为继承。\n___\n___\n\n```java\n//学生父类\npublic class Stu {\n	private String stuName;//学生姓名\n	private Integer stuId;//学号\n	private Integer stuAge;//学生年龄\n	//构造函数\n	public Stu(String stuName,Integer stuId,Integer stuAge) {\n		this.stuName=stuName;\n		this.stuId=stuId;\n		this.stuAge=stuAge;\n	}\n	void print() {\n		System.out.println(\"我叫\"+stuName+\"，学号是\"+stuId+\"，今年\"+stuAge+\"岁\");\n	}\n}\n```\n编写“小明”这个实体类。\n```java\n//子类\npublic class Ming extends Stu{\n\n	public Ming(String name, int id, int age) {\n		super(name,id,age);\n	}\n	\n}\n```\n使用测试类来看看会发生什么：\n\n```java\npublic class Test {\n	public static void main(String[] args) {\n		Ming stu=new Ming(\"小明\",1901,19);\n		stu.print();\n	}\n}\n```\n输出结果：我叫小明，学号是1901，今年19岁。\n<hr>\n可以看出，在Ming类中没有写输出方法，只是继承了Stu父类。因此继承是可以把父类中的非封装变量，方法都可以继承。\n\n---\n**不可被继承的：父类中被private修饰的变量，构造函数（方法）**\n举个栗子：\n\n```java\n//父类\npublic class Stu {\n	\n	String name=\"小明\";\n	private String namepri=\"小红\";\n	\n	\n	void print() {\n		System.out.println(\"我叫\"+name);\n	}\n}\n//子类\npublic class Ming extends Stu{\n	//继承不重写\n}\n//测试类\npublic class Test {\n	public static void main(String[] args) {\n		Ming stu=new Ming();\n		stu.print();\n	}\n}\n```\n猜猜看输出结果为什么，把结果打在评论区看看你的猜想对不对吧！', 0, '2023-11-24 13:38:25', '2023-11-24 13:38:31');
INSERT INTO `article_detail` VALUES (146, 8, 0, '```java\nclass LaoWang{\n    public void write() {\n        System.out.println(\"《哈利波特》\");\n    }\n}\npublic class XiaoWang extends LaoWang {\n    @Override\n    public void write() {\n        System.out.println(\"《茶花女》\");\n    }\n}\n```\n\n\n\n来写一段测试代码。\n\n```java\npublic class OverridingTest {\n    public static void main(String[] args) {\n        LaoWang wang = new XiaoWang();\n        wang.write();\n    }\n}\n```\n\n\n结果 《茶花女》\n\n\n再来看一段重载的代码吧。\n\n```java\nclass LaoWang{\n    public void read() {\n        System.out.println(\"我在吃饭\");\n    }\n\n    public void read(String a) {\n        System.out.println(a);\n    }\n}\n```\n\n\n\n测试一下\n\n```java\npublic class OverloadingTest {\n    public static void main(String[] args) {\n        LaoWang wang = new LaoWang();\n        wang.read();\n        wang.read(\"他在吃饭\");\n    }\n}\n```\n\n先输出“我在吃饭”；\n后输出“他在吃饭”。\n\n简单的来总结一下：\n\n1）编译器无法决定调用哪个重写的方法，因为只从变量的类型上是无法做出判断的，要在运行时才能决定；但编译器可以明确地知道该调用哪个重载的方法，因为引用类型是确定的，参数个数决定了该调用哪个方法。\n\n2）多态针对的是重写，而不是重载。\n\n\n', 0, '2023-11-24 13:38:25', '2023-11-24 13:38:52');
INSERT INTO `article_detail` VALUES (148, 9, 0, ' 首先我们创建一个动物类,这个动物类也就是所说的父类\n动物共同的特点就是\"吃\",所以说我们在这里写了一个吃的方法\n\n```java\npublic class Animal {\npublic void eat(){\nSystem.out.println(“吃东西”);\n}\n}\n```\n\n定义一个Cat猫类,这个也就是子类,所以说我们要用到关键词extends,\n猫类继承动物类,都有eat\n猫也有自己的特点就是抓老鼠,所以说我在这里也写了一个抓老鼠的方法\n\n```java\npublic class Cat extends Animal{\n@Override\npublic void eat() {\nSystem.out.println(“猫吃鱼”);\n}\n//自己独有的方法\npublic void zhua(){\nSystem.out.println(“猫抓老鼠”);\n}\n}\n```\n\n定义一个Dog狗类,这个也是子类,这个和上面的猫类一样就是名字和方法不一样\n狗类继承动物类,都有eat\n\n```java\npublic class Dog extends Animal {\n@Override\npublic void eat() {\nSystem.out.println(“狗啃骨头”);\n}\n//自己独有的方法\npublic void kan(){\nSystem.out.println(“狗看门”);\n}\n}\n```\n\n④最后我们写一个测试类,测试这猫和狗是否继承了动物类\n\n```java\npublic class Test {\npublic static void main(String[] args) {\n//创建一个猫的对象\nAnimal a = new Cat();\na.eat();\n((Cat) a).zhua();\n//创建一个狗的对象\nAnimal b = new Dog();\nb.eat();\n((Dog) b).kan();\n}\n}\n```\n这俩执行完输出的结果是它们各自的方法\n即：\n猫吃鱼\n猫抓老鼠\n\n狗看门 \n狗啃骨头', 0, '2023-11-24 13:40:22', '2023-11-24 13:40:22');
INSERT INTO `article_detail` VALUES (149, 863819785, 0, '# MYSQL基本语法\r\n## 准备工作\r\n先创建一张表\r\n\r\n```sql\r\nCREATE TABLE `user` (\r\n  `uID` int(11) NOT NULL,\r\n  `uName` varchar(255) DEFAULT NULL,\r\n  `uPwd` varchar(255) DEFAULT NULL,\r\n  PRIMARY KEY (`uID`)\r\n)\r\n```\r\n![初始表](https://img-blog.csdnimg.cn/20201214081237314.png)\r\n## 下面进行新增、修改、删除。\r\n```sql\r\nINSERT INTO user(uID,uName,uPwd) VALUES(\'5\',\'周\',\'5\');\r\n```\r\n表示新增一条数据id为5，name为‘周’，pwd为5.\r\n## 修改\r\n\r\n```sql\r\n UPDATE user SET uPwd=\'123456\' WHERE uName=\'周\';\r\n\r\n UPDATE user  SET uPwd=\'123456\'；\r\n\r\n```\r\n第一条为筛选uName字段中为 周 的对应的uPwd的值改为123456\r\n\r\n第二条则将所有uPwd的字段中的值改为123456\r\n\r\n## 删除\r\n\r\n```sql\r\nDELETE from user WHERE uName=\'周\';\r\n```\r\n删除user 表中的字段uName的值为周的\r\n\r\n# MYSQL基本语法\r\n## 准备工作\r\n先创建一张表\r\n\r\n```sql\r\nCREATE TABLE `user` (\r\n  `uID` int(11) NOT NULL,\r\n  `uName` varchar(255) DEFAULT NULL,\r\n  `uPwd` varchar(255) DEFAULT NULL,\r\n  PRIMARY KEY (`uID`)\r\n)\r\n```\r\n![初始表](https://img-blog.csdnimg.cn/20201214081237314.png)\r\n## 下面进行新增、修改、删除。\r\n```sql\r\nINSERT INTO user(uID,uName,uPwd) VALUES(\'5\',\'周\',\'5\');\r\n```\r\n表示新增一条数据id为5，name为‘周’，pwd为5.\r\n## 修改\r\n\r\n```sql\r\n UPDATE user SET uPwd=\'123456\' WHERE uName=\'周\';\r\n\r\n UPDATE user  SET uPwd=\'123456\'；\r\n\r\n```\r\n第一条为筛选uName字段中为 周 的对应的uPwd的值改为123456\r\n\r\n第二条则将所有uPwd的字段中的值改为123456\r\n\r\n## 删除\r\n\r\n```sql\r\nDELETE from user WHERE uName=\'周\';\r\n```\r\n删除user 表中的字段uName的值为周的\r\n\r\n', 0, '2023-11-24 13:47:34', '2023-11-24 15:03:54');
INSERT INTO `article_detail` VALUES (150, 863965219, 0, ' 首先我们创建一个动物类,这个动物类也就是所说的父类\r\n动物共同的特点就是\"吃\",所以说我们在这里写了一个吃的方法\r\n\r\n```java\r\npublic class Animal {\r\npublic void eat(){\r\nSystem.out.println(“吃东西”);\r\n}\r\n}\r\n```\r\n\r\n定义一个Cat猫类,这个也就是子类,所以说我们要用到关键词extends,\r\n猫类继承动物类,都有eat\r\n猫也有自己的特点就是抓老鼠,所以说我在这里也写了一个抓老鼠的方法\r\n\r\n```java\r\npublic class Cat extends Animal{\r\n@Override\r\npublic void eat() {\r\nSystem.out.println(“猫吃鱼”);\r\n}\r\n//自己独有的方法\r\npublic void zhua(){\r\nSystem.out.println(“猫抓老鼠”);\r\n}\r\n}\r\n```\r\n\r\n定义一个Dog狗类,这个也是子类,这个和上面的猫类一样就是名字和方法不一样\r\n狗类继承动物类,都有eat\r\n\r\n```java\r\npublic class Dog extends Animal {\r\n@Override\r\npublic void eat() {\r\nSystem.out.println(“狗啃骨头”);\r\n}\r\n//自己独有的方法\r\npublic void kan(){\r\nSystem.out.println(“狗看门”);\r\n}\r\n}\r\n```\r\n\r\n④最后我们写一个测试类,测试这猫和狗是否继承了动物类\r\n\r\n```java\r\npublic class Test {\r\npublic static void main(String[] args) {\r\n//创建一个猫的对象\r\nAnimal a = new Cat();\r\na.eat();\r\n((Cat) a).zhua();\r\n//创建一个狗的对象\r\nAnimal b = new Dog();\r\nb.eat();\r\n((Dog) b).kan();\r\n}\r\n}\r\n```\r\n这俩执行完输出的结果是它们各自的方法\r\n即：\r\n猫吃鱼\r\n猫抓老鼠\r\n\r\n狗看门 \r\n狗啃骨头', 0, '2023-11-24 14:01:34', '2023-11-24 14:01:34');
INSERT INTO `article_detail` VALUES (151, 864389776, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-11-26 22:15:39', '2023-11-26 22:15:39');
INSERT INTO `article_detail` VALUES (152, 864390124, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-11-26 22:18:25', '2023-11-26 22:18:25');
INSERT INTO `article_detail` VALUES (153, 864391178, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-11-26 22:26:47', '2023-11-26 22:26:47');
INSERT INTO `article_detail` VALUES (154, 864391540, 0, '啦啦啦', 0, '2023-11-26 22:29:40', '2023-11-26 22:29:40');
INSERT INTO `article_detail` VALUES (155, 864392154, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-11-26 22:34:33', '2023-11-26 22:34:33');
INSERT INTO `article_detail` VALUES (156, 864392168, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-11-26 22:34:39', '2023-11-26 22:34:39');
INSERT INTO `article_detail` VALUES (157, 864392245, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-11-26 22:35:16', '2023-11-26 22:35:16');
INSERT INTO `article_detail` VALUES (158, 864393755, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-11-26 22:47:16', '2023-11-26 22:47:16');
INSERT INTO `article_detail` VALUES (159, 867301667, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-12-12 23:57:17', '2023-12-12 23:57:17');
INSERT INTO `article_detail` VALUES (160, 867301721, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-12-12 23:57:42', '2023-12-12 23:57:42');
INSERT INTO `article_detail` VALUES (161, 867302949, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-12-13 00:07:28', '2023-12-13 00:07:28');
INSERT INTO `article_detail` VALUES (162, 867304770, 0, '---\r\n\r\n# 前言\r\n`提示：这里可以添加本文要记录的大概内容：`\r\n\r\n---\r\n\r\n`提示：以下是本篇文章正文内容，下面案例可供参考`\r\n\r\n# 一、java是什么？\r\n示例：ava 是一种广泛使用的、面向对象的、跨平台的编程语言。它最初由Sun Microsystems（后被Oracle收购）的James Gosling等人开发，并于1995年正式推出。\r\n\r\n# 二、使用步骤\r\n## 1.下载并配置环境\r\n\r\n## 2.hello world\r\n代码如下（示例）：\r\n```\r\npublic class First(){\r\n    public static void main(String[] args){\r\n        Syetem.out.println(\"helloword!\")\r\n    }\r\n}\r\n```\r\n\r\n---\r\n\r\n# 总结\r\n提示：这里对文章进行总结：\r\n例如：以上就是今天要讲的内容，本文仅仅简单介绍了Java的示例，而Java提供了很多常用工具库。\r\n                ', 0, '2023-12-13 00:21:56', '2023-12-13 00:21:56');

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` int UNSIGNED NOT NULL COMMENT '文章ID',
  `tag_id` int UNSIGNED NOT NULL COMMENT '标签ID',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `文章详情`(`article_id` ASC) USING BTREE,
  INDEX `tag对应id`(`tag_id` ASC) USING BTREE,
  CONSTRAINT `tag对应id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `文章详情` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '标签与对应文章表，单独分离出来更好管理与应用' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_tag
-- ----------------------------
INSERT INTO `article_tag` VALUES (1, 1, 1, 0, '2023-11-07 22:36:05', '2023-11-07 22:36:05');
INSERT INTO `article_tag` VALUES (2, 1, 2, 0, '2023-11-07 22:36:19', '2023-11-07 22:36:19');
INSERT INTO `article_tag` VALUES (3, 1, 2, 0, '2023-11-07 22:36:35', '2023-11-08 19:56:30');
INSERT INTO `article_tag` VALUES (4, 2, 1, 0, '2023-11-24 16:04:54', '2023-11-24 16:04:54');
INSERT INTO `article_tag` VALUES (5, 2, 2, 0, '2023-11-24 16:04:59', '2023-11-24 16:04:59');
INSERT INTO `article_tag` VALUES (6, 2, 3, 0, '2023-11-24 16:05:02', '2023-11-24 16:05:02');
INSERT INTO `article_tag` VALUES (7, 2, 4, 0, '2023-11-24 16:05:06', '2023-11-24 16:05:06');
INSERT INTO `article_tag` VALUES (8, 2, 5, 0, '2023-11-24 16:05:14', '2023-11-24 16:05:14');
INSERT INTO `article_tag` VALUES (9, 864393145, 1, 0, '2023-11-26 22:42:25', '2023-11-26 22:42:25');
INSERT INTO `article_tag` VALUES (10, 864393755, 1, 0, '2023-11-26 22:47:16', '2023-11-26 22:47:16');
INSERT INTO `article_tag` VALUES (11, 864393755, 2, 0, '2023-11-26 22:47:16', '2023-11-26 22:47:16');
INSERT INTO `article_tag` VALUES (12, 864393755, 3, 0, '2023-11-26 22:47:16', '2023-11-26 22:47:16');
INSERT INTO `article_tag` VALUES (13, 864393755, 4, 0, '2023-11-26 22:47:16', '2023-11-26 22:47:16');
INSERT INTO `article_tag` VALUES (14, 864393755, 5, 0, '2023-11-26 22:47:16', '2023-11-26 22:47:16');
INSERT INTO `article_tag` VALUES (15, 864393755, 6, 0, '2023-11-26 22:47:16', '2023-11-26 22:47:16');
INSERT INTO `article_tag` VALUES (16, 867301667, 1, 0, '2023-12-12 23:57:17', '2023-12-12 23:57:17');
INSERT INTO `article_tag` VALUES (17, 867301667, 2, 0, '2023-12-12 23:57:17', '2023-12-12 23:57:17');
INSERT INTO `article_tag` VALUES (18, 867301667, 3, 0, '2023-12-12 23:57:17', '2023-12-12 23:57:17');
INSERT INTO `article_tag` VALUES (19, 867301721, 1, 0, '2023-12-12 23:57:42', '2023-12-12 23:57:42');
INSERT INTO `article_tag` VALUES (20, 867301721, 2, 0, '2023-12-12 23:57:42', '2023-12-12 23:57:42');
INSERT INTO `article_tag` VALUES (21, 867301721, 3, 0, '2023-12-12 23:57:42', '2023-12-12 23:57:42');
INSERT INTO `article_tag` VALUES (22, 867302949, 1, 0, '2023-12-13 00:07:28', '2023-12-13 00:07:28');
INSERT INTO `article_tag` VALUES (23, 867304770, 1, 0, '2023-12-13 00:21:56', '2023-12-13 00:21:56');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类目名称',
  `status` tinyint UNSIGNED NOT NULL COMMENT '状态：0-未发布，1-已发布',
  `rank` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除：0-未删除，1-已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '类目表，一个文章仅可拥有一个类目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '测试', 1, 1, 0, '2023-11-07 22:29:48', '2023-11-07 22:29:48');
INSERT INTO `category` VALUES (2, '前端', 1, 1, 0, '2023-11-07 22:37:05', '2023-11-29 15:31:17');
INSERT INTO `category` VALUES (3, '后端', 1, 1, 0, '2023-11-15 20:09:19', '2023-11-29 15:31:21');
INSERT INTO `category` VALUES (4, '经验', 1, 1, 0, '2023-11-15 20:09:31', '2023-11-29 15:31:27');
INSERT INTO `category` VALUES (5, '考研', 1, 1, 0, '2023-11-15 20:09:57', '2023-11-15 20:09:57');
INSERT INTO `category` VALUES (6, '考公', 1, 1, 0, '2023-11-15 20:10:10', '2023-11-15 20:10:10');
INSERT INTO `category` VALUES (7, '大数据', 1, 1, 0, '2023-11-21 23:11:52', '2023-11-21 23:11:52');
INSERT INTO `category` VALUES (8, '人工智能', 1, 1, 0, '2023-11-21 23:12:01', '2023-11-21 23:12:01');
INSERT INTO `category` VALUES (9, 'AI', 1, 1, 0, '2023-11-21 23:12:32', '2023-11-21 23:12:32');
INSERT INTO `category` VALUES (10, '嵌入式', 1, 1, 0, '2023-11-21 23:13:05', '2023-11-21 23:13:05');
INSERT INTO `category` VALUES (11, '新手入门', 1, 1, 0, '2023-11-29 15:44:03', '2023-11-29 15:44:03');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` int UNSIGNED NOT NULL COMMENT '文章ID',
  `user_id` int UNSIGNED NOT NULL COMMENT '用户id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT ' ' COMMENT '评论内容',
  `top_comment_id` int NOT NULL DEFAULT 0 COMMENT '顶级评论',
  `parent_comment_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '父评论ID',
  `deleted` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `article_id`(`article_id` ASC) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 1, ' 这是测试一条评论是否正常', 0, 0, 0, '2023-11-09 13:59:30', '2023-11-09 13:59:30');
INSERT INTO `comment` VALUES (2, 1, 2, '我来看一下你的这条评论成立吗', 0, 1, 0, '2023-11-25 22:29:19', '2023-11-25 22:29:19');
INSERT INTO `comment` VALUES (3, 863819785, 1, '这是一级评论，直接评论文章的', 0, 0, 0, '2023-11-26 00:11:34', '2023-11-27 14:09:20');
INSERT INTO `comment` VALUES (4, 863819785, 2, '这是二级评论', 0, 3, 0, '2023-11-26 00:12:27', '2023-11-27 14:09:49');
INSERT INTO `comment` VALUES (5, 863819785, 3, '三级评论', 0, 4, 0, '2023-11-26 22:54:18', '2023-11-27 19:28:10');
INSERT INTO `comment` VALUES (6, 863819785, 4, '回复动感光波1', 0, 66, 0, '2023-11-27 12:13:26', '2023-11-27 18:30:43');
INSERT INTO `comment` VALUES (66, 863819785, 11, '这是一级评论，直接评论文章的', 0, 0, 0, '2023-11-26 00:11:34', '2023-11-27 16:44:40');
INSERT INTO `comment` VALUES (67, 863819785, 8, '这是一级评论，直接评论文章的', 0, 0, 0, '2023-11-26 00:11:34', '2023-11-27 16:44:40');

-- ----------------------------
-- Table structure for like
-- ----------------------------
DROP TABLE IF EXISTS `like`;
CREATE TABLE `like`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '点赞id',
  `user_id` int UNSIGNED NOT NULL COMMENT '动作发起者',
  `operation_obj` int NOT NULL COMMENT '被点赞对象id',
  `type` tinyint NOT NULL COMMENT '被点赞类型：0-文章，1-评论',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态：0-已点赞，1-已取消',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of like
-- ----------------------------
INSERT INTO `like` VALUES (1, 1, 1, 0, 0, '2023-11-09 15:23:44', '2023-11-09 15:23:44');
INSERT INTO `like` VALUES (2, 2, 1, 0, 0, '2023-11-27 21:55:50', '2023-11-27 21:55:50');
INSERT INTO `like` VALUES (3, 1, 863819785, 0, 0, '2023-11-27 22:04:39', '2023-11-27 22:04:39');

-- ----------------------------
-- Table structure for recommended
-- ----------------------------
DROP TABLE IF EXISTS `recommended`;
CREATE TABLE `recommended`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL COMMENT '上推荐文章id',
  `type` tinyint UNSIGNED NOT NULL COMMENT '推荐位置，首页区域，从上往下，从左往右的优先顺序，五个区域1~5',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recommended
-- ----------------------------
INSERT INTO `recommended` VALUES (1, 863819785, 1, 0, '2023-11-15 20:32:57', '2023-11-23 22:16:45');
INSERT INTO `recommended` VALUES (2, 2, 1, 0, '2023-11-15 20:33:10', '2023-11-15 20:33:10');
INSERT INTO `recommended` VALUES (3, 3, 1, 0, '2023-11-15 20:33:14', '2023-11-15 20:33:14');
INSERT INTO `recommended` VALUES (4, 4, 1, 0, '2023-11-15 20:33:18', '2023-11-15 20:33:18');
INSERT INTO `recommended` VALUES (5, 4, 2, 0, '2023-11-16 21:54:57', '2023-11-16 21:54:57');
INSERT INTO `recommended` VALUES (6, 5, 2, 0, '2023-11-16 21:55:10', '2023-11-16 21:55:10');
INSERT INTO `recommended` VALUES (7, 6, 2, 0, '2023-11-16 21:55:15', '2023-11-16 21:55:17');
INSERT INTO `recommended` VALUES (8, 7, 2, 0, '2023-11-16 21:55:25', '2023-11-16 21:55:25');
INSERT INTO `recommended` VALUES (9, 1, 3, 0, '2023-11-16 23:21:10', '2023-11-16 23:21:10');
INSERT INTO `recommended` VALUES (10, 2, 3, 0, '2023-11-16 23:21:15', '2023-11-17 14:26:17');
INSERT INTO `recommended` VALUES (11, 3, 3, 0, '2023-11-16 23:21:21', '2023-11-17 14:54:39');
INSERT INTO `recommended` VALUES (12, 4, 3, 0, '2023-11-16 23:21:26', '2023-11-17 14:54:40');
INSERT INTO `recommended` VALUES (14, 5, 3, 0, '2023-11-16 23:21:57', '2023-11-17 14:54:41');
INSERT INTO `recommended` VALUES (15, 6, 3, 0, '2023-11-16 23:39:25', '2023-11-17 14:54:43');
INSERT INTO `recommended` VALUES (16, 4, 4, 0, '2023-11-17 00:32:44', '2023-11-17 00:32:44');
INSERT INTO `recommended` VALUES (17, 4, 4, 0, '2023-11-17 00:32:47', '2023-11-17 00:32:47');
INSERT INTO `recommended` VALUES (18, 4, 4, 0, '2023-11-17 00:32:52', '2023-11-17 00:32:52');
INSERT INTO `recommended` VALUES (19, 1, 4, 0, '2023-11-17 00:32:58', '2023-11-17 00:32:58');
INSERT INTO `recommended` VALUES (20, 5, 1, 0, '2023-11-17 15:35:41', '2023-11-17 15:35:41');
INSERT INTO `recommended` VALUES (21, 6, 1, 0, '2023-11-17 15:35:47', '2023-11-17 15:35:47');
INSERT INTO `recommended` VALUES (22, 1, 5, 0, '2023-11-17 20:42:20', '2023-11-17 20:42:20');
INSERT INTO `recommended` VALUES (23, 2, 5, 0, '2023-11-17 20:42:23', '2023-11-17 20:42:23');
INSERT INTO `recommended` VALUES (24, 3, 5, 0, '2023-11-17 20:42:26', '2023-11-17 20:42:26');
INSERT INTO `recommended` VALUES (25, 4, 5, 0, '2023-11-17 20:42:30', '2023-11-17 20:42:30');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `tag_type` tinyint UNSIGNED NOT NULL COMMENT '标签类型：1-系统标签，2-自定义标签',
  `category_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '类目ID',
  `status` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态：0-未发布，1-已发布',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `类目对应id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `类目对应id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'tag，标签表，一篇文章可拥有多个tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '自测', 1, 1, 1, 0, '2023-11-07 22:37:59', '2023-11-07 22:37:59');
INSERT INTO `tag` VALUES (2, '后端', 1, 2, 1, 0, '2023-11-08 19:54:43', '2023-11-08 19:54:43');
INSERT INTO `tag` VALUES (3, '新手', 1, 3, 0, 0, '2023-11-21 23:10:35', '2023-11-21 23:10:35');
INSERT INTO `tag` VALUES (4, '入门', 1, 4, 0, 0, '2023-11-21 23:10:51', '2023-11-21 23:10:51');
INSERT INTO `tag` VALUES (5, '教程', 1, 1, 0, 0, '2023-11-21 23:11:05', '2023-11-21 23:11:05');
INSERT INTO `tag` VALUES (6, '个人博客', 1, 1, 0, 0, '2023-11-21 23:11:24', '2023-11-21 23:11:24');

-- ----------------------------
-- Table structure for user_foot
-- ----------------------------
DROP TABLE IF EXISTS `user_foot`;
CREATE TABLE `user_foot`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `document_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '文档ID（文章/评论）',
  `document_type` tinyint NOT NULL DEFAULT 1 COMMENT '文档类型：1-文章，2-评论',
  `document_user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '发布该文档的用户ID',
  `collection_stat` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏状态: 0-未收藏，1-已收藏，2-取消收藏',
  `read_stat` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '阅读状态: 0-未读，1-已读',
  `comment_stat` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论状态: 0-未评论，1-已评论，2-删除评论',
  `praise_stat` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞状态: 0-未点赞，1-已点赞，2-取消点赞',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_doucument`(`user_id` ASC, `document_id` ASC, `document_type` ASC) USING BTREE,
  INDEX `idx_doucument_id`(`document_id` ASC) USING BTREE,
  CONSTRAINT `user_foot_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户足迹表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_foot
-- ----------------------------
INSERT INTO `user_foot` VALUES (1, 1, 0, 1, 0, 0, 0, 0, 0, '2023-11-09 14:53:37', '2023-11-09 14:53:37');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '绑定邮箱',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户密码',
  `type` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '0 管理员， 1 用户 ， 2 游客',
  `person_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '橙子派momo' COMMENT '个人昵称',
  `profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '这个人很懒，什么都没有' COMMENT '个人简介',
  `deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除：0 未删除；1 已删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  `head_photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'exmaple@123.com', 'admin', '871b6b1d9016daf15de75f7a85df2256', 1, '管理员', '这个人很懒，什么都没有', 0, '2023-11-07 20:21:18', '2023-11-17 21:20:38', 'default.jpg');
INSERT INTO `user_info` VALUES (2, 'exmaple@123.com', 'cdd01', '871b6b1d9016daf15de75f7a85df2256', 0, '一只善良的小草神', '这个人很懒，什么都没有', 0, '2023-11-07 20:24:05', '2023-11-17 21:20:40', 'default.jpg');
INSERT INTO `user_info` VALUES (3, 'exmaple@123.com', 'cdd02', '871b6b1d9016daf15de75f7a85df2256', 0, '村花点点点', '这个人很懒，什么都没有', 0, '2023-11-07 20:25:52', '2023-11-17 21:20:41', 'default.jpg');
INSERT INTO `user_info` VALUES (4, 'exmaple@123.com', 'cdd03', '871b6b1d9016daf15de75f7a85df2256', 1, '橙子派momo', '这个人很懒，什么都没有', 0, '2023-11-09 14:27:13', '2023-11-17 21:20:43', 'default.jpg');
INSERT INTO `user_info` VALUES (8, 'hr@monetwware.com', '1234', '2cfbc079ee014b7c0180782f867c307d', 1, '橙子派momo', '这个人很懒，什么都没有', 0, '2023-11-17 22:35:15', '2023-11-17 22:35:15', 'default.jpg');
INSERT INTO `user_info` VALUES (10, '1271544179@qq.com', 'xiaofan123', 'ddb89fb2b09f2dfcba17ba41a6fa81f0', 1, '橙子派momo', '这个人很懒，什么都没有', 0, '2023-11-17 23:19:45', '2023-11-17 23:19:45', 'default.jpg');
INSERT INTO `user_info` VALUES (11, '127123456@qq.com', 'cdd001', '871b6b1d9016daf15de75f7a85df2256', 1, '动感光波001', '这个人很懒，什么都没有', 0, '2023-11-21 23:27:30', '2023-11-27 16:44:15', 'default.jpg');

SET FOREIGN_KEY_CHECKS = 1;
