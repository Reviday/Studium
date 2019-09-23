<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.studium.member.model.vo.Member"%>
<%@ page import="com.studium.member.model.vo.MyPurchase"%>
 <%@ page import="com.studium.category.model.vo.Category,
				java.util.List"%>

<% 
	Member m=(Member)request.getAttribute("member");
	List<MyPurchase> list=(List)request.getAttribute("purchaseL");
%>
 
<style>
.header-background-cover {
	height: 95px;
	background-color: rgba(0, 0, 0, 0.8);
}
</style>
<section>
	<div class="header-background" style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
		<div class="header-background-cover">
      </div>
    </div>
	

    <div class="section-content" style="background-color: rgb(240, 240, 240)">
        <div class="row">
            <div class="col-sm-2">
            </div>
            <div class="col-sm-8" style=" margin-top:20px">
                <img src="<%=request.getContextPath()%>/img/card.png " alt=" " class="img-category " style="background-color:white;">
                <div class="myPay ">
                    <h3>구매 목록</h3>
                    <div class="shopping-1 ">
                        <p class="sort studyM ">결제내역</p>
                    </div>
                </div>

                <div class="payment">
                    <h5>신청 및 결제내역</h5>
                    <table>
                        <tr>
                            <th>신청일</th>
                            <th>상태</th>
                            <th>구매한 스터디</th>
                            <th>증빙서류</th>
                        </tr>
                      <% if(!list.isEmpty()){
							for(int i=0;i<list.size();i++){
								if(list.get(i).getPurchaseCancelStatus()=='N'){%>
                        <tr>
                            <td><%=list.get(i).getPurchaseDate() %></td>
                            <td><%=list.get(i).getPurchaseStatus()%></td>
                            <td><%=list.get(i).getpTitle()%></td>
                            <td><%if(list.get(i).getSubmitFile()=='Y'){%>o<%}else{ %>x<%} %></td>
                        </tr>
					<%			}
							}
						}%>
                    </table>
                </div>
                <div class="payment">
                    <h5>취소 및 환불내역</h5>
                    <table>
                        <tr>
                            <th>취소일</th>
                            <th>상태</th>
                            <th>취소한 스터디</th>
                            <th>증빙서류</th>
                        </tr>
                      <% if(!list.isEmpty()){
							for(int i=0;i<list.size();i++){
								if(list.get(i).getPurchaseCancelStatus()=='Y'){%>
                        <tr>
                            <td><%=list.get(i).getCancelDate() %></td>
                            <td><%=list.get(i).getPurchaseStatus()%></td>
                            <td><%=list.get(i).getpTitle()%></td>
                            <td><%if(list.get(i).getSubmitFile()=='Y'){%>o<%}else{ %>x<%} %></td>
                        </tr>
					<%			}
							}
						}%>
                    </table>
                </div>
            </div>
            <div class="col-sm-2 "></div>
        </div>
    </div>
</section>

<%@ include file="/views/common/footer.jsp"%>
