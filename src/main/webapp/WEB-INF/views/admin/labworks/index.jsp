
<%--
Document   : index
    Created on : Jul 5, 2018, 6:28:08 PM
    Author     : dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<div class="btn-toolbar justify-content-between border border-0 mb-1 mt-1" role="toolbar" aria-label="Toolbar with button groups">
  <div class="btn-group border border-0" role="group" aria-label="First group">
    <a href="${SITE_URL}/admin/patients/add" class="btn btn-outline-secondary border border-0">
        <i class="bi bi-person-plus-fill"></i>&nbsp;Add
    </a>
    <button type="button" class="btn btn-outline-secondary border border-0"><i class="bi bi-archive"></i>&nbsp;Archive Selected</button>
    <button type="button" class="btn btn-outline-secondary border border-0"><i class="bi bi-file-spreadsheet"></i>&nbsp;Export Selected</button>
  </div>
  <div class="input-group">
    <div class="input-group-text" id="btnGroupAddon2"><i class="bi bi-search"></i></div>
    <input type="text" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="btnGroupAddon2">
    <button type="button" class="btn btn-outline-secondary border border-0"><i class="bi bi-archive"></i></button>
  </div>
</div>

<div class="table-responsive small d-none d-md-block">
    <table class="table table-striped">
        <tr>
            <th>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input large-checkbox" id="select-all"/>
                </div>
            </th>
            <th>#</th>
            <th>NAME</th>
            <th>AGE</th>
            <th>GENDER</th>
            <th>TAGS</th>
            <th>TREATMENT</th>
            <th>ACTION</th>
        </tr>
        <c:set var="serialNumber" value="1" />
        <c:forEach var="patient" items="${patients}">
            <tr class="row-${patient.id}"> 
                <td>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input large-checkbox" name="patientIds" value="${patient.id}">
                    </div>
                </td>
                <td>${serialNumber}</td>
                <td>${patient.firstName} ${patient.lastName}</td>
                <td>${patient.age}</td>
                <td>
                    <c:choose>
                        <c:when test="${patient.gender == 'M'}">
                            <i class="bi bi-gender-male"></i>
                        </c:when>
                        <c:otherwise>
                            <i class="bi bi-gender-female"></i>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${patient.patientTags}</td>
                <td>
                    <span class="total-treatments">${patient.treatmentList.size()}</span> 
                    <a href="javascript:void(0)" data-patient-name="${patient.firstName} ${patient.lastName}"
                        data-id="${patient.id}" class="add-treatment-btn btn btn-outline-secondary">
                        <i class="bi bi-file-medical"></i>
                    </a>
                </td>
                <td>
                    <div class="btn-group dropup float-end">
                        <button type="button" class="btn btn-outline-secondary" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-three-dots"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${SITE_URL}/admin/patients/edit/${patient.id}"><i class="bi bi-pencil"></i>&nbsp;${patient.firstName} ${patient.lastName}</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${SITE_URL}/admin/appointments/add?patientId=${patient.id}"><i class="bi bi-calendar-plus"></i>&nbsp;Add Appointment</a></li>
                            <li><a class="dropdown-item" href="tel:+977-${patient.contactNo}"><i class="bi bi-telephone"></i>&nbsp;Call Patient</a></li>
                            <li><a class="dropdown-item" href="#"><i class="bi bi-archive"></i>&nbsp;Archive</a></li>
                        </ul>
                    </div>
                </td>                   
            </tr>
            <c:set var="serialNumber" value="${serialNumber + 1}" />
        </c:forEach>
    </table>
</div>

<div class="d-block d-md-none">
    <c:forEach var="patient" items="${patients}">
        <div class="card mb-2">
            <div class="card-body">
                <h5 class="card-title">${patient.firstName} ${patient.lastName}</h5>
                <h6 class="card-subtitle mb-2 text-muted">
                    Age: ${patient.age} | 
                    <c:choose>
                        <c:when test="${patient.gender == 'M'}">
                            <i class="bi bi-gender-male"></i>
                        </c:when>
                        <c:otherwise>
                            <i class="bi bi-gender-female"></i>
                        </c:otherwise>
                    </c:choose>
                </h6>
                <p class="card-text">
                    Tags: ${patient.patientTags}<br>
                    Treatments: <span class="total-treatments">${patient.treatmentList.size()}</span>
                </p>
                <div class="mb-2">
                    <a href="javascript:void(0)" data-patient-name="${patient.firstName} ${patient.lastName}"
                        data-id="${patient.id}" class="add-treatment-btn btn btn-outline-secondary btn-sm">
                        <i class="bi bi-file-medical"></i> Add Treatment
                    </a>
                </div>
                <div class="btn-group dropup float-end">
                    <button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-three-dots"></i>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="${SITE_URL}/admin/patients/edit/${patient.id}"><i class="bi bi-pencil"></i>&nbsp;Edit</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="${SITE_URL}/admin/appointments/add?patientId=${patient.id}"><i class="bi bi-calendar-plus"></i>&nbsp;Add Appointment</a></li>
                        <li><a class="dropdown-item" href="tel:+977-${patient.contactNo}"><i class="bi bi-telephone"></i>&nbsp;Call Patient</a></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-archive"></i>&nbsp;Archive</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- Treatment Modal -->
  <div class="modal fade" id="treatment-dialog" tabindex="-1" aria-labelledby="treatmentModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
                    <form id="treatment-form">
                <div class="modal-body">
                    <div class="mb-3">
                        <label>Subject:</label>
                        <input type="text" name="subject" class="form-control" required="required"/>
                    </div>
                    <div class="mb-3">
                        <label>Message:</label>
                        <textarea type="text" name="message" class="form-control" required="required" style="height:150px"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="treatment-patient-id" name="patient.id"/>
                    <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
                    <button type="submit" class="save-treatment-btn btn btn-primary">Add Treatment</button>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary">Save changes</button>
        </div>
        </div>
    </div>
    </div>

  <script>
        $(document).ready(function(){
            $(".add-treatment-btn").click(function() {
                var $id = $(this).attr('data-id');
                $("#treatment-patient-id").val($id);
                $("#treatment-dialog").find('.modal-title')
                    .html($(this).attr('data-patient-name'));
                var modal = new bootstrap.Modal(document.getElementById('treatment-dialog'));
                modal.show();
            });

            $(".save-treatment-btn").click(function() {
                $.post('${SITE_URL}/admin/patients/addTreatment',
                    $("#treatment-form").serialize(), function(res) {
                        if(res.trim() === 'success') {
                            var $spanTotal = $(".row-" + $("#treatment-patient-id").val()).find(".total-treatments");
                            var $count = parseInt($spanTotal.html());
                            $spanTotal.html($count + 1);
                            var modal = bootstrap.Modal.getInstance(document.getElementById('treatment-dialog'));
                            modal.hide();
                        }
                    });
                return false;
            });
        });
  </script>