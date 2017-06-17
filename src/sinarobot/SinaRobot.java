package sinarobot;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.swing.JOptionPane;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class SinaRobot {
	public static List<String> listhref = new ArrayList<String>();
	public static List<String> all_title = new ArrayList<String>();
	public static String path = "D:\\Users\\Administrator\\WebOpinionSystem\\System\\Text\\";
	public static int sum = 1;
	public static String article_time = null;

	public static void sinaRobot() throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dd = sdf.format(new Date());
		String s = dd;
		for (int i = 1; i <= 7; i++) {
			String path = "http://roll.news.sina.com.cn/news/gnxw/gdxw1/" + s
					+ "_" + i + ".shtml";
			System.out.println("Parsing url : " + path);
			org.jsoup.nodes.Document doc = Jsoup.connect(path).get();
			List<Element> ele = doc.select("ul.list_009 a[href]");
			for (int j = 0; j <= ele.size() - 1; j++) {
				String a_href = ele.get(j).attr("href");
				String title = ele.get(j).text();
				listhref.add(a_href);
				all_title.add(title);
			}
			ele.clear();
		}
		System.out.println("=====================" + listhref.size()
				+ "======================");
		for (int a = 0; a <= listhref.size() - 1; a++) {
			try {
				System.out.println("URL is ：" + listhref.get(a) + "\t"
						+ "Title is：" + all_title.get(a));
				String url_path = listhref.get(a).toString();
				org.jsoup.nodes.Document doc1 = Jsoup.connect(url_path).get();
				Elements eles = doc1.select("div#artibody p");
				String article = eles.text();
				String all_path = path + "\\";
				String title_path = all_path + a + ".txt";
				System.out.println("This is " + sum + "th article ");

				// article_time =
				// doc1.getElementById("pub_date").text();//Before
				article_time = doc1.getElementsByClass("time-source").text();
				String time1 = article_time.replaceAll("年", "");
				String time2 = time1.replaceAll("月", "");
				String time3 = time2.replaceAll("日", "");
				String time4 = time3.replaceAll(":", "");
				// String ctime = time4 + "00";//Before
				String[] temp = time4.split(" ");
				String ctime = temp[0];
				System.err.println(ctime);

				File file = new File(all_path);
				if (!(file.exists())) {
					file.mkdirs();
				} else {
					file.delete();
					file.mkdirs();
				}
				File file1 = new File(title_path);
				if (!(file.exists())) {
					file1.createNewFile();
				} else {
					file1.delete();
					file1.createNewFile();
				}
				OutputStream fos = new FileOutputStream(file1);
				Writer writer = new OutputStreamWriter(fos, "utf-8");
				if (!article.equals("") || article != null) {
					writer.write(ctime); // write in time
					writer.write(13);
					writer.write(10);
					writer.write(all_title.get(a));
					writer.write(13);
					writer.write(10);
					writer.write(article);
				}
				writer.close();
				fos.close();

			} catch (java.net.SocketTimeoutException soc) {
				System.out.println("url matching failed");
			} catch (java.io.IOException ioe) {
				System.out.println("write error");
			} catch (java.lang.NullPointerException np) {
				System.out.println("no time");
				article_time = "";
			}
			sum++;
		}
		int all_sum = sum - 1;
		JOptionPane.showMessageDialog(null, "Get " + all_sum
				+ " article in sum");
		System.out.println("一共成功写入" + all_sum + "篇新闻。");
		System.out.println(s + "的新闻已经成功抓取。");
	}

	public static void main(String[] args) throws Exception {
		sinaRobot();
	}
}
