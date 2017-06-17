package servlet;

import java.io.IOException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import utilize.SQL;

public class SubscribeServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String email = req.getParameter("email");
		try {
			Statement st = SQL.SQLini();
			int i = st.executeUpdate("INSERT INTO subscribenew VALUES('"
					+ email + "')");
			if (i > 0) {
				System.out.println("subscribe successfully !");
				JOptionPane.showMessageDialog(null, "订阅成功");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		resp.sendRedirect("../index.jsp");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		super.doGet(req, resp);
	}
}
