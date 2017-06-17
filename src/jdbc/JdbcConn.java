package jdbc;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;

public class JdbcConn {
	private static String driver;
	private static String url;
	private static String user;
	private static String pass;

	public static Connection conn;

	/**
	 * initial database connection
	 * 
	 * @param paramFile
	 * @throws Exception
	 */
	public void initParam(String paramFile) throws Exception {
		Properties props = new Properties();
		props.load(new FileInputStream(paramFile));
		driver = props.getProperty("driver");
		url = props.getProperty("url");
		user = props.getProperty("user");
		pass = props.getProperty("pass");
	}

	public static Connection getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, pass);
		return conn;
	}

	/**
	 * Insert Your Data into Database
	 * 
	 * @param sql
	 * @return boolean
	 * @throws Exception
	 **/
	public boolean insertData(String sql) throws Exception {
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, pass);
		Statement stm = conn.createStatement();
		return stm.execute(sql);
	}
}
