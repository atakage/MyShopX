<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
    
  
  
  
<section class="mt-5 row">

	<article class="col-md-7 col-12 bg-light pro-input">
		<form:form action="${rootPath}/admin/dept/input" modelAttribute="deptVO">
		
			
			<div class="form-group">
				<form:input path="d_code" class="form-control" placeholder="거래처 코드를 입력하세요" maxlength="5"/>
				<form:errors path="d_code" class="in-errors"/>
			</div>
			
			<div class="form-group">
				<form:input path="d_name" class="form-control" placeholder="거래처 이름을 입력하세요" maxlength="30"/>
				<form:errors path="d_name" class="in-errors"/>
			</div>
			
			<div class="form-group">
				<form:input path="d_ceo" class="form-control" placeholder="대표자명을 입력하세요" maxlength="30"/>
				<form:errors path="d_ceo" class="in-errors"/>
			</div>
			
			<div class="form-group">
				<form:input path="d_sid" class="form-control" placeholder="사업자 번호를 입력하세요" maxlength="13"/>
				<form:errors path="d_sid" class="in-errors"/>
			</div>
			
			<div class="form-group">
				<form:input path="d_tel" class="form-control" placeholder="대표번호를 입력하세요" maxlength="20"/>
				<form:errors path="d_tel" class="in-errors"/>
			</div>
			
			<div class="form-group">
				<form:input path="d_addr" class="form-control" placeholder="주소를 입력하세요"/>
				<form:errors path="d_addr" class="in-errors"/>
			</div>
			
			<div class="form-group">
				<form:input path="d_manager" class="form-control" placeholder="담당자명을 입력하세요" maxlength="30"/>
				<form:errors path="d_manager" class="in-errors"/>
			</div>
			
			<div class="form-group">
				<form:input path="d_mtel" class="form-control" placeholder="담당자 번호를 입력하세요" maxlength="20"/>
				<form:errors path="d_mtel" class="in-errors"/>
			</div>
			
			<div class="form-group">
				<form:input path="d_rem" class="form-control" placeholder="비고란"/>
				<form:errors path="d_rem" class="in-errors"/>
			</div>
		
		
			<div class="form-group">
				<button>저장</button>
			</div>
		</form:form>
	
	</article>



	<article class="col-md-4 col-12 bg-light list-body">
	
		<%@ include file="/WEB-INF/views/admin/dept_list.jsp" %>
		
	</article>


</section>
    