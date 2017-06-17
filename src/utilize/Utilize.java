package utilize;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class Utilize {

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

	public static void writeFile(String strContent, String fileName)
			throws Exception {
		BufferedWriter bw = new BufferedWriter(new FileWriter(
				new File(fileName)));
		bw.write(strContent);
		bw.flush();
		bw.close();

	}
}
