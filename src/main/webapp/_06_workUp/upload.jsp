<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<jsp:include page="/fragment/header.jsp" />


 <!-- 上傳作品頁面 -->
  <div class="u-box" style=" width: 100%; height:2100px; display:-ms-inline-grid; margin-left: 250px;">
            <div class="u-container">


                <span style="margin-left:800px;">
                    <img class="rounded-circle" height='55px' width='55px' src="../images/dir.jpg" style="margin-top: 30px;margin-left:80px;">
                </span>
                <p class="u-username" style="float: right;margin-top:45px;margin-right: 170px;">By 此木創遊 The Wood
                    Games </p>
                <div class="form-group" style="margin-top:15px;margin-right: 230px;">
                    <input type="text" class="form-control" placeholder="輸入作品名稱" id="inputDefault" style="width:200px;float: right;margin-left: 5px;">
                    <p class="u-username" style="float: right;margin-bottom: 50px;">作品名稱</p>
                </div>



                <div class="form-group" style="width:800px;margin-left:50px;">
                    <img style="width:800px; height:400px; border: 1px solid;margin-top:-80px;">
                    <div style="margin-top: 10px;">
                        <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp">
                    </div>
                    <div class="dis-font" style="margin-bottom: -60px;">
                        <p class="">作品概述</p>
                        <textarea class="form-control" id="exampleTextarea" rows="9"></textarea>
                    </div>
                </div>
                <div style="width:350px; margin-left: 920px;">
                    <button type="button" class="btn btn-danger" style="width:400px;">發布作品</button>
                </div>
            </div>

        </div>









   <jsp:include page="/fragment/footer.jsp" />  