<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
	<option value='-1'>결재자</option>
	<c:forEach items='${departmentEmployee}' var='de'>
	<option value='${de.employee_id}'>${de.c_position} ${de.name}</option>
	</c:forEach>