package _06_works.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Timestamp;
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

import _00_init.util.GlobalService;
import _00_init.util.SystemUtils2018;
import _06_works.model.WorksBean;
import _06_works.service.WorksService;



@WebServlet("/works.do")
@MultipartConfig(location = "", fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 1024 * 1024
		* 500, maxRequestSize = 1024 * 1024 * 500 * 5)

public class WorksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");		
		Map<String,String> errorMsg = new HashMap<String,String>(); 
		Map<String, String> oKMsg = new HashMap<String, String>();
		HttpSession session = request.getSession();
		request.setAttribute("MsgMap", errorMsg);
		session.setAttribute("OKMsg", oKMsg);
		
		String worksName="";
		String worksIntro="";
		String worksImgName="";
		long sizeInBytes = 0;
		
		//進階設定
		//第一組
		String caption_1 = "";//標題_1
		String detail_1 = "";//內文_1
		String captionImgName_1 = "";//照片_1
		long sizeInBytes_1 = 0;
		
		
		//第二組
		String caption_2 = "";//標題_2
		String detail_2 = "";//內文_2
		String captionImgName_2 = "";//照片_2
		long sizeInBytes_2 = 0;
	
		InputStream is= null;
		InputStream is_1= null; 
		InputStream is_2 = null;

		Collection<Part> parts = request.getParts();
		 
		if (parts != null) { 
		for (Part p : parts) {
			String fldName = p.getName();
			String value = request.getParameter(fldName);
			
			if(p.getContentType() == null) {
				if (fldName.equalsIgnoreCase("worksName")) {
					worksName = value;		
				}else if(fldName.equalsIgnoreCase("worksIntro")){
					worksIntro = value;
				}else if(fldName.equalsIgnoreCase("caption_1")){
					caption_1 = value;				
				}else if(fldName.equalsIgnoreCase("caption_2")){
					caption_2 = value;}	
			}else {
				worksImgName = GlobalService.getFileName(p);
				worksImgName = GlobalService.adjustFileName(worksImgName, GlobalService.IMAGE_FILENAME_LENGTH);
						if (worksImgName != null && worksImgName.trim().length() > 0) {
							sizeInBytes = p.getSize();
							is = p.getInputStream();
						}else {
							errorMsg.put("errorPhoto", "頭像圖片未上傳");
						}
					if(captionImgName_1 != null && captionImgName_1.trim().length() > 0){
						captionImgName_1 = GlobalService.getFileName(p);
						captionImgName_1 = GlobalService.adjustFileName(captionImgName_1, GlobalService.IMAGE_FILENAME_LENGTH);
						sizeInBytes_1 = p.getSize();
						is_1 = p.getInputStream();
					}
					if(captionImgName_2 != null && captionImgName_2.trim().length() > 0){
						captionImgName_2 = GlobalService.getFileName(p);
						captionImgName_2 = GlobalService.adjustFileName(captionImgName_2, GlobalService.IMAGE_FILENAME_LENGTH);
						sizeInBytes_2 = p.getSize();
						is_2 = p.getInputStream();
					}
			}}
				
			if (worksName == null || worksName.trim().length() == 0) {
				errorMsg.put("errorNameEmpty", "未輸入作品名");
			}else {
				session.setAttribute("worksName",worksName);
			}
			if (worksIntro == null || worksName.trim().length() == 0) {
				errorMsg.put("errorIntroEmpty", "未輸入介紹");
			}else {
				session.setAttribute("workIntro",worksIntro);
			}
			if (caption_1 != null || caption_1.trim().length() != 0) {
				session.setAttribute("caption_1",caption_1);
			}
			if (detail_1 != null || detail_1.trim().length() != 0) {
				session.setAttribute("detail_1",detail_1);
			}
			if (caption_2 != null || caption_2.trim().length() != 0) {
				session.setAttribute("caption_2",caption_2);
			}
			if (detail_2 != null ||detail_2.trim().length() != 0) {
				session.setAttribute("detail_2",detail_2);
				}
		}else {
				errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
			}
		if (!errorMsg.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("_01_register/Register.jsp");
			rd.forward(request, response);
			return;
		}
			
		try {
				ServletContext sc = getServletContext();
				WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);
				WorksService Worksservice = ctx.getBean(WorksService.class);
					
					Timestamp ts = new java.sql.Timestamp(System.currentTimeMillis());
					String regday = ts.toString(); // 1029改String
					Blob blobWorkImg = SystemUtils2018.fileToBlob(is, sizeInBytes);
					Blob captionImg_1 = SystemUtils2018.fileToBlob(is_1, sizeInBytes_1);
					Blob captionImg_2 = SystemUtils2018.fileToBlob(is_2, sizeInBytes_2);

					WorksBean bean = new WorksBean(null, worksName, worksIntro, worksImgName, blobWorkImg, regday, caption_1, detail_1, captionImgName_1, captionImg_1,caption_2, detail_2, captionImgName_2, captionImg_2); // 1029改String
					
					int n = Worksservice.saveWorks(bean);					
					if (n == 1) {
						oKMsg.put("InsertOK", "<Font color='red'>輸入OK</Font>");
						response.sendRedirect("_01_register/RegisterSuccess.jsp");
						return;
					} else {
						errorMsg.put("errorIDDup", "新增此筆資料有誤(RegisterServlet)");
					}
				
					if (!errorMsg.isEmpty()) {
						RequestDispatcher rd = request.getRequestDispatcher("_01_register/Register.jsp");
						rd.forward(request, response);
						return;
					}
				} catch (Exception e) {
					e.printStackTrace();
					errorMsg.put("errorIDDup", e.getMessage());
					RequestDispatcher rd = request.getRequestDispatcher("_01_register/Register.jsp");
					rd.forward(request, response);
				}

	}
}