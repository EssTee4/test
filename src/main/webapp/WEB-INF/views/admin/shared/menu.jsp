<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="${SITE_URL}/admin/dashboard">DCMS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="${SITE_URL}/admin/dashboard">Dashboard</a>
        </li>
        <li class="nav-item" id="doctorLink">
          <a class="nav-link" href="${SITE_URL}/admin/doctors">Doctors</a>
        </li>
        <li class="nav-item" id="customerLink">
          <a class="nav-link" href="${SITE_URL}/admin/patients">Patients</a>
        </li>
        <li class="nav-item" id="appointmentsLink">
          <a class="nav-link" href="${SITE_URL}/admin/appointments">Appointments</a>
        </li>
        <li class="nav-item" id="labworksLink">
          <a class="nav-link" href="${SITE_URL}/admin/mailtemplates">Labworks</a>
        </li>
        <li class="nav-item" id="expensesLink">
          <a class="nav-link" href="${SITE_URL}/admin/items">Expenses</a>
        </li>
        <li class="nav-item" id="statisticsLink">
          <a class="nav-link" href="${SITE_URL}/admin/items">Statistics</a>
        </li>        
        <li class="nav-item" id="settingsLink">
          <a class="nav-link" href="${SITE_URL}/admin/settings">Settings</a>
        </li>
        <li class="nav-item" id="logoutLink">
          <a class="nav-link" href="${SITE_URL}/admin/logout"><i class="bi bi-power"></i> Logout</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-plus-lg"></i>
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="${SITE_URL}/admin/patients/add"><i class="bi bi-person-plus-fill"></i>&nbsp;Patient</a></li>
            <li><a class="dropdown-item" href="${SITE_URL}/admin/appointments/add"><i class="bi bi-calendar-plus"></i>&nbsp;Appointment</a></li>
            <li><a class="dropdown-item" href="${SITE_URL}/admin/doctors/add"><i class="bi bi-file-medical"></i>&nbsp;Doctor</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Something else here</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>

<script>
  var currentUrl = window.location.pathname;
  var currentUrl = currentUrl.substring(currentUrl.lastIndexOf('admin/') + 1);
  if(currentUrl.includes("customers")) {
    document.getElementById("customerLink").className = "active";
  } else if(currentUrl.includes("mailtemplates")) {
    document.getElementById("mailtemplatesLink").className = "active";
  } else if(currentUrl.includes("dashboard")) {
    var dashboardLink = document.getElementById("dashboardLink");
    dashboardLink.style.color = "#FFFFFF";
    dashboardLink.style.backgroundColor = "#080808";
  }
</script>
