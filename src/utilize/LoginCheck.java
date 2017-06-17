package utilize;

import java.sql.ResultSet;
import java.sql.Statement;

/**
 * There is no error in the code with the animal protecting!!!!!
 * 
 * @author Mr_L
 *
 */

public class LoginCheck {

	public static void main(String[] args) throws Exception {
		boolean b = checkUser("admin", "admin");
		System.out.println(b);
	}

	/**
	 * check whether the user is valid
	 * 
	 * @param username
	 * @param password
	 * @return
	 * @throws Exception
	 */
	public static boolean checkUser(String username, String password)
			throws Exception {

		Statement st = SQL.SQLini();
		String SqlQuery = "SELECT U_PASSWORD FROM USERINFO WHERE U_NAME = '"
				+ username + "'";
		ResultSet rs = st.executeQuery(SqlQuery);
		String pass = "";
		while (rs.next()) {
			pass = rs.getString("U_PASSWORD");
		}

		rs.close();
		st.close();

		if (!"".equals(pass) && pass.equals(password)) {
			return true;
		} else {
			return false;
		}
	}
}
