<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<jsp:include page="/fragment/header.jsp" />   

        <!-- -------------------------navgation end----------------------------- -->
      
            <form action='ProductMaintain.do' method="POST"  enctype="multipart/form-data">
            
            
            <div class="container col-lg-10" style=" display: flex; ">  
          		 <div class="prodImg col-lg-7" style="z-index:0;margin: 10px 0px 30px 20px; background-color: rgba(255, 255, 255, 0.699); box-shadow: 1px 1px 3px black; border-radius: 5px;">
                    <div id="dropZone" style="margin-top:10px;border:grey solid 1px;width:400;height:300px;overflow:hidden">  
                        <img alt="" src="" id="previewImg" style="width:100%">
                    </div>    
                    <div>
                    	  <label for="photo">請選擇要上傳的圖片</label>
            			  <input id="uploadImg" type="file" class="form-control-file" name="prodPhoto" id="exampleInputFile" aria-describedby="fileHelp">
                    </div>
                    <hr> 
                    <p style="font-size:20px; color:#123d82; text-align:center; margin:0px;">商品說明</p>   
                    <textarea rows="5" cols="85"> 原本的商品說明，用el取出來</textarea> 
                
                </div>  
                <div class="prodInfo col-lg-5" >
                    <div class="upper" style="margin: 10px 0px; padding: 20px; background-color: rgba(255, 255, 255, 0.767); border-radius: 5px; box-shadow: 1px 1px 3px black">
                        <input type="text" name="prodName" value="原本的商品名" style="margin-bottom:15px">  
                        <br>
                        NT$<input type="number" name="prodPrice" value="1500"> 
                        <div class="styled-select blue semi-square">
	                       
                        </div>    
                    
                        <p>小計：</p>  
                        <button class="btn btn-info" style="width:100%; font-weight:300;font-size:20px" disabled>加入購物車</h4> </button>
                    </div>
                    <div class="lower" style=" margin: 10px 0px; padding: 20px 10px; background-color: rgba(255, 255, 255, 0.733); border-radius: 5px; box-shadow: 1px 1px 3px black">
                        <ul>
                            <li>
                                玩家人數: <input type="text" name="playerNum" value="原本的人數">  
                            </li>
                            <li>
                                遊戲時間: <input type="text" name="playTimes" value="原本的分鐘數">
                            </li>
                            <li>
                                適合年齡：<input type="text" name="playAge" value="原本的年齡">
                            </li>                            
                            <li>
                                    規則說明： <br>
                                    <textarea rows="3" cols="45"></textarea>    
                            </li>
                        </ul>
                    </div>
                    
                    <button class="btn btn-danger" style="width: 350px">提交修改</button>                
                </div>         
            </div>
        </div>
        </form>
         
     <jsp:include page="/fragment/footer.jsp" />   