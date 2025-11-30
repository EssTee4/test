
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
    <button class="btn btn-outline-secondary border border-0" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" data-id=""><i class="bi bi-calendar-plus"></i>&nbsp;Add</button>
    <button type="button" class="btn btn-outline-secondary border border-0"><i class="bi bi-archive"></i>&nbsp;Archive Selected</button>
    <button type="button" class="btn btn-outline-secondary border border-0"><i class="bi bi-file-spreadsheet"></i>&nbsp;Export Selected</button>
  </div>
  <div class="input-group">
    <div class="input-group-text" id="btnGroupAddon2"><i class="bi bi-search"></i></div>
    <input type="text" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="btnGroupAddon2">
    <button type="button" class="btn btn-outline-secondary border border-0"><i class="bi bi-archive"></i></button>
  </div>
</div>

<div class="col-md-12" id="calendar-container">
    <div id="calendar"></div>
</div>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.19/index.global.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const calendarEl = document.getElementById('calendar');

        // Detect mobile
        const isMobile = window.matchMedia("(max-width: 767px)").matches;

        const calendar = new FullCalendar.Calendar(calendarEl, {
            // Set the initial view to a week grid with time slots
            initialView: isMobile ? 'timeGridDay' : 'timeGridWeek',
            height: 'auto',
            contentHeight: 'auto',
            aspectRatio: isMobile ? 0.8 : 1.35,
            
            // Configure the header buttons and title
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay'
            },
            
            // Define the clinic's open hours
            businessHours: {
                daysOfWeek: [1, 2, 3, 4, 5], // Monday - Friday
                startTime: '09:00',
                endTime: '20:00', // 8 PM
            },
            
            // Constrain the selectable time slots to business hours
            selectConstraint: 'businessHours',

            // Don't show time slots outside of the main view (e.g., before 9am)
            slotMinTime: '09:00:00',
            slotMaxTime: '21:00:00', // Allows viewing until 9pm

            // Allow users to select time slots by clicking and dragging
            selectable: true,

            // Example appointments. In a real app, this data would come from your server.
            // Dates are set for August 2025 to be relevant to the current context.
            events: [
                {
                    title: 'Dr. Smith - Cleaning',
                    start: '2025-08-19T10:00:00',
                    end: '2025-08-19T11:00:00',
                    backgroundColor: '#f56954', // Red
                    borderColor: '#f56954'
                },
                {
                    title: 'Dr. Jones - Check-up',
                    start: '2025-08-20T14:00:00',
                    end: '2025-08-20T14:30:00',
                    backgroundColor: '#0073b7', // Blue
                    borderColor: '#0073b7'
                }
            ],

            // This function is triggered when a user selects a time slot
            select: function(selectionInfo) {
                const appointmentStart = selectionInfo.start;
                
                // Simple validation to prevent booking appointments in the past
                if (appointmentStart < new Date()) {
                    alert("You cannot book an appointment in the past.");
                    calendar.unselect(); // Clear the selection
                    return;
                }

                // In a real application, you would show a pop-up form (modal) here.
                // For this example, we use a simple browser prompt.
                const patientName = prompt("Please enter your name for the appointment:");

                if (patientName) {
                    // Add the new appointment to the calendar visually
                    calendar.addEvent({
                        title: patientName,
                        start: selectionInfo.start,
                        end: selectionInfo.end,
                        allDay: selectionInfo.allDay
                    });
                    
                    // This is where you would send the appointment data to your backend server to save it.
                    alert('Appointment for ' + patientName + ' has been requested successfully!');
                }

                // Clear the time slot selection
                calendar.unselect(); 
            }
        });

        // Render the calendar
        calendar.render();
    });
</script>

<div class="table-responsive d-none d-md-block mt-3">
    <table class="table table-responsive table-bordered table-striped">
        <tr>
            <th>#</th>
            <th>Patient Name</th>
            <th>Doctors Names</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:set var="serialNumber" value="1" />
        <c:forEach var="appointment" items="${appointments}">
            <tr class="row-${appointment.id}"> 
                <td>${serialNumber}</td>
                <td>${appointment.patient.firstName} ${appointment.patient.lastName}</td>
                <td>
                    <c:forEach var="doctor" items="${appointment.doctors}">
                        ${doctor.name}<br/>
                    </c:forEach>
                </td>
                <td>${appointment.appointmentDate}</td>
                <td>${appointment.appointmentTime}</td>
                <td>
                    <c:choose>
                        <c:when test="${appointment.status == 'Scheduled'}">
                            <span class="badge bg-primary">Scheduled</span>
                        </c:when>
                        <c:when test="${appointment.status == 'Completed'}">
                            <span class="badge bg-success">Completed</span>
                        </c:when>
                        <c:when test="${appointment.status == 'Cancelled'}">
                            <span class="badge bg-danger">Cancelled</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-secondary">${appointment.status}</span>
                        </c:otherwise>
                    </c:choose>
                <td>
                    <div class="btn-group dropup float-end">
                        <button type="button" class="btn btn-outline-secondary" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-three-dots"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <button 
                                class="dropdown-item" 
                                type="button" 
                                data-bs-toggle="offcanvas" 
                                data-bs-target="#offcanvasRight"
                                aria-controls="offcanvasRight"
                                data-id="${appointment.id}">
                                <i class="bi bi-pencil"></i> ${appointment.patient.firstName} ${appointment.patient.middleName != null ? appointment.patient.middleName : ''} ${appointment.patient.lastName}
                            </button>
                            </li>
                            <li><hr class="dropdown-divider"></li>
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
document.addEventListener('show.bs.offcanvas', function(event) {
    const button = event.relatedTarget;

    const appointmentId = button.getAttribute('data-id');
    const patientId = button.getAttribute('data-patientid');
    const firstName = button.getAttribute('data-firstname') || '';
    const middleName = button.getAttribute('data-middlename') || '';
    const lastName = button.getAttribute('data-lastname') || '';

    // Header label
    const label = document.getElementById('actionLabel');
    if (!appointmentId || appointmentId === "0") {
        label.innerHTML = `<i class="bi bi-plus"></i> Add Appointment`;
    } else {
        let fullName = [firstName, middleName, lastName].filter(Boolean).join(" ");
        label.innerHTML = `<i class="bi bi-pencil"></i> ` + fullName + ` | Appointment`;
    }

    if (!appointmentId || appointmentId === "0") {
            saveButton.textContent = "Save";
            saveContinueButton.style.display = "inline-block"; // show Save & Continue for Add
        } else {
            saveButton.textContent = "Update";
            saveContinueButton.style.display = "none"; // hide Save & Continue for Edit
        }
});
</script>

<!-- Mobile View -->
<div class="d-block d-md-none">
    <c:forEach var="appointment" items="${appointments}">
        <div class="card mb-2">
            <div class="card-header d-flex justify-content-between align-items-center">
                <!-- Left side: Checkbox + Appointment ID -->
                <div class="d-flex align-items-center gap-2">
                    <input type="checkbox" class="form-check-input large-checkbox" name="appointmentIds" value="${appointment.id}">
                    <span class="fw-bold">ID: ${appointment.id}</span>
                </div>

                <!-- Right side: Action buttons -->
                <div class="d-flex gap-2">
                    <a href="${SITE_URL}/admin/appointments/edit/${appointment.id}" class="btn btn-outline-secondary">
                        <i class="bi bi-pencil"></i>
                    </a>
                    <a href="#" class="btn btn-outline-secondary">
                        <i class="bi bi-archive"></i>
                    </a> 
                </div>
            </div>

            <div class="card-body">
                <h5 class="card-title">${appointment.patient.firstName} <c:if test="${appointment.patient.middleName != null}">${appointment.patient.middleName}</c:if> ${appointment.patient.lastName}</h5>
                <h6 class="card-subtitle mb-2 text-muted">
                    Doctor: 
                    <c:forEach var="doctor" items="${appointment.doctors}">
                        ${doctor.name}<br/>
                    </c:forEach>
                </h6>
                <h6>
                    Date: ${appointment.appointmentDate} <br/>
                    Time: ${appointment.appointmentTime} <br/>
                    Status: 
                    <c:choose>
                        <c:when test="${appointment.status == 'Scheduled'}">
                            <span class="badge bg-primary">Scheduled</span>
                        </c:when>
                        <c:when test="${appointment.status == 'Completed'}">
                            <span class="badge bg-success">Completed</span>
                        </c:when>
                        <c:when test="${appointment.status == 'Cancelled'}">
                            <span class="badge bg-danger">Cancelled</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-secondary">${appointment.status}</span>
                        </c:otherwise>
                    </c:choose>
                </h6>
            </div>
        </div>
    </c:forEach>
</div>