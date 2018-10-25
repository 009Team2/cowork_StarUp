<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<jsp:include page="/fragment/header.jsp" />
     
        <!-- -------------------------navgation end----------------------------- -->
        <div class="content container-fluid" style="display: flex; padding: 0px;">
            <!-- 側邊欄 -->
            <div class="section col-lg-2" style="width:100px; padding: 20px 0px;">
            <!-- 設定管理者帳號starup@gamil.com才能進入商城的 維護-商品管理ProductMaintainList.jsp-->
            <c:if test="${!empty BOSS}">
                <nav class="nav flex-column nav-tabs">
                	<a class="nav-link active">維護</a>
                	<a class="nav-link" href="<c:url value='/_20_productMaintain/DisplayPageProducts'/>" style="color:#dfc2ef; font-weight:400;">商品管理</a>
               	</nav>
			</c:if>
                <nav class="nav flex-column nav-tabs">
                    <a class="nav-link active" href="<c:url value='/_03_listProducts/DisplayPageProducts'/>">分類商品</a>
                    <a class="nav-link" href="<c:url value='/_03_listProducts/DisplayPageProducts?page=1&prod_type=文創周邊'/>" style="color:#dfc2ef; font-weight:400;">
                    	<i class="fas fa-gift"></i>  文創周邊
                    </a>
                    		
                    			<a class="dropdown-item" href="<c:url value='/_03_listProducts/DisplayPageProducts?page=1&category=暖心'/>">暖心小物</a>
    							<a class="dropdown-item" href="<c:url value='/_03_listProducts/DisplayPageProducts?page=1&category=城市'/>">城市紋理</a>
    							<a class="dropdown-item" href="<c:url value='/_03_listProducts/DisplayPageProducts?page=1&category=質感'/>">質感選物</a>
    						
                    <a class="nav-link" href="<c:url value='/_03_listProducts/DisplayPageProducts?page=1&prod_type=原創桌遊'/>" style="color:#dfc2ef; font-weight:400;">
                    	<i class="fas fa-user-astronaut"></i>  原創桌遊
                    </a>
                    		
                    			<a class="dropdown-item" href="<c:url value='/_03_listProducts/DisplayPageProducts?page=1&category=1~3人'/>">建議遊玩：1 ~ 3人</a>
    							<a class="dropdown-item" href="<c:url value='/_03_listProducts/DisplayPageProducts?page=1&category=3~5人'/>">建議遊玩：3 ~ 5人</a>
    							<a class="dropdown-item" href="<c:url value='/_03_listProducts/DisplayPageProducts?page=1&category=5~10人'/>">建議遊玩：5 ~ 10人</a>
    						
                </nav>
                <nav class="nav flex-column nav-tabs">
                        <a class="nav-link active">人氣商品推薦</a>
                        <a class="nav-link" href="#" style="color:#dfc2ef; font-weight:400;">每週新品</a>
                        <a class="nav-link" href="#" style="color:#dfc2ef; font-weight:400;">熱銷推薦</a>
                </nav>
                <nav class="nav flex-column nav-tabs">
                        <a class="nav-link active">購物專區</a>
                        <a class="nav-link" href="#" style="color:#dfc2ef; font-weight:400;">結帳</a>
                        <a class="nav-link" href="#" style="color:#dfc2ef; font-weight:400;">訂單查詢</a>
                </nav>
            </div>
             
            <div class="container col-lg-10" style=" display: flex; ">  
          		 <div class="prodImg col-lg-7" style="margin: 10px 0px 30px 20px; background-color: rgba(255, 255, 255, 0.699); box-shadow: 1px 1px 3px black; border-radius: 5px;">
                    <div class="imgBlock" style="margin:10px; box-shadow: 1px 1px 1px black">
                        <img src="../images/擊敗王-2.jpg" style="width: 100%;">
                    </div>
                    <hr> 
                    <p style="font-size:20px; color:#123d82; text-align:center; margin:0px;">商品說明</p>   
                    <p style="line-height:30px;width:500px; margin-left:30px">
                    	職場縮影化身為桌遊亂鬥，  
                        現今社會上對於職場倫理的解讀已經越來越偏差，  
                        人們從團結向上走向自私自利，有能力的人不一定能夠升官，
                        相反的，懂得討好上司，裝腔作勢的人卻容易平步青雲，
                        加上慣老闆對於員工的態度問題，讓大家在職場更顯無助。
                        這個遊戲就是針對疲累的上班族設計，
                        讓你體會一下身為擊敗人的感覺，
                        或許，你會在這個遊戲裡面找到不同的自己.....
                </div>  
                <div class="prodInfo col-lg-5" >
                    <div class="upper" style="margin: 10px 0px; padding: 20px; background-color: rgba(255, 255, 255, 0.767); border-radius: 5px; box-shadow: 1px 1px 3px black">
                        <h4>擊敗王</h4>
                        <h5>NT$ 1500</h5>
                        <div class="styled-select blue semi-square">
	                        <select name="" id="" style="width:230px; text-align: center;">
	                            <option disabled selected>請選擇購買數量</option>
	                            <option value="1">1</option>
	                            <option value="2">2</option>
	                            <option value="3">3</option>
	                            <option value="4">4</option>
	                            <option value="5">5</option>
	                            <option value="6">6</option>
	                            <option value="7">7</option>
	                            <option value="8">8</option>
	                            <option value="9">9</option>
	                            <option value="10">10</option>
	                        </select>
                        </div>    
                    
                        <p>小計：NT$ 1500</p>
                        <button class="btn btn-info" style="width: 100%;"><h4 style="font-weight:300;font-size:20px">加入購物車</h4> </button>   
                    </div>
                    <div class="lower" style=" margin: 10px 0px; padding: 20px 10px; background-color: rgba(255, 255, 255, 0.733); border-radius: 5px; box-shadow: 1px 1px 3px black">
                        <ul>
                            <li>
                                玩家人數: 3-8 人   
                            </li>
                            <li>
                                遊戲時間: 20-40 分鐘
                            </li>
                            <li>
                                適合年齡：18 歲以上
                            </li>                            
                            <li>
                                    規則說明： <br>
                                    遊戲方式為玩家每回合輪流，以行動卡牌無差別攻擊其他玩家並累積負能量，
                                    而每個角色可以使用負能量來釋放有獨具特色的擊敗招數，
                                    擊敗對手，以爭奪擊敗王的寶座。
                            </li>
                        </ul>
                    </div>
                    
                    <button class="btn btn-outline-warning" style="width: 350px">想要了解更多商品背後的故事嗎？</button>                
                </div>     
            </div>
        </div>
     <jsp:include page="/fragment/footer.jsp" />   