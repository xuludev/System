package utilize;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import javax.swing.JOptionPane;

public class TagCloud {

	/**
	 * 
	 * @param filepath
	 * @return 20words
	 */
	public static String[] getWord(String filepath) {
		String[] word = new String[10];
		File f = new File(filepath);
		BufferedReader br = null;
		if (f.isFile() && f.exists()) {
			try {
				br = new BufferedReader(new FileReader(f));
				String content = br.readLine();

				// System.out.println(new String(content.getBytes(), "utf-8"));
				String strWord = new String(content.getBytes(), "utf-8");

				// String[] str = strWord.replaceAll("  ", " ").split(" ");
				String[] str = strWord.replaceAll("\\s+", " ").split(" ");

				for (int i = 0; i < 10; i++) {
					// word[i] = new String(str[i].getBytes(), "utf-8");
					word[i] = str[i];
				}
				br.close();
			} catch (FileNotFoundException e) {
				System.out.println("File not found");
			} catch (IOException e) {
				System.err.println("Write error");
			}
		}

		return word;
	}
	
	
	public static String[] getMoreWord(String filepath) {
		String[] word = new String[50];
		File f = new File(filepath);
		BufferedReader br = null;
		if (f.isFile() && f.exists()) {
			try {
				br = new BufferedReader(new FileReader(f));
				String content = br.readLine();

				// System.out.println(new String(content.getBytes(), "utf-8"));
				String strWord = new String(content.getBytes(), "utf-8");

				// String[] str = strWord.replaceAll("  ", " ").split(" ");
				String[] str = strWord.replaceAll("\\s+", " ").split(" ");

				for (int i = 0; i < 20; i++) {
					// word[i] = new String(str[i].getBytes(), "utf-8");
					word[i] = str[i];
				}
				br.close();
			} catch (FileNotFoundException e) {
				System.out.println("File not found");
			} catch (IOException e) {
				System.err.println("Write error");
			}
		}

		return word;
	}
	

}
