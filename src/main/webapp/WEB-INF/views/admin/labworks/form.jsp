<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="page-header">
    <h1>Edit Patients</h1>
</div>

    <div class="col-md-6">
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
    <form method="POST" action="${SITE_URL}/admin/patients/save">
        <div class="mb-3">
            <label>First Name:</label>
            <input type="text" name="firstName" class="form-control" required="required" value="${patient.firstName}"/>
        </div>
        <div class="mb-3">
            <label>Middle Name:</label>
            <input type="text" name="middleName" class="form-control" value="${patient.middleName}"/>
        </div>
        <div class="mb-3">
            <label>Last Name:</label>
            <input type="text" name="lastName" class="form-control" required="required" value="${patient.lastName}"/>
        </div>
        <div class="mb-3">
            <label>Date of Birth:</label>
            <input type="date" name="dateOfBirth" class="form-control" value="${patient.dateOfBirth}"/>
        </div>
        <div class="mb-3">
            <label>Age:</label>
            <input type="number" name="age" class="form-control" required="required" value="${patient.age}"/>
        </div>
        <div class="mb-3">
            <label for="genders">Gender:</label>
            <select id="genders" name="gender" required="required" class="form-select">
                <option value="M" ${patient.gender == 'M' ? 'selected' : ''}>Male</option>
                <option value="F" ${patient.gender == 'F' ? 'selected' : ''}>Female</option>
                <option value="O" ${patient.gender == 'O' ? 'selected' : ''}>Others</option>
            </select>
        </div>
        <div class="mb-3">
            <label>Address:</label>
            <input type="text" name="address" class="form-control" required="required" value="${patient.address}"/>
        </div>
        <div class="mb-3">
            <label>Contact No:</label>
            <input type="text" name="contactNo" class="form-control" required="required" value="${patient.contactNo}"/>
        </div>
        <div class="mb-3">
            <label>Email:</label>
            <input type="email" name="email" class="form-control" value="${patient.email}"/>
        </div>   
        <div class="mb-3">
            <label>Notes:</label>
            <textarea name="notes" rows="4" cols="50" class="form-control">${patient.notes}</textarea>
        </div>
        <div class="mb-3">
                <label for="patientTagList" class="form-label">Patient Tags:</label>
                <input class="form-control" value=${patient.patientTags} list="patientTagOptions" name="patientTags" id="patientTagList" placeholder="Type to search...">
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
        <div class="checkbox">
            <label>Status:</label>
            <label><input type="checkbox" name="status" <c:if test="${patient.status}">checked="checked"</c:if>/>Active</label>
        </div>
        <input type="hidden" name="id" value="${patient.id}"/>
        <div class="mb-3">
            <button type="submit" class="btn btn-success" class="form-control">Save</button>
            <a href="${SITE_URL}/admin/patients" class="btn btn-secondary">Back</a>
        </div>
    </form>
    </div>