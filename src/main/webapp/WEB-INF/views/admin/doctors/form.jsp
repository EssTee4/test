<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <div class="col-md-6">
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
    <form method="POST" action="${SITE_URL}/admin/doctors/save">
        <div class="mb-3">
            <label>Name:</label>
            <input type="text" name="name" id="name" class="form-control" required="required" value="${doctor.name}"/>
        </div>
        <div class="mb-3">
            <label>Email:</label>
            <input type="email" name="email" id="email" class="form-control" value="${doctor.email}"/>
        </div>   
        <div class="form-check mb-3">
            <label>Status:</label>
            <label><input type="checkbox" name="status" id="status" <c:if test="${doctor.status}">checked="checked"</c:if>/>Active</label>
        </div>
        <input type="hidden" name="id" id="doctorId" value="${doctor.id}"/>
        <div class="mb-3">
            <button type="submit" class="btn btn-success" class="form-control">Save</button>
            <a href="${SITE_URL}/admin/doctors" class="btn btn-secondary">Back</a>
        </div>
    </form>
    </div>