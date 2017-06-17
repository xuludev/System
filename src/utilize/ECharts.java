package utilize;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.xulu.tfidf.TfIdf;

public class ECharts {

	// 得到每个类的类标号和热词，随机取5个
	public static ArrayList<String[]> getHotWords() {
		String[] hotWords = new String[5];
		ArrayList<String[]> alist = new ArrayList<String[]>();
		try {
			Map<String, HashMap<String, Float>> map = TfIdf
					.tfidf("D:\\Users\\Administrator\\WebOpinionSystem\\System\\ClusterFiles\\Category3");
			Iterator<HashMap<String, Float>> itmap = map.values().iterator();
			while (itmap.hasNext()) {
				HashMap<String, Float> hashMap = itmap.next();
				Iterator<String> it = hashMap.keySet().iterator();

				int index = 0;
				while (it.hasNext() && index < 5) {
					hotWords[index] = it.next();
					index++;
				}

				alist.add(hotWords);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}

		return alist;
	}

	public static void main(String[] args) {
		ArrayList<String[]> list = ECharts.getHotWords();
		Iterator<String[]> it = list.iterator();
		while (it.hasNext()) {
			String[] s = it.next();
			for (String str : s)
				System.out.print(str + "\t");
			System.out.println();
		}
	}
}
