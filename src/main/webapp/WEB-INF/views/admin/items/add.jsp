<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../shared/header.jsp" %>
<div class="page-header">
    <h1>Add Items</h1>
</div>

    <form method="POST" action="${SITE_URL}/admin/items/save">
        <div class="mb-3">
            <label>Name:</label>
            <input type="text" name="name" class="form-control" required="required"/>
        </div>
        
        <div class="checkbox">
            <label>Status:</label>
            <label><input type="checkbox" name="status"/>Active</label>
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-success" class="form-control">Save</button>
            <button type="submit" class="btn btn-success" name ="refresh" value="1" class="form-control">Save & Continue</button>
            <a href="${SITE_URL}/admin/items" class="btn btn-secondary">Back</a>
        </div>
    </form>
        
<%@include file="../shared/footer.jsp" %>