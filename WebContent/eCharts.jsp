<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="utilize.HotWord,beans.Words"%>
<%@ page
	import="java.io.BufferedReader,java.io.ByteArrayInputStream,java.io.File,java.io.FileInputStream,java.io.FileNotFoundException, java.io.IOException,java.io.InputStreamReader,java.util.ArrayList,java.util.Iterator"%>
<%@ page errorPage="page-404.jsp"%>
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
					int categoryNum = new File(
						"D:/Users/Administrator/WebOpinionSystem/System/ClusterFiles")
							.list().length;//这里为聚类得到的Cluster的值
					int index = 0;
					
				%>
				
				<%
					out.print("data : [");
					while (index < categoryNum - 1) {
						out.print("'第" + (index + 1) + "类',");
						index++;
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
						File ft = new File(
						"D:/Users/Administrator/WebOpinionSystem/System/ClusterFiles/");
						File[] flist = ft.listFiles(); //Category1, Category2...

				//prepare arrays
				String[][] arrayName = new String[categoryNum][5];
					
				for (int v = 0; v < flist.length; v++) {
					arrayName[v] = HotWord
							.eCharts(flist[v].getAbsolutePath());
				}
				%>
					
				<!--填充数据 --!>
				
					nodes : [
	
						<%
							for(int num = 0;num < categoryNum;num ++){
						
								out.print("{name : '" + arrayName[num][0] + "'},");
								out.print("{name : '" + arrayName[num][1] + "'},");
								out.print("{name : '" + arrayName[num][2] + "'},");
								out.print("{name : '" + arrayName[num][3] + "'},");
								out.print("{name : '" + arrayName[num][4] + "'},");
							}
						%>
					
					
					<%
					int index2 = 0;
					while (index2 < categoryNum - 1) {
						out.print("{name : '第" + (index2 + 1) + "类'},");
						index2++;
					}
					out.print("{name : '第" + (index2 + 1) + "类'}");
					out.print("],");
					%>
					
					links : [ 
					
					<%
						for(int z = 0;z < categoryNum - 1;z ++){
							out.print("{ source : '第" + (z + 1) + "类',target : '" + arrayName[z][0] + "'," + "weight : 1, name : '属于'},");
							out.print("{ source : '第" + (z + 1) + "类',target : '" + arrayName[z][1] + "'," + "weight : 1, name : '属于'},");
							out.print("{ source : '第" + (z + 1) + "类',target : '" + arrayName[z][2] + "'," + "weight : 1, name : '属于'},");
							out.print("{ source : '第" + (z + 1) + "类',target : '" + arrayName[z][3] + "'," + "weight : 1, name : '属于'},");
							out.print("{ source : '第" + (z + 1) + "类',target : '" + arrayName[z][4] + "'," + "weight : 1, name : '属于'},");
						}
					%>
					{
						source : '第<%=categoryNum%>类',
						target : '<%=arrayName[categoryNum - 1][0]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第<%=categoryNum%>类',
						target : '<%=arrayName[categoryNum - 1][1]%>',
						weight : 1,
						name : '属于'
					} ,{
						source : '第<%=categoryNum%>类',
						target : '<%=arrayName[categoryNum - 1][2]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第<%=categoryNum%>类',
						target : '<%=arrayName[categoryNum - 1][3]%>',
						weight : 1,
						name : '属于'
					}, {
						source : '第<%=categoryNum%>类',
						target : '<%=arrayName[categoryNum - 1][4]%>',
						weight : 1,
						name : '属于'
					} ]
				} ]
			};
			// 为echarts对象加载数据 
			myChart.setOption(option);
		});
	</script>

	<P align="center">
		Note:Testing...Please Contact<a
			href="http://weibo.com/2437919983/profile?topnav=1&wvr=6"
			target="_blank">@徐璐</a>
	</P>
	<div align="center">
		<a href="index.jsp">返回主页</a>
		<footer>&copy; 2017 XuLu. All rights reserved.</footer>
	</div>
</body>

</html>