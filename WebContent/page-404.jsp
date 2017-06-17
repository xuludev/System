<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>404 Not Found ...</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/icomoon-social.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/leaflet.css" />
<!--[if lte IE 8]>
		    <link rel="stylesheet" href="css/leaflet.ie.css" />
		<![endif]-->
<link rel="stylesheet" href="css/main.css">
<link href="favicon.ico" rel="shortcut icon" />

<script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
</head>

<body>
	<!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

	<!-- Navigation & Logo-->
	<div class="mainmenu-wrapper">
		<div class="container">
			<div class="menuextras">
				<div class="extras"></div>
			</div>
			<div>
				<nav id="mainmenu" class="mainmenu">
					<ul>
						<li class="logo-wrapper"><a href="index.jsp"> <img
								src="img/mPurpose-logo.png"
								alt="Multipurpose Twitter Bootstrap Template">
						</a></li>
						<li><a href="index.jsp">主页</a></li>
						<li><a href="features.html">介绍</a></li>
						<li class="has-submenu active"><a href="#">功能</a>
							<div class="mainmenu-submenu">
								<div class="mainmenu-submenu-inner">
									<div>
										<h4>数据获取</h4>
										<ul>
											<li><a href="servlet/SinaServlet" target="_blank"
												onclick="alert('正在爬取，请稍后...')">新浪新闻</a></li>
											<li><a href="#" onclick="alert('请稍后...')">腾讯微博</a></li>
											<li><a href="#" onclick="alert('敬请期待')">新浪微博</a></li>
										</ul>
										<h4>T-Single Pass增量聚类</h4>
										<ul>
											<li><a href="servlet/ClusterServlet"
												onclick="alert('正在计算，请稍后...')">Start Clustering</a></li>
										</ul>
										<h4>舆情预警</h4>
										<ul>
											<li><a href="eCharts.jsp" target="_blank"
												onclick="alert('请查看ClusterFiles文件夹')">查看聚类文件</a></li>
											<li><a href="wordCloud.jsp" target="_blank">生成标签云</a></li>
											<li><a href="d3.jsp">热点话题排序</a></li>
										</ul>
									</div>
									<!-- /mainmenu-submenu-inner -->
								</div>
								<!-- /mainmenu-submenu --></li>
						<li><a href="credits.html">关于</a></li>
					</ul>
				</nav>
			</div>
		</div>

		<!-- Page Title -->
		<div class="section section-breadcrumbs">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>Page Not Found...</h1>
					</div>
				</div>
			</div>
		</div>

		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="error-page-wrapper">
							<p>对不起，您要查找的页面好像去了火星 /(ㄒoㄒ)/~~...</p>
							<p>
								来，跟我一起回到 <a href="index.jsp">主页</a> ?
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
		<div class="footer">
			<div class="container">
				<div class="row">
					<div class="col-footer col-md-3 col-xs-6">
						<h3>最新进展</h3>
						<div class="portfolio-item">
							<div class="portfolio-image">
								<a href="latestwork.html" target="_blank"> <img
									src="img/zxjz.jpg" alt="最新进展">
								</a>
							</div>
						</div>
					</div>
					<div class="col-footer col-md-3 col-xs-6">
						<h3>数据分析</h3>
						<ul class="no-list-style footer-navigate-section">
							<li><a href="http://index.baidu.com" target="_blank">百度指数</a>
							</li>
							<li><a href="http://weiboreach.com/zhiwei/" target="_blank">知微</a>
							</li>
							<li><a href="http://shu.taobao.com/" target="_blank">淘宝指数</a>
							</li>
							<li><a href="http://index.youku.com/" target="_blank">优酷指数</a>
							</li>
							<li><a href="http://data.weibo.com/index/" target="_blank">微博指数</a>
							</li>
							<li><a href="http://www.weizhishu.com/" target="_blank">微信指数</a>
							</li>
						</ul>
					</div>

					<div class="col-footer col-md-4 col-xs-6">
						<h3>联系我吧</h3>
						<p class="contact-us-details">
							<b>Address:</b>武汉市洪山区, 李纸路徐家墩,湖北工业大学, 经济与管理学院, 11信管, 徐璐 <br /> <b>Phone:</b>13207145966
							<br /> <b>QQ:</b> 249048056 <br /> <b>微信:</b> xulu0620 <br />
							<b>Email:</b> <a href="mailto:249048056@qq.com">249048056@qq.com</a>
						</p>
					</div>
					<div class="col-footer col-md-2 col-xs-6">
						<h3>数据来源</h3>
						<ul class="footer-stay-connected no-list-style">
							<li><a href="http://t.qq.com" target="_blank"
								class="facebook"></a></li>
							<li><a href="http://bbs.tianya.cn/" target="_blank"
								class="twitter"></a></li>
							<li><a href="http://news.sina.com.cn/" target="_blank"
								class="googleplus"></a></li>
						</ul>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="footer-copyright">&copy; 2017 XuLu. All rights
							reserved.</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Javascripts -->
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/jquery-1.9.1.min.js"><\/script>')
	</script>
	<script src="js/bootstrap.min.js"></script>
	<script src="http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js"></script>
	<script src="js/jquery.fitvids.js"></script>
	<script src="js/jquery.sequence-min.js"></script>
	<script src="js/jquery.bxslider.js"></script>
	<script src="js/main-menu.js"></script>
	<script src="js/template.js"></script>

</body>

</html>