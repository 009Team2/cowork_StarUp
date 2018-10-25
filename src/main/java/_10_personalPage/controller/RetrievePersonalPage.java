package _10_personalPage.controller;

import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import _01_register.model.UserBean;
import _01_register.service.UserService;

@WebServlet("/_10_personalPage/DisplayPersonalPage")
public class RetrievePersonalPage extends HttpServlet {

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 先取出session物件
		HttpSession session = request.getSession(false);
		UserBean ub = null;
		Integer userId = 0;
		// 如果session物件不存在
				if (session == null) {
					// 請使用者登入
					response.sendRedirect(response.encodeRedirectURL("../_03_login/loginError.jsp"));
					return;
				}
				// 登入成功後，Session範圍內才會有LoginOK對應的MemberBean物件
				ub = (UserBean) session.getAttribute("LoginOK");
				// 取出使用者的memberId，後面的Cookie會用到 
				userId = ub.getUser_id();
				
				ServletContext sc = getServletContext();
				WebApplicationContext ctx = 
						WebApplicationContextUtils.getWebApplicationContext(sc);
				UserService service= ctx.getBean(UserService.class);
				ub = service.getUser(userId);
				request.setAttribute("nickname", ub.getNickname());
				request.setAttribute("account", ub.getAccount());
				request.setAttribute("user_id", ub.getUser_id());
				Clob introduction = ub.getIntroduction();
				System.out.println(introduction);
				String intro = null;
				if(introduction != null) {
					try {
						intro =  introduction.getSubString(1, (int) introduction.length());
					} catch (SQLException e) {				
						e.printStackTrace();
					}
					System.out.println(intro);
					request.setAttribute("intro", intro);					
				}
				RequestDispatcher rd = request.getRequestDispatcher("/_10_personalPage/personalPage.jsp");
				rd.forward(request, response);
				return;
	}
}
