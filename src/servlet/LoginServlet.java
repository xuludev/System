package servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utilize.Log;
import utilize.SQL;

public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		if (!email.equals("") && email != null) {
			try {
				Statement st = SQL.SQLini();
				String sql = "SELECT * FROM userinfo where U_EMAIL = '"
						+ email + "'";
				ResultSet rs = st.executeQuery(sql);

				while (rs.next()) {
					if (rs.getString("U_PASSWORD").equals(password)
							&& password != null) {
						// write in log
						String prof = rs.getString("U_PROF");
						String username = rs.getString("U_NAME");
						Log.writeLog(username, prof);

						resp.sendRedirect("../index.jsp");
						System.out.println(rs.getString("U_PASSWORD"));
					} else {
						resp.sendRedirect("../page-login.jsp");
					}
				}

				rs.close();
				st.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			resp.sendRedirect("../page-login.jsp");
		}
	}

	@Override
	public void service(ServletRequest arg0, ServletResponse arg1)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(arg0, arg1);
	}

}
