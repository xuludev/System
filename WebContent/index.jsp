<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.xulu.main.*,tsinglepass.*"%>
<%@ page
	import="java.io.File,java.util.ArrayList,java.util.Arrays,java.util.HashMap,java.util.Iterator,java.util.Map"%>
<%@ page errorPage="page-404.jsp"%>
<!DOCTYPE html>
<html class="no-js">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>网络热点发现可视化系统</title>
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
<script src="js/utilize.js"></script>

</head>

<body>
	<!--[if lt IE 7]>
            <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
        <![endif]-->

	<!-- Navigation & Logo-->
	<div class="mainmenu-wrapper">
		<div class="container">
			<div class="menuextras">
				<div class="extras">
					<ul
						style="margin-top: 45px; margin-right: 0px; background-color: #C0A16B;">
						<li><a href="page-login.jsp" style="color: #FFFFFF;">&nbsp;&nbsp;登录&nbsp;&nbsp;</a>
						</li>
					</ul>
				</div>
			</div>
			<nav id="mainmenu" class="mainmenu">
				<ul>
					<li class="logo-wrapper"><a href="index.jsp"> <img
							src="img/mPurpose-logo.png" alt="网络舆情预警信息系统">
					</a></li>
					<li class="active"><a href="index.jsp">主页</a></li>
					<li><a href="features.html">介绍</a></li>
					<li class="has-submenu"><a href="#">功能</a>
						<div class="mainmenu-submenu">
							<div class="mainmenu-submenu-inner">
								<div>
									<h4>数据获取</h4>
									<ul>
										<li><a href="servlet/SinaServlet" target="_blank"
											onclick="alert('正在爬取，请稍后...')">新浪新闻</a></li>
										<li><a href="#" onclick="alert('敬请期待...')">腾讯微博</a></li>
										<li><a href="#" onclick="alert('敬请期待...')">新浪微博</a></li>
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
							</div>
							<!-- /mainmenu-submenu --></li>
					<li><a href="credits.html">关于</a></li>

					<!-- Black Tech -->
					<li class="has-submenu"><a href="#"
						onclick="this.style.cssText='background:grey'"
						onmouseout="this.style.cssText='background:none;color:grey'">Developers</a>
						<div class="mainmenu-submenu" style="background-color: gray;">
							<div class="mainmenu-submenu-inner">
								<div>
									<h4 style="color: white; font-family: '微软雅黑';">Clustering
										Analysis</h4>
									<ul>
										<li><a href="servlet/WekaServlet"
											style="color: white; background: none;">Simple K-Means</a></li>
										<li><a href="servlet/WekaServlet"
											style="color: white; background: none;">XMeans</a></li>
									</ul>
									<h4 style="color: white; font-family: '微软雅黑';">Associating
										Analysis</h4>
									<ul>
										<li><a href="servlet/WekaServlet"
											style="color: white; background: none;">Aporior Algorithm</a></li>
									</ul>
									<h4 style="color: white; font-family: '微软雅黑';">Data
										Visualize</h4>
									<ul>
										<li><a href="eCharts.jsp" target="_blank"
											style="color: white; background: none;">Table Powered by
												eCharts</a></li>
										<li><a href="wordCloud.jsp" target="_blank"
											style="color: white; background: none;">Tag Cloud</a></li>
										<li><a href="#" style="color: white; background: none;">Python
												Resource</a></li>
									</ul>
								</div>
							</div>
							<!-- /mainmenu-submenu --></li>

				</ul>
			</nav>
		</div>
	</div>

	<!-- Homepage Slider -->
	<div class="homepage-slider">
		<div id="sequence">
			<ul class="sequence-canvas">
				<!-- Slide 1 -->
				<li class="bg4">
					<!-- Slide Title -->
					<h2 class="title">更新摘要</h2> <!-- Slide Text -->
					<h3 class="subtitle">基于时间序列的增量聚类算法</h3> <!-- Slide Image --> <img
					class="slide-img" src="img/homepage-slider/slide1.png"
					alt="Slide 1" />
				</li>
				<!-- End Slide 1 -->
				<!-- Slide 2 -->
				<li class="bg3">
					<!-- Slide Title -->
					<h2 class="title">IMIS of HBUT</h2> <!-- Slide Text -->
					<h3 class="subtitle">网络热点发现系统V1.0.1</h3> <!-- Slide Image --> <img
					class="slide-img" src="img/homepage-slider/slide2.png"
					alt="Slide 2" />
				</li>
				<!-- End Slide 2 -->
				<!-- Slide 3 -->
				<li class="bg1">
					<!-- Slide Title -->
					<h2 class="title">网络热点发现系统V1.0</h2> <!-- Slide Text -->
					<h3 class="subtitle">全新的界面设计</h3> <!-- Slide Image --> <img
					class="slide-img" src="img/homepage-slider/slide3.png"
					alt="Slide 3" />
				</li>
				<!-- End Slide 3 -->
			</ul>
			<div class="sequence-pagination-wrapper">
				<ul class="sequence-pagination">
					<li>1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- End Homepage Slider -->

	<!-- Press Coverage -->
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<div class="in-press press-wired">
						<a href="#">基于HttpClient的网络爬虫Web新闻源数据获取</a>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="in-press press-mashable">
						<a href="#">基于T-SinglePass的增量聚类分析<br /> <br /></a>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="in-press press-techcrunch">
						<a href="#">基于eCharts &nbsp;d3.js的数据可视化展示<br /> <br /></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Press Coverage -->

	<!-- Services -->
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<div class="service-wrapper">
						<img src="img/service-icon/diamond.png" alt="网络爬虫">
						<h3>网络爬虫</h3>
						<p>
							互联网新闻源数据的获取 <br /> <br />
						</p>
						<a
							href="http://baike.baidu.com/link?url=RhjAp3kXKUcwtuaaKqbtQNuILJrkLJ48gOUXpcZJWWkHrVKECUk7Cr3odnBv5vU4K2MueQlNpBnzT6W-dWcDZq"
							target="_blank" class="btn">Read more</a>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="service-wrapper">
						<img src="img/service-icon/ruler.png" alt="增量聚类">
						<h3>增量聚类</h3>
						<p>基于T-SinglePass聚类算法对文本特征向量进行聚类分析</p>
						<a href="http://baike.baidu.com/view/903740.htm" target="_blank"
							class="btn">Read more</a>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="service-wrapper">
						<img src="img/service-icon/box.png" alt="舆情预警">
						<h3>舆情预警</h3>
						<p>
							生成标签云 <br />产生聚类结果
						</p>
						<a href="http://baike.baidu.com/view/2726344.htm" target="_blank"
							class="btn">Read more</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Services -->

	<!-- Call to Action Bar -->
	<div class="section section-white">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="calltoaction-wrapper">
						<h3>基于增量聚类分析的网络热点话题研究发现</h3>
						<a href="Files/note.md" target="_blank" class="btn btn-orange">PDF全文下载</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Call to Action Bar -->

	<!-- Testimonials -->
	<div class="section">
		<div class="container">
			<h2>声明</h2>
			<div class="row">
				<div class="testimonial col-md-4 col-sm-6">
					<div class="author-photo">
						<img src="img/user1.jpg" alt="指导老师：黄炜">
					</div>
					<div class="testimonial-bubble">
						<blockquote>
							<p class="quote">"指导老师：黄炜"</p>
							<cite class="author-info"> - 湖北工业大学,<br>- 经济管理学院 <br />
								<br /> <a href="http://www.webkmhg.com/" target="_blank">知识管理与创新实验室</a>



							</cite>
						</blockquote>
						<div class="sprite arrow-speech-bubble"></div>
					</div>
				</div>
				<!-- Testimonial -->
				<div class="testimonial col-md-4 col-sm-6">
					<!-- Author Photo -->
					<div class="author-photo">
						<img src="img/user2.jpg" alt="@徐璐">
					</div>
					<div class="testimonial-bubble">
						<blockquote>
							<!-- Quote -->
							<p class="quote">
								"设计/制作 ： 徐璐" <br />
							</p>
							<br />
							<!-- Author Info -->
							<cite class="author-info"> - 湖北工业大学 11信管1<br> <br />经济与管理学院
								<a href="https://github.com/xuludev" target="_blank">@徐璐</a>

							</cite>
						</blockquote>
						<div class="sprite arrow-speech-bubble"></div>
					</div>
				</div>
				<!-- End Testimonial -->

				<div class="testimonial col-md-4 col-sm-6">
					<div class="author-photo">
						<img src="img/user0.jpg" alt="修改意见">
					</div>
					<div class="testimonial-bubble">
						<blockquote>
							<p class="quote">
								"测试 &维护 ：<a href='https://github.com/xuludev' target='_blank'>徐璐</a>"
							</p>
							<cite class="author-info"> - 湖北工业大学<br /> <br /> <br />经济管理学院
								- 信息管理与信息系统<br />



							</cite>
						</blockquote>
						<div class="sprite arrow-speech-bubble"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Testimonials -->

	<!-- BLANK -->
	<div class="section">
		<div class="container">
			<div class="row"></div>
		</div>
	</div>
	<!-- End BLANK -->

	<!-- FRIENDS LINK -->
	<div class="section">
		<div class="container">
			<h2>友情链接</h2>
			<div class="clients-logo-wrapper text-center row">
				<div class="col-lg-1 col-md-1 col-sm-3 col-xs-6">
					<a href="http://index.baidu.com" target="_blank"> <img
						src="img/logos/Baiduindex_logo.png" alt="百度指数">
					</a>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-3 col-xs-6">
					<a href="http://weiboreach.com/zhiwei/" target="_blank"> <img
						src="img/logos/zhiwei_logo.png" alt="知微">
					</a>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-3 col-xs-6">
					<a href="https://alizs.taobao.com/" target="_blank"> <img
						src="img/logos/Ali_Index.png" alt="阿里指数">
					</a>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-3 col-xs-6">
					<a href="http://index.youku.com/" target="_blank"> <img
						src="img/logos/index_Youku.png" alt="优酷指数">
					</a>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-3 col-xs-6">
					<a href="http://data.weibo.com/index/" target="_blank"> <img
						src="img/logos/WB_logo.png" alt="微博指数">
					</a>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-3 col-xs-6">
					<a href="http://www.weizhishu.com/" target="_blank"> <img
						src="img/logos/Wechat.jpg" alt="微信指数">
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- End Our Clients -->

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
						<li><a href="https://alizs.taobao.com/" target="_blank">阿里指数</a>
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
						<b>Address:</b>武汉市洪山区, 李纸路徐家墩,湖北工业大学, 经济与管理学院, 11信管, 徐璐 <br /> <b>知乎：</b><a
							href="https://www.zhihu.com/people/xulu-0620/activities"
							target="_blank">LucasX</a> <br />
						<b>Github:</b> <a href="https://github.com/EclipseXuLu"
							target="_blank">LucasX</a> <br /> <b>Email:</b> <a
							href="mailto:xulu0620@qq.com">xulu0620@qq.com</a>
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
	</div>
</body>

</html>