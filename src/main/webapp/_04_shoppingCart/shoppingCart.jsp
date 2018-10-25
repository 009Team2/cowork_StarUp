
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/fragment/header.jsp" />
	 <div class="content container-fluid" style="display: flex; padding: 0px; justify-content: center;flex-wrap: wrap">
            <div class="itemBox" style="width:70%; height: 150px;border-radius: 5px;background-color: rgb(255, 255, 255);box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.6);display: flex;margin-bottom: 5px"">
                <div class="itemImg" style="width:160px; height:120px; margin: 15px 0px 15px 20px; box-shadow:1px 1px 2px rgba(0, 0, 0, 0.438);overflow: hidden">
                    <img src="../images/擊敗王-2.jpg" style="width: 100%; height: 100%">
                </div>
                <div class="orderInfo" style="font-size:16px">
                        <table  style="background-color:rgba(10, 10, 10, 0); margin:20px 15px;">
                                
                                <tr style="font-size:px">
                                    <td style="width:300px"><span class="badge badge-primary">品名</span></td>
                                    <td style="width:120px"><span class="badge badge-primary">數量</span></td>
                                    <td style="width:120px"><span class="badge badge-primary">單價</span></td>
                                    <td style="width:120px"><span class="badge badge-primary">小計</span></td>
                                    <td style="width:120px"><span class="badge badge-primary">刪除</span></td>  
                                </tr>
                                <tr >
                                    <td style="width:200px">台灣鐵路環島旅行帆布地圖</td>
                                    <td style="width:120px">
                                    		<input id="min" name="" type="button" value="-" />
											<input id="text_box" name="goodnum" type="text" value="1" style="width:25px;" />
											<input id="add" name="" type="button" value="+" />
                                           <!--  <select name="">                                                    
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
                                                    <option value="1">11</option>
                                                    <option value="2">12</option>
                                                    <option value="3">13</option>
                                                    <option value="4">14</option>
                                                    <option value="5">15</option>
                                                    <option value="6">16</option>
                                                    <option value="7">17</option>
                                                    <option value="8">18</option>
                                                    <option value="9">19</option>
                                                    <option value="10">20</option>
                                                </select> -->
                                    </span></td>
                                    <td style="width:120px">單價</td>
                                    <td style="width:120px">小計</td>
                                    <td style="width:120px"><i class="far fa-trash-alt"></i></td> 
                                </tr>
                                
                        </table> 
                </div>
            </div>
           
            <div class="checkoutBox" style="width:70%; height: 100px;border-radius: 5px;background-color: rgb(255, 255, 255);box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.6);display: flex;margin-bottom: 5px"">
                    <div style="line-height:100px; margin:0px auto; font-size:20px">購物車內含有<span style="color:red">N</span>  樣商品，消費總金額<span style="color:red">NT$ N</span>  元</div> 
                <div class="checkoutBtn" style="line-height: 100px; margin-right: 30px">
                   <button type="button" class="btn btn-info">結帳去</button>
                   <button type="button" class="btn btn-warning">繼續購物</button>
               </div>
               
            </div>
        </div>


<jsp:include page="/fragment/footer.jsp" />
