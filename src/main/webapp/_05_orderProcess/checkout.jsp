
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/fragment/header.jsp" />
	     <div class="content container-fluid" style="padding: 0px;display: flex;flex-wrap: wrap;">
                <div class="checkoutBox container" style="width:65%; border-radius: 5px;background-color: rgb(255, 255, 255);box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.6);margin: 0px auto 5px auto; padding: 20px">
                        <h5>訂單資訊</h5>
                        <form>                            
                            <p></p>
                            <div>
                                <table>
                                	<tr>
                                        <td><label for="receiver">訂單日期：</label></td>
                                        <td><input type="text" name="receiver" id="receiver" value="${orderDate}"></td>                                        
                                        <td><label for="receiver">收件人：</label></td>
                                        <td><input type="text" name="receiver" id="receiver" value="${userName}"></td>
                                    </tr>                              
                                    <tr>
                                        <td><label for="receiver">會員帳號：</label></td>
                                        <td><input type="text" name="receiver" id="receiver" value="${userAccount}"></td>
                                        <td><label for="deliverAddr">送貨地址：</label></td>
                                        <td><input type="text" name="deliverAddr" id="deliverAddr" value="${userAddress}" style="width: 300px"></td>
                                    </tr>
                                    <tr>
                                        <td><label for="companyName">公司抬頭：</label></td>
                                        <td><input type="text" id="companyName"></td>
                                        <td><label for="taxId">統一編號：</label></td>
                                        <td><input type="text" id="companyCode"></td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                </div>
                <div class="checkoutInfo" style="width:65%; border-radius: 5px;background-color: rgb(255, 255, 255);box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.6);margin: 0px auto 5px auto;padding: 20px ">
                        <table  style="background-color:rgba(10, 10, 10, 0); margin:20px auto;">                    
                                <h5>訂單明細</h5>    
                            <tr style="font-size:px">
                                    <td style="width:300px"><span class="badge badge-primary">品名</span></td>
                                    <td style="width:120px"><span class="badge badge-primary">數量</span></td>
                                    <td style="width:120px"><span class="badge badge-primary">單價</span></td>
                                    <td style="width:120px"><span class="badge badge-primary">小計</span></td>                                    
                                </tr>
                                <tr>
                                    <td style="width:200px">台灣鐵路環島旅行帆布地圖</td>
                                    <td style="width:120px">2</td>
                                    <td style="width:120px">NT$ 1500</td>
                                    <td style="width:120px">NT$ 3000</td>
                                </tr>
                                <tr>
                                    <td style="width:200px">台灣鐵路環島旅行帆布地圖</td>
                                    <td style="width:120px">2</td>
                                    <td style="width:120px">NT$ 1500</td>
                                    <td style="width:120px">NT$ 3000</td>
                                </tr>
                                <tr>
                                    <td style="width:200px">台灣鐵路環島旅行帆布地圖</td>
                                    <td style="width:120px">2</td>
                                    <td style="width:120px">NT$ 1500</td>
                                    <td style="width:120px">NT$ 3000</td>
                                </tr>
                                <tr>
                                    <td colspan="8"><hr></td>                                       
                                </tr>                                
                                <tr>
                                    <td></td>                                                                     
                                    <td style="width:200px;">總金額：<span style="color:red; font-size: 20px">NT$ 4500</span></td>                                       
                                    <td><button type="button" class="btn btn-info">確認付款</button></td>                                                                     
                                    <td><button type="button" class="btn btn-warning">取消</button></td>                                                                     
                                </tr>                                                           
                            </table> 
                        </div>
        </div>
        

<jsp:include page="/fragment/footer.jsp" />
