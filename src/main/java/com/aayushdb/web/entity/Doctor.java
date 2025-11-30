/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aayushdb.web.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
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
@Table (name="doctors")
public class Doctor extends GenericEntity<Doctor> {
       
        @Column(name="name")
        private String name;
        @Column(name="email")
        private String email;
        @Column(name="status", nullable=false)
        private Boolean status;
        @ManyToMany(mappedBy = "doctors")
        private Set<Appointment> appointments;
}