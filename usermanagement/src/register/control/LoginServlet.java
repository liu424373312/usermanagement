package register.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import register.dao.UserDAO;
import register.dao.UserDAOImpl;

public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String role = "";
		String goForward;

		UserDAO userDAO = new UserDAOImpl();
		role = userDAO.validate(userName, password);
		if (role.equals("普通用户")) {
			goForward = "userPage.jsp";
		} else if (role.equals("管理员")) {
			goForward = "manageUser.jsp";
		} else {
			goForward = "login.jsp";
		}
		request.setAttribute("userName", userName);
		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher(goForward);
		requestDispatcher.forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
