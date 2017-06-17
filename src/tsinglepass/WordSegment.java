package tsinglepass;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.sun.jna.Library;
import com.sun.jna.Native;
import com.xulu.tfidf.TfIdf;

public class WordSegment {

	/*
	 * use NLPIR interface to segment words
	 */

	static final ArrayList<String> NOUNS = new ArrayList<String>(); // 名词n
	static final ArrayList<String> TIME = new ArrayList<String>(); // 时间词t
	static final ArrayList<String> PLACE = new ArrayList<String>(); // 处所词p
	static final ArrayList<String> FANGWEI = new ArrayList<String>(); // 方位词f
	static final ArrayList<String> VERB = new ArrayList<String>();// 动词v
	static final ArrayList<String> ADJ = new ArrayList<String>(); // 形容词a

	// 定义接口CLibrary，继承自com.sun.jna.Library
	public interface CLibrary extends Library {
		// 定义并初始化接口的静态变量
		CLibrary Instance = (CLibrary) Native.loadLibrary(
				"D:\\Users\\Administrator\\ICTCLAS2015\\lib\\win64\\NLPIR",
				CLibrary.class);

		public int NLPIR_Init(String sDataPath, int encoding,
				String sLicenceCode);

		public String NLPIR_ParagraphProcess(String sSrc, int bPOSTagged);

		public String NLPIR_GetKeyWords(String sLine, int nMaxKeyLimit,
				boolean bWeightOut);

		public String NLPIR_GetFileKeyWords(String sLine, int nMaxKeyLimit,
				boolean bWeightOut);

		public int NLPIR_AddUserWord(String sWord);// add by qp 2008.11.10

		public int NLPIR_DelUsrWord(String sWord);// add by qp 2008.11.10

		public String NLPIR_GetLastErrorMsg();

		public void NLPIR_Exit();
	}

	public static String transString(String aidString, String ori_encoding,
			String new_encoding) {
		try {
			return new String(aidString.getBytes(ori_encoding), new_encoding);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 读取文本
	public static String readFile(String absoluteFilePath) throws Exception {

		StringBuffer sb = new StringBuffer();
		BufferedReader br = new BufferedReader(new FileReader(new File(
				absoluteFilePath)));

		String readStr = br.readLine();
		while (readStr != null) {
			sb.append(readStr).append("\r\n");
			readStr = br.readLine();
		}
		br.close();

		return sb.toString();
	}

	// 写文件
	public static void writeFile(String strContent, String fileName)
			throws Exception {
		BufferedWriter bw = new BufferedWriter(new FileWriter(
				new File(fileName)));
		bw.write(strContent);
		bw.flush();
		bw.close();

	}

	public static void main(String[] args) throws Exception {

		String argu = "D:\\Users\\Administrator\\ICTCLAS2015";
		// String system_charset = "GBK";//GBK----0
		String system_charset = "UTF-8";
		int charset_type = 1;

		int init_flag = CLibrary.Instance.NLPIR_Init(argu, charset_type, "0");
		String nativeBytes = null;

		if (0 == init_flag) {
			nativeBytes = CLibrary.Instance.NLPIR_GetLastErrorMsg();
			System.err.println("初始化失败！fail reason is " + nativeBytes);
			return;
		}

		// 这一步将新闻文本切分为单个的词语，保存在temp数组里

		/*
		 * * CLibrary.Instance.NLPIR_AddUserWord("要求美方加强对输 n");
		 * CLibrary.Instance.NLPIR_AddUserWord("华玉米的产地来源 n"); nativeBytes =
		 * CLibrary.Instance.NLPIR_ParagraphProcess(sInput, 1);
		 * System.out.println("增加用户词典后分词结果为： " + nativeBytes);
		 */

		/*
		 * CLibrary.Instance.NLPIR_DelUsrWord("要求美方加强对输"); nativeBytes =
		 * CLibrary.Instance.NLPIR_ParagraphProcess(sInput, 1); System.
		 * out.println("删除用户词典后分词结果为： " + nativeBytes);
		 */

		/*
		 * int nCountKey = 0; String nativeByte =
		 * CLibrary.Instance.NLPIR_GetKeyWords(sInput, 10, false);
		 */

		// System.out.print("关键词提取结果是：" + nativeByte);

		/*
		 * nativeByte = CLibrary.Instance .NLPIR_GetFileKeyWords(
		 * "D:\\NLPIR\\feedback\\huawei\\5341\\5341\\产经广场\\2012\\5\\16766.txt" ,
		 * 10, false);
		 */

		// System.out.print("关键词提取结果是：" + nativeByte);

		Map<String, Float> idf = TfIdf.idf("D:\\Text");

		Set<Entry<String, Float>> set = idf.entrySet();
		java.util.Iterator<Entry<String, Float>> it = set.iterator();
		while (it.hasNext()) {
			Entry<String, Float> entry = it.next();

		}
	}
}
