package com.aayushdb.web.entity;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table (name="treatments")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Treatment implements Serializable{
    private static final long serialVersionUID = 1L;
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column (name = "id")
        private Integer id;
        @Column (name = "subject")
        private String subject;
        @Column (name = "message")
        private String message;
        @Basic (optional=false)
        @Column(name="treatment_date", insertable=false, updatable=false)
        private LocalDateTime treatmentDate;
        @JoinColumn(name="patient_id", referencedColumnName = "id")
        @ManyToOne
        @JsonIgnore
        private Patient patient;
}
