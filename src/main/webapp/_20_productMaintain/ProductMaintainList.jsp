<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<jsp:useBean id="ProdBean" class="_03_listProducts.repository.Impl.ProductDaoImpl" />

<!--  
  // 程式功能: 
  //  1. 顯示所有書籍(商品)資訊，書籍資訊以分頁的方式顯示，每頁顯示四筆書籍。
  //     使用者可以按下『第一頁』、『前一頁』、『下一頁』與『最後頁』逐頁地
  //     瀏覽商品。
  //  2. 提供『新增書籍』資料、『修改書籍資料』與『刪除某本書籍』的功能。
  //     
  //  3. 當使用者要新增某本書籍資料時，直接按下右上角『新增書籍』的超連結便可
  //     進入『新增書籍資料』的畫面(由BookInsert.php提供)，輸入新的書籍資料。
  //     當使用者要修改某本書籍資料時，可直接點選該本書籍的『書名』超連結，便
         可進入『更新書籍資料』的畫面(由BookUpdate.php提供)，可對該本書籍進行
         資料修改或刪除紀錄。
-->
<!-- 下列敘述設定變數funcName的值為BMT，top.jsp 會用到此變數 -->
<c:set var="funcName" value="BMT" scope="session" />
<!-- 引入共同的頁首 -->
<jsp:include page="/fragment/header.jsp" />

<div style="height: 250px; width: 300px; position: absolute; left: 37%;">
	<nav class="nav flex-column nav-tabs">
		<a class="nav-link active">&nbsp;&nbsp;※ 請點選商品圖片，進入修改頁 ※</a>
	</nav>
</div>
<br><br>
<div class="container col-lg-10"
	style="display: flex; justify-content: space-between; flex-wrap: wrap;">
	<!-- -------------------------------------------------------------- -->
	<c:forEach varStatus="stVar" var="ProductBean" items="${products_DPP}">
		<div class="box"
			style="background-color: rgba(255, 255, 255, 0.5); height: 390px; width: 300px; padding: 10px 25px; border-radius: 5px; box-shadow: 3px 3px 3px rgb(2, 14, 53); margin: 20px 0px;">
			<div class="imgFrame"
				style="height: 250px; width: 250px; overflow: hidden; display: flex; justify-content: center; margin: 5px 0px; box-shadow: 1px 1px 1px rgb(2, 14, 53);">
				<img
					src='${pageContext.servletContext.contextPath}/Util/getImage?id=${ProductBean.prod_id}&type=PRODUCT'
					style="width: 100%; height: 100%;">
			</div>
			<div class="textFrame" style="height: 100px; width: 300px;">
				<p class="prodName"
					style="margin: 0px; font-weight: 600; font-size: 17px;">${ProductBean.prodName}</p>
				<p class="company" style="margin: 0px; font-weight: 100;">By
					${ProductBean.prodCompany}</p>
				<p class="intro"
					style="margin: 0px; font-weight: 400; font-size: 14px; width: 260px; height: 30px;">${ProductBean.prodIntro}</p>
				<p style="margin-top:20px; margin-left:180px; font-weight: 600; font-size: 20px; display:inline; color:#443966;">NT$ ${ProductBean.prodPrice}</p>
			</div>
		</div>
	</c:forEach>
</div>


<!-- 	<div id='main'> -->
<%-- 		<center>${ ProductDeleteMsg }<br> --%>
<%-- 			<c:remove var="ProductDeleteMsg" /> --%>
<!-- 			<div id="insert"> -->
<!-- 				<a href="#">新增紀錄</a> -->
<!-- 			</div> -->
<!-- 			<table border='2' width="690"> -->
<!-- 				  購物車的標題   -->
<!-- 				<TR> -->
<!-- 					<TD colspan='3'> -->
<!-- 						<TABLE width="680" BORDER='0' style="background: #ffE4C4"> -->
<!-- 							<TR height='5'> -->
<!-- 								<TD align='center'>&nbsp;</TD> -->
<!-- 							</TR> -->
<!-- 							<TR height='30'> -->
<!-- 								<TD align='center'><FONT color='#8000FA' size='+2' -->
<!-- 									style="font-weight: 900;"> 商品資料維護 </FONT></TD> -->
<!-- 							</TR> -->
<!-- 							<TR height='5'> -->
<!-- 								<TD align='center'>&nbsp;</TD> -->
<!-- 							</TR> -->
<!-- 						</TABLE> -->
<!-- 					</TD> -->
<!-- 				</TR> -->
<!-- 				
<!--       forEach 顯示購物車的內容 -->
<!--       識別字串products_DPP為_03_listBooks.controller.DisplayPageProducts.java放入 -->
<!--       request物件 -->
<!--    -->

<%-- 				<c:forEach varStatus="stVar" var="aProductBean" items="${products_DPP}"> --%>
<!-- 					用兩種顏色交替使用作為顯示商品資料的背景底色 -->
<%-- 					<c:set var="rowColor" value="#DEFADE" /> --%>
<%-- 					<c:if test="${ stVar.count % 2 == 0 }"> --%>
<%-- 						<c:set var="rowColor" value="#FFEBFF" /> --%>
<%-- 					</c:if> --%>

<%-- 					<tr height='18' bgColor="${rowColor}"> --%>
<!-- 						<td width='600' colspan='2' align='left'> -->
<!-- 							<table border='1' width='600'> -->
<!-- 								<tr> -->
<!-- 									<td width='600' align="left">書名：<a -->
<%-- 										href="BookUpdate.jsp?PRODID=${aProductBean.prod_id}&pageNo=${pageNo}">${aProductBean.prodName}</a> --%>

<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 							</table> -->
<!-- 						</td> -->
<!-- 						<td rowspan='3' width='80'> -->
<!-- 							
<!--                  getImage所對應的Servlet會到資料庫讀取圖片並傳送給前端的瀏覽器 -->
<!--               -->
<!--  img height='100' width='80'-->
<%-- 							src='${pageContext.servletContext.contextPath}/Util/getImage?id=${aProductBean.prod_id}&type=PRODUCT'> --%>
<!-- 						</td> -->
<!-- 					</tr> -->

<!-- 					  以上為書名資料   -->
<%-- 					<TR height='18' bgColor="${rowColor}"> --%>
<!-- 						<TD width='600' align='left'> -->
<!-- 							<TABLE border='1' width='600'> -->
<!-- 								<TR> -->
<%-- 									<TD width='400' align="left">作者：${aProductBean.prodCompany}</TD> --%>
<!-- 							</TABLE> -->
<!-- 						</TD> -->
<!-- 					</TR> -->
<!-- 					  以上為作者、出版社資料   -->
<%-- 					<TR bgColor="${rowColor}"> --%>
<!-- 						<TD width='600' align='left'> -->
<!-- 							<TABLE border='1' width='600'> -->
<!-- 								<TR> -->
<%-- 									<TD width='160' align="left">書號：${aProductBean.prod_id}</TD> --%>
<%-- 									<TD width='140' align="left">訂價：<fmt:formatNumber --%>
<%-- 											value="${aProductBean.prodPrice}" pattern="####" />元 --%>
<!-- 									</TD> -->
<%-- 									<c:if test="${aProductBean.discount != 1}"> --%>
<!-- 										<TD width='260' align="left"><Font color='red'> -->
<%-- 												${aProductBean.discountStr},&nbsp; 實售<fmt:formatNumber --%>
<%-- 													value="${aProductBean.prodPrice*aProductBean.discount}" --%>
<%-- 													pattern="####" /> 元,&nbsp;省<fmt:formatNumber --%>
<%-- 													value="${aProductBean.prodPrice - aProductBean.prodPrice*aProductBean.discount}" --%>
<%-- 													pattern="####" />元 --%>
<!-- 										</Font></TD> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${aProductBean.discount == 1}"> --%>
<!-- 										<TD width='260'>&nbsp;</TD> -->
<%-- 									</c:if> --%>
<!-- 								</TR> -->
<!-- 							</TABLE> -->
<!-- 						</TD> -->
<!-- 					</tr> -->
<!-- 					  以上為書號、訂價、實售資料   -->
<%-- 				</c:forEach> --%>
<!-- 			</TABLE> -->
<!-- 		</CENTER> -->
<!-- 	</div> -->
<!-- 	<div id="bpaging"> -->
<!-- 		<!-- 以下為控制第一頁、前一頁、下一頁、最末頁 等超連結-->

<!-- 		<div style="display: flex; width: 100%; justify-content: center; "> -->
<!--                         <ul class="pagination"> -->
<!--                       		<li class="page-item"> -->
<!--                            			 <a class="page-link" href="#">&laquo;</a> -->
<!--                        		 </li> -->
<%--                       	<c:forEach var="i" begin="1" end="${totalPages}" step="1"> --%>
<!-- 	                         <li class="page-item"> -->
<%-- 	                          		  <a class="page-link" href="<c:url value='DisplayPageProducts?pageNo=${i}' />">${i}</a> --%>
<!-- 	                         </li> -->
<%--                       	</c:forEach> --%>
<!--                         <li class="page-item"> -->
<!--                             <a class="page-link" href="#">&raquo;</a> -->
<!--                         </li> -->
<!--                         </ul> -->
<!--                 </div> -->
<!-- 	</div> -->

<!-- </html> -->