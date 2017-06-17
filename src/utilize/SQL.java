package utilize;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class SQL {

	/**
	 * initial SQL
	 * 
	 * @return Statement
	 * @throws Exception
	 */
	public static Statement SQLini() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/coursedesign";
		String user = "root";
		String pass = "XuLu19930620";

		Connection conn = DriverManager.getConnection(url, user, pass);
		Statement statement = conn.createStatement();

		return statement;
	}

	public static void main(String[] args) throws Exception {
		Statement st = SQL.SQLini();
		String sql = "SELECT * FROM userinfo where U_EMAIL = '"
				+ "249048056@qq.com" + "'";
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			System.out.println(rs.getString("U_PASSWORD"));
		}
	}

}
