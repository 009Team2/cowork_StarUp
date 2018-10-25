
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/fragment/header.jsp" />
<c:set var="funcName" value="REG" scope="session" />

<body>
	<div class="container">
		<form ENCTYPE="multipart/form-data" method="POST"
			action="<c:url value='/opinion.do' />" id="/opinion.do">
			<fieldset>
				<legend>意見回覆</legend>
				<p>${MsgMap.InsertNG}${MsgMap.errorSaveData}</p>
				<section class="container col-sm-6">

					<!--意見回覆表格內容 -->
					<div class="form-group col-sm-8">
						<label for="opinionName">姓名:</label> <input type="text"
							class="form-control" name="opinionName"
							value="${param.opinionName}" id="opinionName"
							aria-describedby="emailHelp" placeholder="請輸入姓名">
						<p style="color: #b2b2b2;">
							<small>${MsgMap.errorIDEmpty}${MsgMap.errorIDDUp}</small>
						</p>
					</div>

					<div class="form-group col-sm-8">
						<label for="opinionMail">電子郵件:</label> <input type="email"
							class="form-control" name="opinionMail"
							value="${param.opinionMail}" id="opinionMail"
							aria-describedby="emailHelp" placeholder="請輸入常用信箱">
						<p style="color: #b2b2b2;">
							<small>${MsgMap.errorIDEmpty}${MsgMap.errorIDDUp}</small>
						</p>
					</div>
					<div class="form-group col-sm-8">
						<label for="opinionPhone"> 連絡電話:</label> <input type="text"
							class="form-control" name="opinionPhone"
							value="${param.opinionPhone}" id="opinionPhone"
							aria-describedby="emailHelp" placeholder="請輸入連絡電話">
						<p style="color: #b2b2b2;">
							<small>${MsgMap.errorIDEmpty}${MsgMap.errorIDDUp}</small>
						</p>
						<div class="form-group col-sm-10">
							<label for="introduction">訪客意見:</label>
							<textarea class="form-control" name="opinionField"
								id="opinionField" rows="5"></textarea>
						</div>
					</div>
				</section>
			</fieldset>
			<input type="submit" class="btn btn-primary btn-lg btn-block"
				name="submit" id="submit" value="Submit"
				style="margin-bottom: 50px;">
			</form>
	</div>
</body>
<jsp:include page="/fragment/footer.jsp" />

