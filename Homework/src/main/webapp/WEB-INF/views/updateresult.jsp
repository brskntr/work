
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 	<div class="${color }">
 		${message}
 	</div>
 	
 	<c:if test="${not empty errorType }">
 		<input type="hidden" name="errorType" id="errorType" value="${errorType }" /> 
 	</c:if>
	