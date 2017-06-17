<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="utilize.HotWord,beans.Words"%>
<%@ page import="java.io.BufferedReader,java.io.ByteArrayInputStream,java.io.File,java.io.FileInputStream,java.io.FileNotFoundException, java.io.IOException,java.io.InputStreamReader,java.util.ArrayList,java.util.Iterator" %>
<%@ page errorPage="page-404.jsp" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<head>
<meta charset="utf-8">
<title>数据展示</title>
<link href="favicon.ico" rel="shortcut icon" />
<style>
a {
	text-decoration: none;
}

a:hover {
	background-color: #66AFE9;
	color: white;
}
</style>
</head>

<body>
	<h2 align="center" style="font-family: '宋体';">数据可视化</h2>

	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="height: 500px"></div>
	<!-- ECharts单文件引入 -->
	<script src="js/dist/echarts.js"></script>
	<script type="text/javascript">
		// 路径配置
		require.config({
			paths : {
				echarts : 'js/dist'
			}
		});
		// 使用
		require([ 'echarts', 'echarts/chart/chord', // 使用柱状图就加载bar模块，按需加载
		'echarts/chart/force' ], function(ec) {
			// 基于准备好的dom，初始化echarts图表
			var myChart = ec.init(document.getElementById('main'));
			var option = {
				title : {
					text : 'Data Visualization Powered by eCharts',
					x : 'right',
					y : 'bottom'
				},
				tooltip : {
					trigger : 'item',
					formatter : function(params) {
						if (params.indicator2) { // is edge
							return params.indicator2 + ' ' + params.name + ' '
									+ params.indicator;
						} else { // is node
							return params.name
						}
					}
				},
				toolbox : {
					show : true,
					feature : {
						restore : {
							show : true
						},
						magicType : {
							show : true,
							type : [ 'force', 'chord' ]
						},
						saveAsImage : {
							show : true
						}
					}
				},
				legend : {
					x : 'left',
				<%
					int categoryNum = new File("D:/Users/Administrator/WebOpinionSystem/System/ClusterFiles").list().length;//这里为聚类得到的Cluster的值
					//Add mannually！！！
					categoryNum = 5;
					int index = 0;
				%>
				
				<%
					out.print("data : [");
					while(index < categoryNum - 1){
						out.print("'第" + (index + 1) + "类',");
						index ++;
					}
				out.print("'第" + (index + 1) + "类'");
				out.print("]");
				%>
				},
				series : [ {
					name : 'Data Visualization Powered by eCharts',
					type : 'chord',
					sort : 'ascending',
					sortSub : 'descending',
					ribbonType : false,
					radius : '60%',
					itemStyle : {
						normal : {
							label : {
								rotate : true
							}
						}
					},
					minRadius : 7,
					maxRadius : 20,
					// 使用 nodes links 表达和弦图
					
					<%
						File ft = new File("D:/Users/Administrator/WebOpinionSystem/System/ClusterFiles/");					
						File[] flist = ft.listFiles();  //Category1, Category2...
						//for(int v = 1; v < flist.length; v++){
						int v = 0;
						String[] value1 = HotWord.eCharts(flist[v].getAbsolutePath());
						String[] value2 = HotWord.eCharts(flist[v+1].getAbsolutePath());
						String[] value3 = HotWord.eCharts(flist[v+2].getAbsolutePath());
						String[] value4 = HotWord.eCharts(flist[v+3].getAbsolutePath());
						String[] value5 = HotWord.eCharts(flist[v+4].getAbsolutePath());
					%>
					
					nodes : [ {
						name : '<%=value1[0]%>'
					}, {
						name : '<%=value1[1]%>'
					}, {
						name : '<%=value1[2]%>'
					}, {
						name : '<%=value1[3]%>'
					}, {
						name : '<%=value1[4]%>'
					},{
						name : '<%=value2[0]%>'
					}, {
						name : '<%=value2[1]%>'
					}, {
						name : '<%=value2[2]%>'
					}, {
						name : '<%=value2[3]%>'
					}, {
						name : '<%=value2[4]%>',
						symbol : 'star'
					}, {
						name : '<%=value3[0]%>'
					}, {
						name : '<%=value3[1]%>'
					}, {
						name : '<%=value3[2]%>'
					}, {
						name : '<%=value3[3]%>'
					}, {
						name : '<%=value3[4]%>'
					}, {
						name : '<%=value4[0]%>'
					}, {
						name : '<%=value4[1]%>'
					}, {
						name : '<%=value4[2]%>'
					}, {
						name : '<%=value4[3]%>'
					}, {
						name : '<%=value4[4]%>'
					}, {
						name : '<%=value5[0]%>'
					}, {
						name : '<%=value5[1]%>'
					}, {
						name : '<%=value5[2]%>'
					}, {
						name : '<%=value5[3]%>'
					}, {
						name : '<%=value5[4]%>'
					},
					
					
					<%
						int index2 = 0;
						while(index2 < categoryNum - 1){
							out.print("{name : '第" + (index2+1) + "类'},");
							index2 ++;
						}
						out.print("{name : '第" + (index2 + 1) + "类'}");
						out.print("],");
					%>
					
					links : [ {
						source : '第1类',
						target : '<%=value1[0]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第1类',
						target : '<%=value1[1]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第1类',
						target : '<%=value1[2]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第1类',
						target : '<%=value1[3]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第1类',
						target : '<%=value1[4]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第2类',
						target : '<%=value2[0]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第2类',
						target : '<%=value2[1]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第2类',
						target : '<%=value2[2]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第2类',
						target : '<%=value2[3]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第2类',
						target : '<%=value2[4]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第3类',
						target : '<%=value3[0]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第3类',
						target : '<%=value3[1]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第3类',
						target : '<%=value3[2]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第3类',
						target : '<%=value3[3]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第3类',
						target : '<%=value3[4]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第4类',
						target : '<%=value4[0]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第4类',
						target : '<%=value4[1]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第4类',
						target : '<%=value4[2]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第4类',
						target : '<%=value4[3]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第4类',
						target : '<%=value4[4]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第5类',
						target : '<%=value5[0]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第5类',
						target : '<%=value5[1]%>',
						weight : 1,
						name : '属于'
					} ,{
						source : '第5类',
						target : '<%=value5[2]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第5类',
						target : '<%=value5[3]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第5类',
						target : '<%=value5[4]%>',
						weight : 1,
						name : '属于'
					} ]
				} ]
			};
			// 为echarts对象加载数据 
			myChart.setOption(option);
		});
	</script>

	<P align="center">Note:Testing...Please Contact<a href="http://weibo.com/2437919983/profile?topnav=1&wvr=6" target="_blank">@徐璐</a></P>
	<div align="center">
		<a href="index.jsp">返回主页</a>
		<footer>&copy; 2015 XuLu. All rights reserved.</footer>
	</div>
</body>

</html>