<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="shared/header.jsp" %>
        <h1>Patients</h1>
        <c:forEach var="patient" items="${patients}">
            <li>${patient.firstName} ${patient.lastName}</li>
        </c:forEach>
<%@include file="shared/header.jsp" %>
