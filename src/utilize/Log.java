package utilize;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Log {

	public static final String LOGPATH = "D:\\Users\\Administrator\\WebOpinionSystem\\System\\Log\\";

	/**
	 * write user log info
	 * 
	 * @param username
	 * @param prof
	 */
	public static void writeLog(String username, String prof) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		String time = sdf.format(new Date());
		System.out.println(time);
		String str = username + "\t" + prof + "\t" + time;
		File file = new File(Log.LOGPATH + time + ".log");
		if (!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		FileWriter fw = null;
		try {
			fw = new FileWriter(file);
			fw.write(str);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fw.flush();
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
