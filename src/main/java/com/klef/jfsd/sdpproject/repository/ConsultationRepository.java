package com.klef.jfsd.sdpproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.sdpproject.model.Consultation;

public interface ConsultationRepository extends JpaRepository<Consultation, Integer> {
    public List<Consultation> findByResidentId(int residentId);
    public List<Consultation> findByDesignerId(int designerId);
    
    void deleteByResidentId(int residentId);
}
