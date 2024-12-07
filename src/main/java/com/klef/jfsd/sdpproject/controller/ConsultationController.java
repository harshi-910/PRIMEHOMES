package com.klef.jfsd.sdpproject.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdpproject.model.Consultation;
import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Resident;
import com.klef.jfsd.sdpproject.repository.DesignerRepository;
import com.klef.jfsd.sdpproject.service.ConsultationService;
import com.klef.jfsd.sdpproject.service.DesignerService;
import com.klef.jfsd.sdpproject.service.ResidentService;

import jakarta.servlet.http.HttpSession;

@Controller
public class ConsultationController {

    @Autowired
    private ConsultationService consultationService;
    @Autowired
    private DesignerRepository designerRepository; // Inject DesignerRepository

    @Autowired
    private DesignerService designerService;
    
    @Autowired
    private ResidentService residentService;

    // View all consultations for a resident
    @GetMapping("resident_consultations")
    public ModelAndView viewResidentConsultations(HttpSession session) {
        Resident resident = (Resident) session.getAttribute("resident");
        List<Consultation> consultations = consultationService.getConsultationsForResident(resident.getId());

        ModelAndView mv = new ModelAndView("resident_consultations");
        mv.addObject("consultations", consultations);
        return mv;
    }

    // Book a consultation
    @PostMapping("/bookconsultation")
    public ModelAndView bookConsultation(
            @RequestParam("designerId") int designerId,
            @RequestParam("description") String description,
            @RequestParam("consultationDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate consultationDate,
            @RequestParam("consultationTime") @DateTimeFormat(iso = DateTimeFormat.ISO.TIME) LocalTime consultationTime,
            @RequestParam("projectType") String projectType,
            @RequestParam("communicationMethod") String communicationMethod,
            @RequestParam("location") String location,
            @RequestParam("attachment") String attachment,
            @RequestParam("budget") Double budget,
            HttpSession session) {

        Resident resident = (Resident) session.getAttribute("resident");

        // Retrieve designer based on designerId
        Designer designer = designerRepository.findById(designerId)
                .orElseThrow(() -> new RuntimeException("Designer not found with ID: " + designerId));

        // Populate Consultation object
        Consultation consultation = new Consultation();
        consultation.setResident(resident);
        consultation.setDesigner(designer);
        consultation.setDescription(description);
        consultation.setConsultationDate(consultationDate);
        consultation.setConsultationTime(consultationTime);
        consultation.setProjectType(projectType);
        consultation.setCommunicationMethod(communicationMethod);
        consultation.setLocation(location);
        consultation.setAttachment(attachment);
        consultation.setBudget(budget);
        consultation.setStatus("Pending");
        consultation.setCompleted(false);

        // Call service to book consultation
        String message = consultationService.bookConsultation(consultation, designer);

        ModelAndView mv = new ModelAndView("redirect:/resident_consultations");
        mv.addObject("message", message);
        return mv;
    }


    // View all consultations for a designer
    @GetMapping("designer_consultations")
    public ModelAndView viewDesignerConsultations(HttpSession session) {
        Designer designer = (Designer) session.getAttribute("designer");


        List<Consultation> consultations = consultationService.getConsultationsForDesigner(designer.getId());
        ModelAndView mv = new ModelAndView("designer_consultations");
        mv.addObject("consultations", consultations);
        return mv;
    }


    // Book consultation page (GET request)
    @GetMapping("/res_bookconsultation")
    public ModelAndView bookConsultationPage(@RequestParam("designerId") int designerId, HttpSession session) {
        Designer designer = designerService.displayDesignerByID(designerId);
        Resident resident = (Resident) session.getAttribute("resident");

        ModelAndView mv = new ModelAndView("res_bookconsultation");
        mv.addObject("designer", designer);
        mv.addObject("resident", resident);
        return mv;
    }
    
 // ConsultationController.java
    @PostMapping("/updateConsultationStatus")
    public String updateConsultationStatus(
        @RequestParam(name = "id", required = false, defaultValue = "0") int consultationId, 
        @RequestParam("status") String status, 
        HttpSession session) {

        if (consultationId == 0) {
            return "redirect:/error";  // Redirect to an error page or display a message
        }

        Consultation consultation = consultationService.getConsultationById(consultationId);

        if (consultation != null) {
            // Only update status if it's pending and the designer is the one approving
            if ("Pending".equalsIgnoreCase(consultation.getStatus()) && "Accepted".equalsIgnoreCase(status)) {
                consultationService.updateStatusAndBooking(consultationId, "Accepted");
            } else if ("Rejected".equalsIgnoreCase(status)) {
                consultationService.updateStatusAndBooking(consultationId, "Rejected");
            }
        }

        // Redirect based on session
        if (session.getAttribute("designer") != null) {
            return "redirect:/designer_consultations";
        } else if (session.getAttribute("resident") != null) {
            return "redirect:/resident_consultations";
        }
        return "redirect:/login";
    }









}
