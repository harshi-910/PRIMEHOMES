package com.klef.jfsd.sdpproject.service;

import java.util.List;

import com.klef.jfsd.sdpproject.model.Consultation;
import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Resident;

public interface ConsultationService {
    String bookConsultation(Consultation consultation, Designer designer);
    List<Consultation> getConsultationsForResident(int residentId);
    List<Consultation> getConsultationsForDesigner(int designerId);
    void updateStatusAndBooking(int consultationId, String status);
    
    public Consultation getConsultationById(int consultationId);
}