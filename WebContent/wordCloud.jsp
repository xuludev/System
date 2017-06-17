<%@page import="utilize.ConstantPath"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page errorPage="page-404.jsp"%>
<%@ page
	import="utilize.TagCloud,java.io.BufferedReader,java.io.File,java.io.FileNotFoundException,java.io.FileReader,java.io.IOException"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>标签云</title>
<meta name="Keywords" content="标签云" />
<meta name="description" content="标签云" />
<link href="favicon.ico" rel="shortcut icon" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/icomoon-social.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/leaflet.css" />
<link rel="stylesheet" href="css/main.css">
<link href="favicon.ico" rel="shortcut icon" />

<script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="js/utilize.js"></script>

<style type="text/css">
body {
	background: #24313d;
}

#tagsList {
	position: relative;
	width: 600px;
	height: 480px;
	margin: 10px auto 0;
}

#tagsList a {
	position: absolute;
	top: 0px;
	left: 0px;
	font-family: Microsoft YaHei;
	color: #fff;
	font-weight: bold;
	text-decoration: none;
	padding: 3px 6px;
}

#tagsList a:hover {
	color: #FF0000;
	letter-spacing: 2px;
}

h2:hover {
	color: pink;
}

h2 {
	color: white;
	text-align: center;
	font-family: "微软雅黑";
}
</style>
<script type="text/javascript" src="tags.js"></script>
<script src="js/bootstrap.min.js"></script>
<link href="css/bootstrap.min.css" />
</head>

<body>
	<h2>热词标签云</h2>

	<div align="center" style="margin-top: 0">
		<button type="button" class="btn btn-default">
			<a href="index.jsp"
				style="text-decoration: none; width: 70px; color: white">回到主页</a>
		</button>
		&nbsp;
		<button type="button" class="btn btn-default">
			<a href="allwords.html"
				style="text-decoration: none; width: 70px; color: white">所有词云</a>
		</button>
	</div>
	<div id="tagsList">
		<%
			String[] words = TagCloud
					.getWord(ConstantPath.KeyWordSetPath);
			for (int i = 0; i < 10; i++) {
				out.print("<a target='_new' href='https://www.baidu.com/s?wd=");
		%>

		<%
			out.print(words[i] + "'>");
		%>

		<%
			out.print(words[i] + "</a>");
			}
		%>

	</div>
	<div class="col-md-12">
		<div class="footer-copyright">&copy; 2017 XuLu. All rights
			reserved.</div>
	</div>
</body>

</html>