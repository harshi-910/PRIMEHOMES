package com.klef.jfsd.sdpproject.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Properties;

public interface PropertyService {
    String addProperty(Properties property);  // Method to add property to the database
    void saveProperty(Properties property);   // Method to save or update the property
    List<Properties> getAllProperties();      // Method to get all properties
    void uploadImage(MultipartFile image, int propertyId, boolean isBeforeImage) throws IOException;  // Method to upload images
    
    List<Properties> getProjectsByDesignerId(int designerId);
	
}
