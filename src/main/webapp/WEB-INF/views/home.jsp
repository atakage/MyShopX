<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="rootPath" value="${pageContext.request.contextPath }"/>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf" %>



<link href="${rootPath}/js/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- Custom styles for this template -->
<link href="${rootPath}/js/css/heroic-features.css" rel="stylesheet">



<script>

$(function(){
	
	
	$('a.logout').click(function(){
		
		$("#logout").submit()
		
	})
	
	
	
	$('.productBox').click(function(){
		
		
		var id = $(this).find('.id').val()
			
			
		document.location.href = "${rootPath}/user/product/detail/" + id
		
		
	})
	
	
	
	
})


</script>



<style>


.productBox:hover{

background-color: #e9ecef;
cursor:pointer;



}


</style>



</head>
<body>


<header class="jumbotron">
	<h3>MY SHOP</h3>
</header>
<nav class="navbar navbar-expand-sm bg-light">
	<ul class="navbar-nav">
		<li class="nav-item"><a href="${rootPath}/" class="nav-link">HOME</a></li>
		
		
		
		<sec:authorize access="isAnonymous()">
		<li class="nav-item"><a href="${rootPath}/auth/login" class="nav-link">로그인</a></li>
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
			<form id="logout" action="${rootPath}/logout" method="post">
			
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
					<li class="nav-item"><a class="nav-link logout" href="#">로그아웃</a></li>
			
			</form>
		</sec:authorize>
		
		
		
		<sec:authorize access="hasRole('ADMIN')">
			<li class="nav-item"><a href="${rootPath}/admin/" class="nav-link">관리자</a></li>
		</sec:authorize>
	</ul>
</nav>


<div class="container">

		<!-- Jumbotron Header -->
		<header class="jumbotron my-4">
			<h1 class="display-3">클릭하고 주문하는데까지 1분</h1>
			<p class="lead">안사도 됩니다. 구경만 하고 가세요 !!</p>
			<a href="#" class="btn btn-primary btn-lg">추천상품 바로사기</a>
		</header>

		<!-- Page Features -->
		<div class="row text-center">
			<c:forEach var="PRO" items="${PRODUCTLIST}" varStatus="i">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card h-100">
						<img class="card-img-top" src="http://placehold.it/500x325" alt="">
						<div class="card-body">
							<h4 class="card-title">Card title</h4>
							<div>
								<c:choose>
									<c:when test="${empty PRODUCTLIST}">
										<tr>
											<td colspan="6">상품 정보가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>

										<div class="B2C_LIST" >
											<div>상품이름 : ${PRO.p_name}</div>
											<div>상품가격 : ${PRO.p_iprice}</div>
										</div>

									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="card-footer">
							<a href="${rootPath}/user/product/detail?id=${PRO.id}" class="btn basket btn-primary">보러만 가기</a>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
</div>



<c:if test="${!empty PRODUCTVO}">





	<div class="PRODUCTDETAILBOX" style="display:flex; width: 100%; height: 500px; border: 1px solid green; margin-top: 1%;">
	
	
		
	<div class="pNameBox" style="width: 50%; line-height:500px; text-align: center;">${PRODUCTVO.p_name}</div>
	
	<div class="pOpriceBox" style="width: 50%; line-height:500px; text-align: center;"><a style="font-size:50px; font-weight: bold; color: red">${PRODUCTVO.p_oprice}원</a></div>
	
	
	
	
	


	</div>
	
	<div class="PRODUCTDETAILBOX" style="width: 100%; line-height: 500px;  margin-top: 1%; text-align: center;">
	
	
					상세설명
	
	</div>
	
	
	<div style="width:100%; text-align: center;">
	
	
	<button class="buyButton" style=" width: 10%;">구매</button>
	<button class="buyButton" style=" width: 10%;">장바구니</button>
	
	
	</div>
		


</c:if>


</body>
</html>