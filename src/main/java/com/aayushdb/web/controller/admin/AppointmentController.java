package com.aayushdb.web.controller.admin;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.aayushdb.web.entity.Appointment;
import com.aayushdb.web.entity.Doctor;
import com.aayushdb.web.entity.Patient;
import com.aayushdb.web.service.AppointmentService;
import com.aayushdb.web.service.DoctorService;
import com.aayushdb.web.service.PatientService;

@Controller
@RequestMapping("/admin/appointments")
public class AppointmentController {
    private final AppointmentService appointmentService;
    private final DoctorService doctorService;
    private final PatientService patientService;

    @Autowired
    public AppointmentController(AppointmentService appointmentService, DoctorService doctorService, PatientService patientService) {
        this.appointmentService = appointmentService;
        this.doctorService = doctorService;
        this.patientService = patientService;
    }

    /* @RequestMapping({"", "/", "/index"})
        public String index(@RequestParam(value = "doctorId", required = false) Integer doctorId,
            @RequestParam(value = "date", required = false) LocalDate date,Model model) {
        
            // Complex logic still delegated to AppointmentService
            List<Appointment> appointments = appointmentService.findAppointments(doctorId, date);
            
            model.addAttribute("appointments", appointments);
            
            // Data for dropdowns is now retrieved via the respective Services
            model.addAttribute("patients", patientService.getAll()); 
            model.addAttribute("doctors", doctorService.getAll());
            
            // ... rest of the view logic
            return "admin/dashboard/index";
        } */

    /* @RequestMapping(value="/add", method=RequestMethod.GET)
    public String add(
        @RequestParam(value = "doctorId", required = false) Integer doctorId,
        @RequestParam(value = "patientId", required = false) Integer patientId,
        Model model
    ) {
        model.addAttribute("patients", patientService.getAll());
        model.addAttribute("doctors", doctorService.getAll());
        if (doctorId != null) {
            model.addAttribute("selectedDoctorId", doctorId);
        }
        if (patientId != null) {
            model.addAttribute("selectedPatientId", patientId);
        }
        model.addAttribute("contentPage", "/WEB-INF/views/admin/appointments/add.jsp");
        return "admin/dashboard/index";
    } */
    

    /* @RequestMapping(value="/save", method=RequestMethod.POST)
    public String save(
        @RequestParam(value = "id", required = false) Integer id,
        @RequestParam("patientId") int patientId,
        @RequestParam("doctorId") int[] doctorIds,
        @RequestParam("appointmentDate") String appointmentDate,
        @RequestParam("appointmentTime") String appointmentTime,
        @RequestParam("preOpNotes") String preOpNotes,
        @RequestParam("status") String status,
        @RequestParam(name="refresh", required = false) String refresh
    ) {
        Appointment appointment;
        if (id != null) {
            appointment = appointmentService.getById(id); // Edit
        } else {
            appointment = new Appointment(); // Add
        }

        // Set patient
        Patient patient = patientService.getById(patientId);
        appointment.setPatient(patient);

        // Set doctors
        Set<Doctor> doctors = new HashSet<>();
        for (int doctorId : doctorIds) {
            Doctor doctor = doctorService.getById(doctorId);
            doctors.add(doctor);
        }
        appointment.setDoctors(doctors);

        // Set date and time
        appointment.setAppointmentDate(LocalDate.parse(appointmentDate));
        appointment.setAppointmentTime(LocalTime.parse(appointmentTime));
        appointment.setPreOpNotes(preOpNotes);
        appointment.setStatus(status);

        // Save for both add and edit
        appointmentService.save(appointment);

        String redirect="/admin/appointments";
        if(refresh!=null && refresh.equals("1")){
            redirect="/admin/appointments/add";
        }
        return "redirect:" + redirect;
    } */

    /* @RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
    public String edit(@PathVariable("id") int id, Model model){
        model.addAttribute("appointment", appointmentService.getById(id));
        model.addAttribute("patients", patientService.getAll());
        model.addAttribute("doctors", doctorService.getAll());
        model.addAttribute("contentPage", "/WEB-INF/views/admin/appointments/edit.jsp");
        return "admin/dashboard/index";
    } */
}