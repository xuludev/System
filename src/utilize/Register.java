package utilize;

import java.sql.Statement;

public class Register {

	public static int register(String username, String password)
			throws Exception {
		Statement st = SQL.SQLini();
		int t = 0;

		if (username != null && !username.trim().equals("") && password != null
				&& !password.trim().equals("")) {
			String sql = "INSERT INTO userinfo VALUES('" + username + "','"
					+ password + "')";
			t = st.executeUpdate(sql);
		}

		st.close();
		System.out.println(t);
		return t;
	}
}
