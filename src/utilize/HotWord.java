package utilize;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Iterator;

import beans.Words;

import com.chenlb.mmseg4j.ComplexSeg;
import com.chenlb.mmseg4j.Dictionary;
import com.chenlb.mmseg4j.MMSeg;
import com.chenlb.mmseg4j.Seg;
import com.chenlb.mmseg4j.SimpleSeg;
import com.chenlb.mmseg4j.Word;

public class HotWord {

	private static final String[] stopWords = new String[] { "的", "我们", "心",
			"这样", "昨天", "他们", "他", "省份" };
	private static final String CLUSTERFILESPATH = "D:\\Users\\Administrator\\WebOpinionSystem\\System\\ClusterFiles\\";

	public static String readFiles(String file) throws FileNotFoundException,
			IOException {
		StringBuffer sb = new StringBuffer();
		InputStreamReader is = new InputStreamReader(new FileInputStream(file),
				"UTF-8");
		BufferedReader br = new BufferedReader(is);
		String line = br.readLine();
		while (line != null) {
			sb.append(line).append("\r\n");
			line = br.readLine();
		}
		br.close();
		return sb.toString();
	}

	// 分词
	public static String[] cutWord(String file) throws IOException {
		String[] cutWordResult = null;
		String text = HotWord.readFiles(file);
		String tempCutWordResult = HotWord.segStr(text, "simple");
		cutWordResult = tempCutWordResult.split(" ");
		return cutWordResult;
	}

	private static String segStr(String text, String mode) throws IOException {
		String returnStr = "";
		Seg seg = null;
		Dictionary dic = Dictionary.getInstance();
		if ("simple".equals(mode)) {
			seg = new SimpleSeg(dic);
		} else {
			seg = new ComplexSeg(dic);
		}

		// String words = seg.
		MMSeg mmSeg = new MMSeg(new InputStreamReader(new ByteArrayInputStream(
				text.getBytes())), seg);
		Word word = null;
		while ((word = mmSeg.next()) != null) {
			returnStr += word.getString() + " ";
		}
		return returnStr;
	}

	public static void main(String[] args) throws Exception {
		HotWord.eCharts(HotWord.CLUSTERFILESPATH);
	}

	/**
	 * 得到eCharts的匹配值
	 * 
	 * @return
	 * @throws Exception
	 */
	public static String[] eCharts(String dirPath) throws Exception {
		String[] str = new String[5];

		File[] tt = new File(dirPath).listFiles();
		String[] re = HotWord.cutWord(tt[(int) (Math.random() * tt.length)]
				.getAbsolutePath());
		// String[] result = HotWord.removeStopWords(re);
		ArrayList<Words> alist = HotWord.countWord(re);
		Iterator<Words> it = alist.iterator();

		int index = 0;
		while (it.hasNext() && index < 5) {
			Words words = it.next();
			str[index++] = words.getWord();
			System.out.println(words.getWord() + "\t" + words.getFrequency());
		}

		return str;
	}

	// 得到所有cluster的热词，并将返回值所谓eCharts的输入标准
	public static ArrayList<String[]> toECharts() throws Exception {

		ArrayList<String[]> alist = new ArrayList<String[]>();
		File f = new File(HotWord.CLUSTERFILESPATH); // ...../ClusterFiles
		if (f.exists() && f.isDirectory()) {
			String[] fileList = f.list(); // ...../CategoryX
			for (int i = 0; i < fileList.length; i++) {
				String[] txtList = new File(fileList[i]).list(); // ...../X.txt
				for (int j = 0; j < txtList.length; j++) {
					String[] temp1 = HotWord.cutWord(txtList[j]);
					ArrayList<Words> alwords = HotWord.countWord(temp1);
				}

			}

		}

		return alist;
	}

	/**
	 * 统计词频
	 * 
	 * @param before
	 * @return
	 */
	public static ArrayList<Words> countWord(String[] before) {

		ArrayList<Words> alist = new ArrayList<Words>();
		StringBuffer sb = new StringBuffer();

		Words words = null;
		for (int i = 0; i < before.length; i++) {

			words = new Words();
			int num = 0;
			for (int j = i; j < before.length; j++) {
				if (before[i].equals(before[j])) {
					num++;
				}
			}
			words.setFrequency(num);
			words.setWord(before[i]);

			if (!sb.toString().contains(before[i])) {
				sb.append(before[i]);
				alist.add(words);
			}
		}
		return alist;
	}

	// 去除停用词
	public static String[] removeStopWords(String[] str) {
		ArrayList<String> list = new ArrayList<String>();

		for (int i = 0; i < str.length; i++) {
			for (int j = 0; j < HotWord.stopWords.length; j++) {
				if (!str[i].equals(HotWord.stopWords[j])) {
					list.add(str[i]);
				}
			}
		}

		int len = list.size();
		String[] resultArr = new String[len];
		Iterator<String> iter = list.iterator();
		int index = 0;
		while (iter.hasNext()) {
			resultArr[index] = iter.next();
		}
		return resultArr;
	}

}
