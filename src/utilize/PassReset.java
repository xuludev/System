package utilize;

import java.sql.Statement;

public class PassReset {
	public static void resetPass(String email) {

		int i = 0;
		try {
			Statement st = SQL.SQLini();
			if (email != null && !"".equals(email)) {
				String sql = "UPDATE userinfo SET U_PASSWORD = '123456' WHERE U_EMAIL = '"
						+ email + "'";
				i = st.executeUpdate(sql);
				if (i > 0) {
					System.out.println("update successfully!");
				}
			}
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
