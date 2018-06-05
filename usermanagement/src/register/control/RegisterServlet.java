package register.control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import register.dao.UserDAO;
import register.dao.UserDAOImpl;
import register.model.User;

public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User userBean = new User();
		UserDAO userDAO = new UserDAOImpl();

		userBean.userName = request.getParameter("userName");
		userBean.password = request.getParameter("password");
		userBean.gender = request.getParameter("gender");
		userBean.email = request.getParameter("email");
		userBean.age = Integer.parseInt(request.getParameter("age"));
		userBean.role = "∆’Õ®”√ªß";

		userDAO.saveUser(userBean);
		request.setAttribute("userBean", userBean);
		RequestDispatcher requestDispatcher = request
				.getRequestDispatcher("login.jsp");
		requestDispatcher.forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
