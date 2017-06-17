package tsinglepass;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import utilize.ConstantPath;
import utilize.Constant;

public class SinglePassCluster {

	public static void main(String[] args) throws Exception {
		SinglePassCluster singlePass = new SinglePassCluster();
		singlePass.singlePassAlgorithm();
	}

	// 依次读取文本特征向量,传入的参数为特征向量.txt的路径，返回double[]类型的一维数组
	public static double[] featureVector(String featureVectorPath)
			throws Exception {

		double[] featureVector = new double[600];
		File f = new File(featureVectorPath);
		if (f.exists() && f.isFile()) {
			String s = WordSegment.readFile(f.getAbsolutePath());
			// System.out.println(s);
			String[] split = s.split("\r\n"); // 从特征向量txt中读取的数值，但此时为String类型
			for (int j = 0; j < split.length; j++) {
				featureVector[j] = Double.parseDouble(split[j]);
			}
		}
		return featureVector;
	}

	// get featureVector one by one, Parameter : the file path of featureVector
	public static double[][] getFeatureVector(String featureVectorPath)
			throws Exception {

		// get the first dimension of the array[][]
		int firstDimension = new File(ConstantPath.featureVecorPath).list().length;

		File f = new File(featureVectorPath);

		// create the return array
		double featureVector[][] = new double[firstDimension][];

		if (f.exists() && f.isDirectory()) {
			String[] files = f.list(); // 特征向量文件列表
			for (int i = 0; i < files.length; i++) {
				String s = WordSegment.readFile("featureVector\\" + files[i]);
				// System.out.println(s);
				String[] split = s.split("\r\n"); // 从特征向量txt中读取的数值，但此时为String类型
				for (int j = 0; j < split.length; j++) {
					if (!split[j].equals("") && split[j] != null) {
						featureVector[i][j] = Double.parseDouble(split[j]);
					} else {
						featureVector[i][j] = 0.0d;
					}
				}
			}
			return featureVector;
		} else {
			return null;
		}
	}

	// T_Single Pass Algorithm
	public void singlePassAlgorithm() {

		// 加入的生成特征向量部分的代码
		try {
			TfIdfAlgorithm.getTfIdfText();
		} catch (Exception e1) {
			e1.printStackTrace();
		}

		int index_of_category = 0;
		double calc = 0;
		try {
			double[][] result = SinglePassCluster
					.formatArray(readValue(ConstantPath.featureVecorPath));
			for (int i = 0; i < result.length - 1; i++) {
				calc = cosSimilarity(result[i], result[i + 1]);
				// 判断cosSim和THRESHOLD的值的大小，是否属于该类
				if (calc >= Constant.THRESHOLD) {
					// 将该文本文件复制到相应的目录下，并更新已有的类中心
					copyFile(ConstantPath.TextPath + i + ".txt",
							index_of_category, i);
					double[] db = updateClusterCenter(result[i], result[i + 1]);
					result[i + 1] = db;
				} else {
					index_of_category++;
					// 则说明该文本文件不属于该类，所以新建一个类(文件夹)，将该文本丢进去
					createNewCluster(ConstantPath.ClusterFilesPath, i);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(-1);
		}
		System.out.println("Cluster Over...Please Check the Result!");
	}

	// Don't ask me why do I use English T_T
	// calculate the cosine Similarity.
	// Parameter：featureVector[][] arrays,and return the result as a format of
	// double --- unfinished
	public static double calculateCosSimilarity(double[][] featureVector)
			throws Exception {
		double cosSim = 0.0d;

		double numerator = 0.0d; // 余弦相似度式中的分子
		double temp_denominator1 = 0.0d; // 余弦相似度式中的分母temp
		double temp_denominator2 = 0.0d; // 余弦相似度式中的分母temp

		for (int i = 0; i < featureVector.length; i += 2) {
			for (int j = 0; j < featureVector[i].length; j++) {
				// System.out.println(result[i][j]);
				temp_denominator1 += Math.pow(featureVector[i][j], 2);
				temp_denominator2 += Math.pow(featureVector[i + 1][j], 2);
				numerator += featureVector[i][j] * featureVector[i + 1][j];
			}

		}
		cosSim = numerator
				/ (Math.sqrt(temp_denominator1) * Math.sqrt(temp_denominator2));

		return cosSim;
	}

	// calculate the cosine Similarity. Parameter:two double[] arrays
	public static double cosSimilarity(double[] arr1, double[] arr2) {
		double cosSim = 0.0d;
		double denominator1 = 0.0d; // 余弦相似度式中的分母
		double denominator2 = 0.0d; // 余弦相似度式中的分母
		double numerator = 0.0d; // 余弦相似度式中的分子

		for (int i = 0; i < arr1.length; i++) {
			denominator1 += Math.pow(arr1[i], 2);
			denominator2 += Math.pow(arr2[i], 2);
			numerator += arr1[i] * arr2[i];
		}
		cosSim = numerator
				/ (Math.sqrt(denominator1) * Math.sqrt(denominator2));
		return cosSim;
	}

	// update the existing clustering center,and return the new cluster center
	// as a result of double[] newCluster
	public static double[] updateClusterCenter(double[] newCluster,
			double[] oldCluster) {
		for (int i = 0; i < oldCluster.length; i++) {
			newCluster[i] = (newCluster[i] + oldCluster[i]) / 2;
		}
		return newCluster;
	}

	// copy files[function]
	public static void copyFile(String oldFilePath, int categoryNum,
			int fileIndex) throws Exception {

		String textContent = WordSegment.readFile(oldFilePath);
		String newFolderPath = ConstantPath.ClusterFilesPath + "Category"
				+ categoryNum + "\\";
		File file = new File(newFolderPath);
		if (!file.isDirectory() || !file.exists()) {
			file.mkdirs();
		}
		String newFilePath = newFolderPath + fileIndex + ".txt";
		File f = new File(newFilePath);
		if (!f.isFile() || !f.exists()) {
			f.createNewFile();
		}
		WordSegment.writeFile(textContent, newFilePath);
	}

	// if this text doesn't belong to these existing clusters.Then create a new
	// cluster and copy the specific text to this category! Parameter:the text
	// file path to be copied
	public static void createNewCluster(String textFilePath, int index_of_txt)
			throws Exception {
		File file = new File(textFilePath);// ClusterFiles
		String[] fileList = file.list();
		int max_num_of_category = fileList.length;
		// create the new category
		File dir = new File(ConstantPath.ClusterFilesPath + "Category"
				+ max_num_of_category);
		dir.mkdirs();

		String strContent = WordSegment.readFile(ConstantPath.TextPath
				+ index_of_txt + ".txt");
		WordSegment.writeFile(strContent, dir.getAbsolutePath() + "\\"
				+ index_of_txt + ".txt");
	}

	// convert ArrayList to array as double[]
	public static double[] convert(ArrayList<Double> alist) {
		double[] arr = new double[alist.size()];
		Iterator<Double> it = alist.iterator();
		int i = 0;
		while (it.hasNext()) {
			arr[i++] = it.next();
		}
		return arr;
	}

	// read from the featureVector .txt to get the featureVector value.
	// Parameter:the parentPath of featureVector
	public static Map<Integer, ArrayList<Double>> readValue(String strPath)
			throws Exception {

		Map<Integer, ArrayList<Double>> map = new HashMap<Integer, ArrayList<Double>>();
		File file = new File(strPath);

		// get the number of the text
		int content = new File(strPath).list().length;
		System.err.println(content);
		@SuppressWarnings("unchecked")
		ArrayList<Double>[] al = new ArrayList[content];
		int index_of_al = 0;
		if (file.exists() || file.isDirectory()) {
			File[] files = file.listFiles();
			// 读取第一、二、三...篇文本的featureVector值

			for (int i = 0; i < files.length; i++) {
				String[] words = WordSegment.readFile(
						files[i].getAbsolutePath()).split("\r\n");

				al[index_of_al] = new ArrayList<Double>();
				// 将读取每一篇文本featureVector的值(String类型)转换成Double类型
				for (int j = 0; j < words.length - 1; j++) { // 因为最后一个数组值是空白

					// 判断是否会出现null，这里最好放在爬虫部分检测
					if (!words[j].equals("") && words[j] != null) {
						al[index_of_al].add(Double.parseDouble(words[j]));
					}
				}
				map.put(i, al[index_of_al]);
				index_of_al++;
			}
		}
		return map;
	}

	// 数组格式化，传参为Map，其中，数组元素空缺的自动补足为0
	public static double[][] formatArray(Map<Integer, ArrayList<Double>> map) {

		ArrayList<Integer> tempal = new ArrayList<Integer>();
		Iterator<Integer> it = map.keySet().iterator();

		int first_dimension = 0;
		while (it.hasNext()) {
			ArrayList<Double> value = map.get(it.next());
			if (value != null) {
				// 添加每一个key-value对的size，接下来要确定最大的size来作为数组第二维的长度
				tempal.add(value.size());
			} else {
				tempal.add(0);
			}
			first_dimension++; // 统计有多少个key-value值
		}
		Object[] obj = tempal.toArray();
		int[] second = new int[obj.length];
		for (int z = 0; z < obj.length; z++) {
			second[z] = Integer.parseInt(String.valueOf(obj[z]));
		}
		Arrays.sort(second);
		int second_dimension = second[second.length - 1];// the max number
		// int second_dimension = second[0];//the min number
		double[][] arr = new double[first_dimension][second_dimension];

		Iterator<ArrayList<Double>> iterator = map.values().iterator();

		while (iterator.hasNext()) {

			int bridge = 0;
			// for循环赋值
			for (int u = 0; u < first_dimension; u++) {
				ArrayList<Double> alist = iterator.next();
				Iterator<Double> itr = alist.iterator();

				while (itr.hasNext()) {
					for (int v = 0; v < alist.size(); v++) {
						arr[u][v] = itr.next();
						System.out.print(arr[u][v] + "  ");
						bridge = v;
					}
					// break;
				}

				for (int w = bridge; w < second_dimension; w++) {
					arr[u][w] = 0.0d;
					System.out.print(arr[u][w] + "  ");
				}
				System.out.println();
			}
		}
		return arr;
	}
}
