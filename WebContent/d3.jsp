<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page errorPage="page-404.jsp"%>
<%@ page
	import="utilize.TagCloud,java.io.BufferedReader,java.io.File,java.io.FileNotFoundException,java.io.FileReader,java.io.IOException"%>

<!DOCTYPE html>
<meta charset="utf-8">
<link href="favicon.ico" rel="shortcut icon" />
<style>
body {
    font-family: "微软雅黑", Helvetica, Arial, sans-serif;
	width: 960px;
	height: 500px;
	position: relative;
}

svg {
	width: 100%;
	height: 100%;
}

path.slice {
	stroke-width: 2px;
}

polyline {
	opacity: .3;
	stroke: black;
	stroke-width: 2px;
	fill: none;
}
a:hover{
	background-color: orange;
}
</style>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="js/bootstrap.min.js"></script>

<body>

	<%
		String[] words = TagCloud
				.getMoreWord("D:/Users/Administrator/WebOpinionSystem/System/XuLu/keywordSet.txt");
		int index = (int) (Math.random() * 15);
	%>
	
	<div>
	<button class="randomize">Transform</button>
	<a href="index.jsp" style="text-decoration: none;display: block;background-color: #6495ED;width: 83px;height:30px; margin-top: 20px;color: white">HomePage</a>
	</div>

	<h2 align="center">Data Visualize Powered by d3.js</h2>

	<script src="d3.min.js"></script>
	<script>
		var svg = d3.select("body").append("svg").append("g")

		svg.append("g").attr("class", "slices");
		svg.append("g").attr("class", "labels");
		svg.append("g").attr("class", "lines");

		var width = 960, height = 450, radius = Math.min(width, height) / 2;

		var pie = d3.layout.pie().sort(null).value(function(d) {
			return d.value;
		});

		var arc = d3.svg.arc().outerRadius(radius * 0.8).innerRadius(
				radius * 0.4);

		var outerArc = d3.svg.arc().innerRadius(radius * 0.9).outerRadius(
				radius * 0.9);

		svg
				.attr("transform", "translate(" + width / 2 + "," + height / 2
						+ ")");

		var key = function(d) {
			return d.data.label;
		};

<%-- 		var color = d3.scale.ordinal().domain(
				[ "<%=words[0]%>", "<%=words[1]%>", "<%=words[2]%>", "<%=words[3]%>",
				  "<%=words[4]%>", "<%=words[5]%>", "<%=words[6]%>", "<%=words[7]%>", "<%=words[8]%>",
				  "<%=words[9]%>","<%=words[10]%>" ]).range(
				[ "#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56",
						"#d0743c", "#ff8c00" ]); --%>
						
		var color = d3.scale.ordinal().domain(
				[ "<%=words[index]%>", "<%=words[index + 1]%>", "<%=words[index + 2]%>", "<%=words[index + 3]%>",
						"<%=words[index + 4]%>", "<%=words[index + 5]%>", "<%=words[index + 6]%>", "<%=words[index + 7]%>"]).range(
				[ "#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56",
						"#d0743c", "#ff8c00" ]);

		function randomData() {
			var labels = color.domain();
			return labels.map(function(label) {
				return {
					label : label,
					value : Math.random()
				}
			});
		}

		change(randomData());

		d3.select(".randomize").on("click", function() {
			change(randomData());
		});

		function change(data) {

			/* ------- PIE SLICES -------*/
			var slice = svg.select(".slices").selectAll("path.slice").data(
					pie(data), key);

			slice.enter().insert("path").style("fill", function(d) {
				return color(d.data.label);
			}).attr("class", "slice");

			slice.transition().duration(1000).attrTween("d", function(d) {
				this._current = this._current || d;
				var interpolate = d3.interpolate(this._current, d);
				this._current = interpolate(0);
				return function(t) {
					return arc(interpolate(t));
				};
			})

			slice.exit().remove();

			/* ------- TEXT LABELS -------*/

			var text = svg.select(".labels").selectAll("text").data(pie(data),
					key);

			text.enter().append("text").attr("dy", ".35em").text(function(d) {
				return d.data.label;
			});

			function midAngle(d) {
				return d.startAngle + (d.endAngle - d.startAngle) / 2;
			}

			text
					.transition()
					.duration(1000)
					.attrTween(
							"transform",
							function(d) {
								this._current = this._current || d;
								var interpolate = d3.interpolate(this._current,
										d);
								this._current = interpolate(0);
								return function(t) {
									var d2 = interpolate(t);
									var pos = outerArc.centroid(d2);
									pos[0] = radius
											* (midAngle(d2) < Math.PI ? 1 : -1);
									return "translate(" + pos + ")";
								};
							}).styleTween("text-anchor", function(d) {
						this._current = this._current || d;
						var interpolate = d3.interpolate(this._current, d);
						this._current = interpolate(0);
						return function(t) {
							var d2 = interpolate(t);
							return midAngle(d2) < Math.PI ? "start" : "end";
						};
					});

			text.exit().remove();

			/* ------- SLICE TO TEXT POLYLINES -------*/

			var polyline = svg.select(".lines").selectAll("polyline").data(
					pie(data), key);

			polyline.enter().append("polyline");

			polyline.transition().duration(1000).attrTween(
					"points",
					function(d) {
						this._current = this._current || d;
						var interpolate = d3.interpolate(this._current, d);
						this._current = interpolate(0);
						return function(t) {
							var d2 = interpolate(t);
							var pos = outerArc.centroid(d2);
							pos[0] = radius * 0.95
									* (midAngle(d2) < Math.PI ? 1 : -1);
							return [ arc.centroid(d2), outerArc.centroid(d2),
									pos ];
						};
					});

			polyline.exit().remove();
		};
	</script>
	<div align="center">
		<div>&copy; 2017 XuLu. All rights
			reserved.</div>
	</div>
</body>