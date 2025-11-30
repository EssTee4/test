<%@ page isErrorPage="true" %>
<%@include file="../shared/header.jsp" %>
    <div class="container text-center mt-5">
        <!-- Display the error code dynamically -->
        <h1 class="display-1 text-danger">${errorCode}</h1>
        
        <!-- Customize message based on the error code -->
        <h2 class="mb-4">
            <c:choose>
                <c:when test="${errorCode == 400}">Bad Request</c:when>
                <c:when test="${errorCode == 403}">Forbidden</c:when>
                <c:when test="${errorCode == 500}">Internal Server Error</c:when>
                <c:otherwise>Unexpected Error</c:otherwise>
            </c:choose>
        </h2>

        <!-- Error message passed from the server -->
        <p class="lead">${errorMessage}</p>

        <!-- Navigation buttons -->
        <div class="mt-4">
            <a href="/" class="btn btn-primary btn-lg">Go Back Home</a>
            <a href="javascript:history.back()" class="btn btn-secondary btn-lg">Go Back</a>
        </div>
    </div>
<%@include file="../shared/footer.jsp" %>
