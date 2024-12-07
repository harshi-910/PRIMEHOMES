package com.klef.jfsd.sdpproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Resident;
import com.klef.jfsd.sdpproject.repository.DesignerRepository;
import com.klef.jfsd.sdpproject.repository.ResidentRepository;

@Service
public class DesignerServiceImpl implements DesignerService {

    @Autowired
    private ResidentRepository residentRepository;

    @Autowired
    private DesignerRepository designerRepository;

    @Override
    public String DesignerRegistration(Designer d) {
      d.setStatus("Pending");
        designerRepository.save(d);
        return "Registration successful";
    }

    @Override
    public Designer checkdesignersignin(String email, String password) {
        Designer designer = designerRepository.checkdesignersignin(email, password);
        if (designer != null && designer.getPassword().equals(password)) {
            return designer; // Return designer if credentials match
        }
        return null; // Return null if credentials are incorrect
    }

    @Override
    public String updateDesignerProfile(Designer designer) {
        try {
            Designer existingDesigner = designerRepository.findById(designer.getId()).orElse(null);

            if (existingDesigner != null) {
                existingDesigner.setName(designer.getName());
                existingDesigner.setEmail(designer.getEmail());
                existingDesigner.setPassword(designer.getPassword());
                existingDesigner.setContact(designer.getContact());
                existingDesigner.setDob(designer.getDob());
                existingDesigner.setGender(designer.getGender());
                existingDesigner.setSkills(designer.getSkills());
                existingDesigner.setExperienceLevel(designer.getExperienceLevel());

                designerRepository.save(existingDesigner);
                return "Profile updated successfully";
            } else {
                return "Designer not found";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "Error updating profile: " + e.getMessage();
        }
    }

    

    @Override
    public long rescount() {
        return designerRepository.count();
    }

   

    @Override
    public Designer displayDesignerByID(int id) {
        return designerRepository.findById(id).orElse(null);
    }

    
    @Override
    public void updateDesigner(Designer designer) {
        designerRepository.save(designer); // Save the updated designer to the database
    }

  @Override
  public List<Designer> findDesignersByStatus(String status) {
     return designerRepository.findByStatus(status);
  }

  @Override
  public List<Designer> findAvailableDesigners() {
     return designerRepository.findByIsBookedFalse();
  }
  
  @Override
	public String addDesProfile(Designer designer) {
		Designer d = designerRepository.findById(designer.getId()).orElse(designer);
	      
	    d.setId(designer.getId());
	    d.setProfilePicture(designer.getProfilePicture());
	    designerRepository.save(d);
	      
	      return "Designer Profile added Successfully";
	}
	
    
    
}