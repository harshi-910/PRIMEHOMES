package com.klef.jfsd.sdpproject.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Properties;
import com.klef.jfsd.sdpproject.model.Resident;
import com.klef.jfsd.sdpproject.repository.DesignerRepository;
import com.klef.jfsd.sdpproject.repository.PropertiesRepository;
import com.klef.jfsd.sdpproject.repository.ResidentRepository;

@Service
public class ResidentServiceImpl implements ResidentService
{
	@Autowired
	public ResidentRepository residentRepository;

	@Autowired
    private DesignerRepository designerRepository;
	
	@Autowired
	private PropertiesRepository propertiesRepository;
	
	@Override
	public String ResidentRegistration(Resident r) 
	{
		residentRepository.save(r);
		
        return "Registration successful!";
    }

 


	
	@Override
	public Resident checkressignin(String email, String password) {
		return residentRepository.checkressignin(email, password);
	}


	@Override
	public String UpdateResidentProfile(Resident res) {
	    Resident r = residentRepository.findById(res.getId());
	    r.setMobile(res.getMobile());
	    r.setAddressLine(res.getAddressLine());
	    r.setPostcode(res.getPostcode());
	    r.setState(res.getState());
	    r.setArea(res.getArea());
	    r.setCountry(res.getCountry());
	    
	    residentRepository.save(r); // Save the updated resident
	    return "Profile updated successfully!";
	}

	
	   @Override
	    public List<Designer> getAllDesigners() {
	        return designerRepository.findByIsBookedFalse(); 
	    }
	   
	   @Override
	    public String bookDesigner(int designerId, String description, String resmail) {
	        Designer designer = designerRepository.findById(designerId).orElse(null);
	        
	        if (designer != null) {
	            if (designer.getisBooked()) {
	                return "This designer is already booked.";
	            }
	            designer.setEmail(resmail);
	            designer.setBooked(true);
	            designerRepository.save(designer);

	            return "Designer successfully booked for consultation.";
	        } else {
	            return "Designer not found.";
	        }
	    }

	   @Override
		public Resident displayResidentByID(int id)
		{
			return residentRepository.findById(id);
		}


	@Override
	public String addResProfile(Resident resident) {
		Resident r = residentRepository.findById(resident.getId());
	      
	    r.setId(resident.getId());
	    r.setProfilePicture(resident.getProfilePicture());
	    residentRepository.save(r);
	      
	      return "User Profile added Successfully";
	}
	
	
	@Override
    public Designer getDesignerById(int designerId) {
        // Fetching the designer based on ID. If not found, return null or throw exception as per requirement.
        Designer designer = designerRepository.findById(designerId).orElse(null);
        return designer; // Return null if not found, or handle as per business logic
    }

    @Override
    public List<Properties> getProjectsByDesignerId(int designerId) {
        // Fetching all projects associated with the designer by ID
        return propertiesRepository.findByDesignerId(designerId);  // Assuming you have a method in ProjectRepository
    }
}
