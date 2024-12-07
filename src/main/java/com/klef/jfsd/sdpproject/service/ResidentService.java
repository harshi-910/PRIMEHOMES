package com.klef.jfsd.sdpproject.service;

import java.util.List;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Properties;
import com.klef.jfsd.sdpproject.model.Resident;

public interface ResidentService 
{
	public String ResidentRegistration(Resident r);
	public Resident checkressignin(String email, String password);
	public String UpdateResidentProfile(Resident res);
	
	 public Resident displayResidentByID(int id);
	
	 public String addResProfile(Resident resident);
	 public List<Designer> getAllDesigners();
	 public String bookDesigner(int designerId, String description, String resmail);
	 
	 
	// Method to fetch the designer details based on designer ID
	    Designer getDesignerById(int designerId);

	    // Method to fetch all projects of a designer based on designer ID
	    List<Properties> getProjectsByDesignerId(int designerId);
}
