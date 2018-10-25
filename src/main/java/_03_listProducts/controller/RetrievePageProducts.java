package _03_listProducts.controller;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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

@WebServlet("/_03_listProducts/DisplayPageProducts")
//本控制器負責進行必要的前置作業，以便Dao取回某一頁的商品資料
public class RetrievePageProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private static final double VAT = GlobalService.VAT;
	
	int pageNo = 1;

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
//				if (session == null) {
//					// 請使用者登入
//					response.sendRedirect(response.encodeRedirectURL("../_03_login/loginError.jsp"));
//					return;
//				}
//				// 登入成功後，Session範圍內才會有LoginOK對應的MemberBean物件
//				ub = (UserBean) session.getAttribute("LoginOK");
//				// 取出使用者的memberId，後面的Cookie會用到 
//				userId = ub.getUser_id();
//				// ProductService介面負責讀取資料庫內Product表格內某一頁的商品資料，並能新增、修改、刪除

		// 讀取瀏覽送來的 pageNo
		String pageNoStr = request.getParameter("pageNo");
		String category = request.getParameter("category");
		String prodType = request.getParameter("prod_type");
//		// 如果讀不到，直接點選主功能表的『購物』就不會送 pageNo給後端伺服器
//		if (pageNoStr == null) {  
//			pageNo = 1;
//			// 讀取瀏覽器送來的所有 Cookies
//			Cookie[] cookies = request.getCookies();
//			if (cookies != null) {
//				// 逐筆檢視Cookie內的資料
//				for (Cookie c : cookies) {
//					if (c.getName().equals(userId + "pageNo")) {
//						try {
//							pageNo = Integer.parseInt(c.getValue().trim());
//						} catch (NumberFormatException e) {
//							;
//						}
//						break;
//					}
//				}
//			}
//		} else {
//			try {
//				pageNo = Integer.parseInt(pageNoStr.trim());
//			} catch (NumberFormatException e) {
//				pageNo = 1;
//			}
//		}

//		service = new ProductServiceImpl();
		ServletContext sc = getServletContext();
		WebApplicationContext ctx = 
				WebApplicationContextUtils.getWebApplicationContext(sc);
		ProductService service= ctx.getBean(ProductService.class);
		//
		// 讀取一頁的書籍資料之前，告訴service，現在要讀哪一頁
		service.setPageNo(pageNo);
		service.setProdCategory(category);
		service.setProdType(prodType);
		request.setAttribute("prodBean", service);
		// service.getPageBooks()方法開始讀取一頁的書籍資料
		if(category != null) {		//抓到不同分類的商品(e.x.暖心小物
			Collection<ProductBean> coll = service.getCategoryProds();
			System.out.println(coll);
			request.setAttribute("category", category);
			request.setAttribute("pageNo", pageNo);
			request.setAttribute("totalPages", (int) (Math.ceil(coll.size() / (double) GlobalService.RECORDS_PER_PAGE)));
			// 將讀到的一頁資料放入request物件內，成為它的屬性物件
			request.setAttribute("products_cate", coll);
		}else if(prodType != null){			//單獨抓到周邊或桌遊商品
			Collection<ProductBean> coll = service.getTypeProds();
			System.out.println(coll);
			request.setAttribute("type", prodType);
			request.setAttribute("pageNo", pageNo);
			request.setAttribute("totalPages", (int) (Math.ceil(coll.size() / (double) GlobalService.RECORDS_PER_PAGE)));
			// 將讀到的一頁資料放入request物件內，成為它的屬性物件
			request.setAttribute("products_type", coll);
		}else {
			Collection<ProductBean> coll = service.getPageProds();
			request.setAttribute("pageNo", pageNo);
			request.setAttribute("totalPages", service.getTotalPages());
			// 將讀到的一頁資料放入request物件內，成為它的屬性物件
			request.setAttribute("products_DPP", coll);
		}
											   
		// 使用Cookie來儲存目前讀取的網頁編號，Cookie的名稱為memberId + "pageNo"
		// -----------------------
		Cookie pnCookie = new Cookie(userId + "pageNo", String.valueOf(pageNo));
	    // 設定Cookie的存活期為30天
		pnCookie.setMaxAge(30 * 24 * 60 * 60);
	    // 設定Cookie的路徑為 Context Path		
		pnCookie.setPath(request.getContextPath());
		// 將Cookie加入回應物件內
		response.addCookie(pnCookie);
		// -----------------------
		// 交由listBooks.jsp來顯示某頁的書籍資料，同時準備『第一頁』、
		// 『前一頁』、『下一頁』、『最末頁』等資料
		RequestDispatcher rd = request.getRequestDispatcher("/_03_product/listProducts.jsp");
		rd.forward(request, response);
		return;

	}
}