/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.entity;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;



/**
 *
 * @author dell
 */

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table (name="appointments")
public class Appointment extends GenericEntity<Appointment> {
        
        @Column(name="status", nullable=false)
        private String status;
        @Column(name="date", nullable=false)
        private LocalDate appointmentDate;
        @Column(name="time", nullable=false)
        private LocalTime appointmentTime;
        @Column(name="pre_op_notes")
        private String preOpNotes;
        @ManyToOne
        @JoinColumn(name = "patient_id")
        private Patient patient;

        @ManyToMany
        @JoinTable(
            name = "appointment_doctors",
            joinColumns = @JoinColumn(name = "appointment_id"),
            inverseJoinColumns = @JoinColumn(name = "doctor_id")
        )
        private Set<Doctor> doctors;
}