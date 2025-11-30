<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../shared/header.jsp" %>
<div class="page-header">
    <h1>Edit Items</h1>
</div>

<form method="POST" action="${SITE_URL}/admin/items/save">
    <div class="mb-3">
        <label>Name:</label>
        <input type="text" name="name" class="form-control" required="required" value="${item.name}"/>
    </div>
    
    <div class="checkbox">
        <label>Status:</label>
        <label><input type="checkbox" name="status" <c:if test="${item.status}">checked="checked"</c:if>/>Active</label>
    </div>
    <input type="hidden" name="id" value="${item.id}"/>
    <div class="mb-3">
        <button type="submit" class="btn btn-success" class="form-control">Save</button>
        <a href="${SITE_URL}/admin/items" class="btn btn-secondary">Back</a>
    </div>
</form>
        
    
<%@include file="../shared/footer.jsp" %>