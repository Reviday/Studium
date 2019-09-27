<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css">

    <%@ include file="/views/common/header.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/Q&AList.css">

     <div class="header-background"
	style="background-image: url('<%=request.getContextPath()%>/img/1.jpg');">
	<div class="header-background-cover"></div>
</div>  
    <section class="row">
        <div class="col-xs-4 col-sm-3 col-md-3 col-lg-2" style="padding-left:0">
	    <%@ include file="/views/admin/adminSideMenuBar.jsp"%>	
	    </div>
       
        <article class="mainArticle"></article>
    </section>    
        <%@ include file="/views/common/footer.jsp" %>
        
</body>
</html>