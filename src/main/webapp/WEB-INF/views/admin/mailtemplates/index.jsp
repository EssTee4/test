
<%--
Document   : index
    Created on : Jul 5, 2018, 6:28:08 PM
    Author     : dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../shared/header.jsp" %>
<h1>Mail Templates</h1>
<div class="pull-right">
    <p>
        <a href="${SITE_URL}/admin/mailtemplates/add" class="btn btn-primary">Add Mail Templates</a>
    </p>
</div>

<table class="table">
    <tr>
        <th>#</th>
        <th>Title</th>
        <th>Slug</th>
        <th>Status</th>
        <th>Action</th>
    </tr>
    <c:set var="serialNumber" value="1" />
    <c:forEach var="mailtemplate" items="${mailtemplates}">
        <tr>
            <td>${serialNumber}</td>
            <td>${mailtemplate.title}</td>
            <td>${mailtemplate.slug}</td>
            <td>
                <input type="checkbox" disabled="disabled" 
                       <c:if test="${mailtemplate.status == 'true'}">checked</c:if> />
            </td>
            
            <td>
                <a href="${SITE_URL}/admin/mailtemplates/edit/${mailtemplate.id}" class="btn btn-success">
                    <i class="bi bi-pencil"></i>
                </a> 
                <a href="#" class="btn btn-secondary">
                   <i class="bi bi-archive"></i>
                </a>
            </td>               
        </tr>
        <c:set var="serialNumber" value="${serialNumber + 1}" />
    </c:forEach>
</table>
<%@include file="../shared/footer.jsp" %>