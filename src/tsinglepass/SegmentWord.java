package tsinglepass;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.UnsupportedEncodingException;

/*
 * @Author by XuLu
 * 
 * use lucene to segment text
 */
public class SegmentWord {

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

	}

