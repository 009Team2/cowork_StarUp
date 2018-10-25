
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/fragment/header.jsp" />
<c:set var="funcName" value="REG" scope="session" />
<div class="container col-sm-4">
	<div class="card text-white bg-info mb-3" style="max-width: 50rem;">
		<div class="card-header">意見完成</div>
		<div class="card-body">
			<h4 class="card-title" style="margin:0 auto;">  
				Thank You~
			</h4>
			<div style="clear: both;"></div>
			<p class="card-text">
				姓名：<%=session.getAttribute("opinionName")%></p>
			<p class="card-text">
				電子郵件：<%=session.getAttribute("opinionMail")%></p>
			<p class="card-text">
				連絡電話：<%=session.getAttribute("opinionPhone")%></p>
			<p class="card-text">
				您的建議：<%=session.getAttribute("opinionField")%></p>
		</div>

	</div>
</div>


<jsp:include page="/fragment/footer.jsp" />
