package servlet;

import java.io.IOException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import utilize.SQL;

public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		String email = req.getParameter("email");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String[] prof = req.getParameterValues("prof");

		try {
			Statement st = SQL.SQLini();
			String sqlInsert = "INSERT INTO userinfo VALUES('" + email + "','"
					+ username + "','" + password + "','" + prof[0] + "')";
			int i = st.executeUpdate(sqlInsert);
			if (i > 0) {
				JOptionPane.showMessageDialog(null, "注册成功！");
				System.out.println("Register successfully");
			}
			resp.sendRedirect("../page-register.html");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
