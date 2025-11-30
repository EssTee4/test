<%@ page isErrorPage="true" %>
<%@include file="../shared/header.jsp" %>
    <div class="container text-center mt-5">
        <h1 class="display-1 text-danger">500</h1>
        <h2 class="mb-4">Internal Server Error</h2>
        <p class="lead">Something went wrong on our end. Please try again later.</p>
        <p><strong>Error Message:</strong> ${errorMessage}</p>

        <a href="/admin/dashboard" class="btn btn-primary btn-lg mt-4">Go Back Home</a>
    </div>
<%@include file="../shared/footer.jsp" %>
