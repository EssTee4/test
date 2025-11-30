
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
    <button class="btn btn-outline-secondary border border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" data-id=""><i class="bi bi-person-plus-fill"></i>&nbsp;Add</button>
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
                    <input class="form-check-input large-checkbox" type="checkbox" value="" id="select-all">
                </div>
            </th>
            <th>#</th>
            <th>Name</th>
            <th>Past Appointments</th>
            <th>Upcoming Appointments</th>
            <th>Action</th>
        </tr>
        <c:set var="serialNumber" value="1" />
        <c:forEach var="doctor" items="${doctors}">
            <tr class="row-${doctor.id}">
                <td>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input large-checkbox" name="doctorIds" value="${doctor.id}">
                    </div>
                </td> 
                <td>${serialNumber}</td>
                <td>${doctor.name}</td>
                <td></td>
                <td></td>
                <td>
                    <div class="btn-group dropup float-end">
                        <button type="button" class="btn btn-outline-secondary" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-three-dots"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <li>
                                <button 
                                    class="dropdown-item" 
                                    type="button" 
                                    data-bs-toggle="offcanvas" 
                                    data-bs-target="#offcanvasRight"
                                    aria-controls="offcanvasRight"
                                    data-id="${doctor.id}">
                                    <i class="bi bi-pencil"></i>&nbsp;${doctor.name}
                                </button>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${SITE_URL}/admin/appointments/add?doctorId=${doctor.id}"><i class="bi bi-calendar-plus"></i>&nbsp;Add Appointment</a></li>
                            <li><a class="dropdown-item" href="#"><i class="bi bi-envelope"></i>&nbsp;Email Doctor</a></li>
                            <li><a class="dropdown-item" href="#"><i class="bi bi-archive"></i>&nbsp;Archive</a></li>
                        </ul>
                    </div>
                </td>                   
            </tr>
            <c:set var="serialNumber" value="${serialNumber + 1}" />
        </c:forEach>
    </table>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const offcanvasEl = document.getElementById('offcanvasRight');
    if (!offcanvasEl) {
        console.log("❌ Offcanvas element not found");
        return;
    }

    offcanvasEl.addEventListener('shown.bs.offcanvas', function (event) {
        const button = event.relatedTarget;
        const id = button.getAttribute('data-id');

        document.getElementById('doctorId').value = button.getAttribute('data-id') || '0';

        const label = document.getElementById('actionLabel');

        if (!id || id === "0") {
            label.innerHTML = `<i class="bi bi-plus"></i> Doctor`;
        } else {
            label.innerHTML = `<i class="bi bi-pencil"></i> ` + name;
        }
    });
});
</script>

<!-- Mobile View -->
<div class="d-block d-md-none">
    <c:set var="serialNumber" value="1" />
    <c:forEach var="doctor" items="${doctors}">
        <div class="card mb-2">
            <div class="card-header d-flex justify-content-between align-items-center">
                <!-- Left side: Checkbox + Doctor ID -->
                <div class="d-flex align-items-center gap-2">
                    <input type="checkbox" class="form-check-input large-checkbox" name="doctorIds" value="${doctor.id}">
                    <span class="fw-bold">#: ${serialNumber}</span>
                </div>

                <!-- Right side: Action buttons -->
                <div class="d-flex gap-2">
                    <button 
                        class="btn btn-sm btn-outline-secondary" 
                        type="button" 
                        data-bs-toggle="offcanvas" 
                        data-bs-target="#offcanvasRight"
                        aria-controls="offcanvasRight"
                        data-id="${doctor.id}">
                        <i class="bi bi-pencil"></i>
                    </button>
                    <a href="${SITE_URL}/admin/appointments/add?doctorId=${doctor.id}" 
                       class="btn btn-sm btn-outline-secondary" aria-label="Add Appointment">
                        <i class="bi bi-calendar-plus"></i>
                    </a>
                    <a href="#" class="btn btn-sm btn-outline-secondary" aria-label="Archive Doctor">
                        <i class="bi bi-archive"></i>
                    </a>
                </div>
            </div>

            <div class="card-body">
                <h5 class="card-title">${doctor.name}</h5>
                <h6 class="card-subtitle mb-2 text-muted">
                    Past Appointments: N/A | Upcoming Appointments: N/A
                </h6>
            </div>
        </div>
        <c:set var="serialNumber" value="${serialNumber + 1}" />
    </c:forEach>
</div>
