<!-- filepath: /Users/aayushlalshrestha/IdeaProjects/SpringHibernateProject/src/main/webapp/WEB-INF/views/admin/patients/form.jsp -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-md-12">
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form method="POST" action="${SITE_URL}/admin/patients/save">
        <div class="mb-3 col-md-6">
            <label>First Name:</label>
            <input type="text" name="firstName" id="firstName" class="form-control" required="required"
                value="${patient.firstName != null ? patient.firstName : ''}"/>
        </div>
        <div class="mb-3 col-md-6">
            <label>Middle Name:</label>
            <input type="text" name="middleName" class="form-control" id="middleName"
               value="${patient.middleName != null ? patient.middleName : ''}" />
        </div>
        <div class="mb-3 col-md-6">
            <label>Last Name:</label>
            <input type="text" name="lastName" class="form-control" required="required" id="lastName"
                value="${patient.lastName != null ? patient.lastName : ''}"/>
        </div>
        <div class="mb-3 col-md-6">
            <label>Date of Birth:</label>
            <input type="date" name="dateOfBirth" class="form-control" id="dateOfBirth" 
                   value="${patient.dateOfBirth != null ? patient.dateOfBirth : ''}"/>
        </div>
        <div class="mb-3 col-md-6">
            <label>Age:</label>
            <input type="number" name="age" class="form-control" required="required" id="age"
                   value="${patient.age != null ? patient.age : ''}"/>
        </div>
        <div class="mb-3 col-md-6">
            <label>Gender:</label>
            <select name="gender" class="form-select" required="required" id="gender">
                <option value="" disabled ${empty patient.gender ? 'selected' : ''}>Select a gender</option>
                <option value="M" ${patient.gender == 'M' ? 'selected' : ''}>Male</option>
                <option value="F" ${patient.gender == 'F' ? 'selected' : ''}>Female</option>
                <option value="O" ${patient.gender == 'O' ? 'selected' : ''}>Others</option>
            </select>
        </div>
        <div class="mb-3 col-md-6">
            <label>Address:</label>
            <input type="text" name="address" class="form-control" required="required" id="address"
                   value="${patient.address != null ? patient.address : ''}"/>
        </div>
        <div class="mb-3 col-md-6">
            <label>Email:</label>
            <input type="email" name="email" class="form-control" id="email"
                   value="${patient.email != null ? patient.email : ''}"/>
        </div>
        <div class="mb-3 col-md-6">
            <label>Contact No:</label>
            <input type="text" name="contactNo" class="form-control" required="required" id="contactNo"
                   value="${patient.contactNo != null ? patient.contactNo : ''}"/>
        </div>
        <div class="mb-3">
            <label>Notes:</label>
            <textarea name="notes" id="notes" rows="4" cols="50" class="form-control">${patient.notes != null ? patient.notes : ''}</textarea>
        </div>
        <div class="mb-3">
            <label for="patientTagList" class="form-label">Patient Tags:</label>
            <input class="form-control" list="patientTagOptions" name="patientTags" id="patientTags" id="patientTagList" multiple
                   placeholder="Type to search..." value="${patient.patientTags != null ? patient.patientTags : ''}">
            <datalist id="patientTagOptions">
                <option value="Heart Patient"></option>
                <option value="Asthmatic"></option>
                <option value="Diabetic"></option>
                <option value="Smoker"></option>
                <option value="Conservative"></option>
                <option value="Surgical"></option>
                <option value="Hypertensive"></option>
            </datalist>
        </div>
        <div class="form-check mb-3">
            <label>Status:</label>
            <label>
                <input type="checkbox" name="status" ${patient.id != 0 && patient.status ? 'checked' : ''}/ id="status">Active
            </label>
        </div>
        <input type="hidden" id="patientId" name="id" value="${patient.id}"/>
        <div class="mb-3">
            <button type="submit" class="btn btn-success" id="saveButton">Save</button>
            <button type="submit" class="btn btn-success" name="refresh" value="1" id="saveContinueButton">Save & Continue</button>
            <a href="${SITE_URL}/admin/patients" class="btn btn-secondary">Back</a>
        </div>
    </form>
</div>