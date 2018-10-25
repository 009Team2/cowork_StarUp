package _20_productMaintain.controller;

import java.io.IOException;
import java.util.Collection;

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

import _00_init.util.GlobalService;
import _01_register.model.UserBean;
import _03_listProducts.model.ProductBean;
import _03_listProducts.service.ProductService;

@WebServlet("/_20_productMaintain/DisplayPageProducts")
public class DisplayMaintainProducts extends HttpServlet {

	private static final long serialVersionUID = 1L;
	int pageNo = 1;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 先取出session物件
		HttpSession session = request.getSession(false);
		// 紀錄目前請求的RequestURI,以便使用者登入成功後能夠回到原本的畫面
		String requestURI = request.getRequestURI();
		// System.out.println("requestURI=" + requestURI);
		// 如果session物件不存在
		if (session == null || session.isNew()) {
			// 請使用者登入
			response.sendRedirect(response.encodeRedirectURL("../_02_login/login.jsp"));
			return;
		}
		session.setAttribute("requestURI", requestURI);
		// 此時session物件存在，讀取session物件內的LoginOK
		// 以檢查使用者是否登入。
		UserBean mb = (UserBean) session.getAttribute("LoginOK");
		if (mb == null) {
			response.sendRedirect(response.encodeRedirectURL("../_02_login/login.jsp"));
			return;
		}

		String pageNoStr = request.getParameter("pageNo");
		if (pageNoStr == null) {
			pageNo = 1;
		} else {
			try {
				pageNo = Integer.parseInt(pageNoStr.trim());
			} catch (NumberFormatException e) {
				pageNo = 1;
			}
		}
		
		// 本類別負責讀取資料庫內Book表格內某一頁的紀錄，並能新增紀錄、修改紀錄、刪除記錄等		
		ProductService service;
		ServletContext sc = getServletContext();
		WebApplicationContext ctx = 
				WebApplicationContextUtils.getWebApplicationContext(sc);
		service = ctx.getBean(ProductService.class);
			
		request.setAttribute("prodBean", service);

		service.setPageNo(pageNo);
		
		service.setRecordsPerPage(GlobalService.MAINTAIN_PER_PAGE);
		Collection<ProductBean> coll = service.getPageProds();
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("totalPages", service.getTotalPages());
		request.setAttribute("products_DPP", coll);
		// 交由listProducts.jsp來顯示某頁的書籍資料，同時準備『第一頁』、
		// 『前一頁』、『下一頁』、『最末頁』等資料
		RequestDispatcher rd = request.getRequestDispatcher("ProductMaintainList.jsp");
		rd.forward(request, response);
		return;
	}
}