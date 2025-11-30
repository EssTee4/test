<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <div class="col-md-6">
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <form method="POST" action="${SITE_URL}/admin/appointments/save"> 
            <div class="mb-3">
                <label>Patient:</label>
                <select name="patientId" id="patientId" class="form-control" required="required">
                    <option value="" disabled selected>Select a patient</option>
                    <c:forEach items="${patients}" var="patient">
                        <option value="${patient.id}" <c:if test="${appointment.patient.id == patient.id}">selected</c:if>>${patient.firstName} ${patient.lastName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label>Doctors:</label>
                <select name="doctorId" id="doctorId" class="form-select" required="required" multiple>
                    <option value="" disabled <c:if test="${empty appointment.doctors}">selected</c:if>>
                        Select a doctor
                    </option>
                    <c:forEach items="${doctors}" var="doctor">
                        <c:set var="isDoctorSelected" value="false" />
                        <c:forEach items="${appointment.doctors}" var="selectedDoctor">
                            <c:if test="${doctor.id == selectedDoctor.id}">
                                <c:set var="isDoctorSelected" value="true" />
                            </c:if>
                        </c:forEach>
                        <option value="${doctor.id}" <c:if test="${isDoctorSelected}">selected</c:if>>
                            ${doctor.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label>Date:</label>
                <input type="date" name="appointmentDate" id="appointmentDate" class="form-control" required="required" value="${appointment.appointmentDate}"/>
            </div>
            <div class="mb-3">
                <label>Time:</label>
                <input type="time" name="appointmentTime" id="appointmentTime" class="form-control" value="${appointment.appointmentTime}" required="required"/>
            </div>
            <div class="mb-3">
                <label>Pre-operative notes:</label>
                <textarea type="text" name="preOpNotes" id="preOpNotes" class="form-control" style="height:150px">${appointment.preOpNotes}</textarea>
            </div>
            <div class="mb-3">
                <label>Status:</label>
                <select name="status" id="status" class="form-select" required="required">
                    <option value="" disabled selected>Select status</option>
                    <option value="Scheduled" <c:if test="${appointment.status == 'Scheduled'}">selected</c:if>>Scheduled</option>
                    <option value="Completed" <c:if test="${appointment.status == 'Completed'}">selected</c:if>>Completed</option>
                    <option value="Confirmed" <c:if test="${appointment.status == 'Confirmed'}">selected</c:if>>Confirmed</option>
                    <option value="Arrived" <c:if test="${appointment.status == 'Arrived'}">selected</c:if>>Arrived</option>
                    <option value="In Surgery" <c:if test="${appointment.status == 'In Surgery'}">selected</c:if>>In Surgery</option>
                    <option value="No-Show" <c:if test="${appointment.status == 'No-Show'}">selected</c:if>>No-Show</option>
                    <option value="Cancelled" <c:if test="${appointment.status == 'Cancelled'}">selected</c:if>>Cancelled</option>
                </select>
            </div>
            <input type="hidden" name="id" id="appointmentId" value="${appointment.id}" />
            <div class="mb-3">
            <button type="submit" class="btn btn-success" id="saveButton">Save</button>
            <button type="submit" class="btn btn-success" name="refresh" value="1" id="saveContinueButton">Save & Continue</button>
            <a href="${SITE_URL}/admin/appointments" class="btn btn-secondary">Back</a>
        </div>
        </form>
    </div>