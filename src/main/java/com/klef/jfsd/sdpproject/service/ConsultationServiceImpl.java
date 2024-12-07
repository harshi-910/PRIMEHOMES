package com.klef.jfsd.sdpproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdpproject.model.Consultation;
import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Resident;
import com.klef.jfsd.sdpproject.repository.ConsultationRepository;
import com.klef.jfsd.sdpproject.repository.DesignerRepository;

@Service
public class ConsultationServiceImpl implements ConsultationService {

    @Autowired
    private ConsultationRepository consultationRepository;

    @Autowired
    private DesignerRepository designerRepository;

    @Override
    public String bookConsultation(Consultation consultation, Designer designer) {
        consultation.setCompleted(false);
        designer.setBooked(true); // Mark designer as booked
        
        designerRepository.save(designer); // Save the updated designer status
        consultationRepository.save(consultation); // Save the consultation details

        return "res_viewalldesigners";
    }



    @Override
    public List<Consultation> getConsultationsForResident(int residentId) {
        return consultationRepository.findByResidentId(residentId);
    }

    @Override
    public List<Consultation> getConsultationsForDesigner(int designerId) {
        return consultationRepository.findByDesignerId(designerId);
    }
    
    @Override
    public void updateStatusAndBooking(int consultationId, String status) {
        Consultation consultation = consultationRepository.findById(consultationId).orElse(null);
        if (consultation != null) {
            // Update the status based on the designer's action
            consultation.setStatus(status);
            consultationRepository.save(consultation);

            // Update isBooked based on status only if Accepted
            if ("Accepted".equalsIgnoreCase(status)) {
                Designer designer = consultation.getDesigner();
                designer.setBooked(true);
                designerRepository.save(designer);
            } else {
                Designer designer = consultation.getDesigner();
                designer.setBooked(false);
                designerRepository.save(designer);
            }
        }
    }

    
    public Consultation getConsultationById(int consultationId) {
        return consultationRepository.findById(consultationId).orElse(null);
    }
}
