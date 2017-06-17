package utilize;

import java.io.File;

public class Test {
	public static void main(String[] args) {
		File ft = new File("D:/Users/Administrator/WebOpinionSystem/System/ClusterFiles/");					
		String[] flist = ft.list();
		System.out.println(flist[0]);
	}
}
