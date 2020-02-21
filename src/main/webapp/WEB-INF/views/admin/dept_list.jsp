<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/include-head.jspf" %>



<style>

td, th{

white-space:nowrap;


}


</style>

<style>

tr,td,th {
	white-space: nowrap;
}


</style>


<script>

$(function(){
	

	$(".dept_tr").click(function(){
		
	
		
		let tds = $(this).children()
		let d_code = tds.eq(0).text()
		let d_name = tds.eq(1).text();
		
		
		// 나를 open한 화면에 있는 #p_dcode input 박스에 d_code값을 채워 넣기
		$("#p_dcode", opener.document).val(d_code)
		$("#d_name", opener.document).text(d_name)
		
		window.close()	// 일반 브라우저
		window.open('about:blank', '_self').self.close()// IE창 닫기
		
//		let id = $(this).data("id")	
		//let c = $(this).attr('class')
		
	//	document.location.href="${rootPath}/admin/dept/update/"+ id
		
	})
	
	
	
	var dept_call_func =  function(key){
		
		
		var id = $(this).data('id')
		if(key == 'edit'){
			

			document.location.href="${rootPath}/admin/dept/update/"+ id
			
			
			
		}else if(key == 'delete'){
			
			if(confirm('정말 삭제?')){
				
				document.location.href="${rootPath}/admin/dept/delete/"+ id
			
			}
		}
	}
	
	$.contextMenu({
		
		selector: '.dept_tr', items: {
			
			"edit" : {name:'거래처 수정', icon:'edit'},
			"delete" : {name:'거래처 삭제', icon:'delete'}
		},
		callback : dept_call_func
		
	})
	
	
	
	
})
	
	

	
	
</script>

    
    <table class="col-md-4 col-12">
    
    	<tr>
    		<th>거래처코드</th>
    		<th>거래처명</th>
    		<th>대표</th>
    		<th>사업자번호</th>
    		<th>대표번호</th>
    		<th>대표전화</th>
    		<th>담당자</th>
    		<th>담당자 연락처</th>
    	</tr>
    <c:choose>
    
    	<c:when test="${empty DEPT_LIST}">
    	
    		<tr>
    			<td colspan="6">거래처정보가 없음</td>
    		</tr>
    	
    	</c:when>
    	<c:otherwise>
    	<c:forEach items="${DEPT_LIST }" var="DEPT" varStatus="1">
    	
    	<tr class="dept_tr" data-id="${DEPT.id}">
    		<td>${DEPT.d_code}</td>
    		<td>${DEPT.d_name}</td>
    		<td>${DEPT.d_ceo}</td>
    		<td>${DEPT.d_sid}</td>
    		<td>${DEPT.d_tel}</td>
    		<td>${DEPT.d_manager}</td>
    		<td>${DEPT.d_mtel}</td>
    	</tr>
    	
    		</c:forEach>
    	</c:otherwise>
    	
    </c:choose>
    
    
    
    </table>