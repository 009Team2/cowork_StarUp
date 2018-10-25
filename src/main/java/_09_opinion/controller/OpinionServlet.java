package _09_opinion.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import _09_opinion.model.OpinionBean;
import _09_opinion.service.OpinionService;





@WebServlet("/opinion.do")
@MultipartConfig
public class OpinionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8"); // 文字資料轉內碼
		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsg = new HashMap<String, String>();
		// 準備存放成功訊息的Map物件
		Map<String, String> msgOK = new HashMap<String, String>();
		// 註冊成功後將用response.sendRedirect()導向新的畫面，所以需要 session物件來存放共用資料。
		HttpSession session = request.getSession();
		request.setAttribute("MsgMap", errorMsg); // 顯示錯誤訊息
		session.setAttribute("MsgOK", msgOK); // 顯示正常訊息

		String opinionName = "";
		String opinionMail = "";
		String opinionPhone = "";
		String opinionField = "";
		InputStream is = null;

		// 取出HTTP multipart request內所有的parts
		Collection<Part> parts = request.getParts();

		// 由parts != null來判斷此上傳資料是否為HTTP multipart request

			if (parts != null) {
				for (Part p : parts) {
					String fldName = p.getName();
					String value = request.getParameter(fldName);
					
					if (p.getContentType() == null) {
						if (fldName.equalsIgnoreCase("opinionname")) {
							opinionName= value;
						} else if (fldName.equalsIgnoreCase("opinionmail")) {
							opinionMail = value;
						} else if (fldName.equalsIgnoreCase("opinionphone")) {
							opinionPhone = value;
						}else if (fldName.equalsIgnoreCase("opinionfield")) {
							opinionField = value;
				}
			}
	
		}
				if (opinionName == null || opinionName.trim().length() == 0) {
					errorMsg.put("errorIDEmpty", "姓名未輸入");
				}else {
					session.setAttribute("opinionName",opinionName);
				}
				if (opinionMail == null || opinionMail.trim().length() == 0) {
					errorMsg.put("errorIDEmpty", "電子郵件未輸入");
				}else {
					session.setAttribute("opinionMail",opinionMail);
				}
				if (opinionPhone == null || opinionPhone.trim().length() == 0) {
					errorMsg.put("errorIDEmpty", "電話未輸入");
				}else {
					session.setAttribute("opinionPhone",opinionPhone);
				}
				if (opinionField == null || opinionField.trim().length() == 0) {
					errorMsg.put("errorIDEmpty", "內容未輸入");
				}else {
					session.setAttribute("opinionField",opinionField);
				}
			}else {
				errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
					}
			if (!errorMsg.isEmpty()) {
				RequestDispatcher rd = request.getRequestDispatcher("opinion.jsp");
				rd.forward(request, response);
				return;
			}
			//OpinionService opinionservice = new OpinionService();
			
			ServletContext sc = getServletContext();
			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);
			OpinionService OpinionService = ctx.getBean(OpinionService.class);
			OpinionBean op = new OpinionBean(null, opinionName, opinionMail, opinionPhone, opinionField);
			int n = OpinionService.saveOpinion(op);
			if (n == 1) {
				msgOK.put("InsertOK", "<Font color='red'>輸入OK</Font>");
				response.sendRedirect("_09_opinion/OpinionSuccess.jsp");
				return;
			} else {
				errorMsg.put("errorIDDup", "新增此筆資料有誤(OpinionServlet)");
			}
		
		if (!errorMsg.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("Opinion.jsp");
			rd.forward(request, response);
			return;
		}
	}
	}
