/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;


/**
 *
 * @author dell
 */

@Entity
@Table (name="patients")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Patient extends GenericEntity<Patient> {
        @Column(name="first_name")
        private String firstName;
        @Column(name="middle_name")
        private String middleName;
        @Column(name="last_name")
        private String lastName;
        @DateTimeFormat(pattern = "yyyy-MM-dd")
        @Column(name="date_of_birth")
        private LocalDate dateOfBirth;
        @Column(name="age")
        private int age;
        @Column(name="gender")
        private String gender;
        @Column(name="address")
        private String address;
        @Column(name="contact_no")
        private String contactNo;
        @Column(name="email")
        private String email;
        @Column(name="notes")
        private String notes;
        @Column(name="status", nullable=false)
        private Boolean status;
        @Column(name="patient_tags")
        private String patientTags;
        @OneToMany(mappedBy = "patient")
        @JsonIgnore
        private List<Treatment> treatmentList;        
}