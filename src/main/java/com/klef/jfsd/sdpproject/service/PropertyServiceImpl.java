package com.klef.jfsd.sdpproject.service;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Properties;
import com.klef.jfsd.sdpproject.repository.PropertiesRepository;

@Service
public class PropertyServiceImpl implements PropertyService {

    @Autowired
    private PropertiesRepository propertiesRepository;

    @Override
    public String addProperty(Properties property) {
        // Save the property to the database
        propertiesRepository.save(property);
        return "Property added successfully!";
    }
    
    @Override
    public void saveProperty(Properties property) {
        // Save or update property
        propertiesRepository.save(property);
    }

    @Override
    public List<Properties> getAllProperties() {
        // Fetch all properties from the database
        return propertiesRepository.findAll();
    }


    @Override
    public void uploadImage(MultipartFile image, int propertyId, boolean isBeforeImage) throws IOException {
        // Check if the file is an image (optional, based on requirements)
        if (!image.getContentType().startsWith("image/")) {
            throw new IllegalArgumentException("File must be an image");
        }

        // Convert MultipartFile to byte array
        byte[] imageBytes = image.getBytes();

        // Retrieve the property by its ID
        Properties property = propertiesRepository.findById(propertyId)
                .orElseThrow(() -> new RuntimeException("Property not found"));

        // Set the appropriate image based on the boolean flag
        if (isBeforeImage) {
            property.setBeforeImage(imageBytes);  // Store before image
        } else {
            property.setAfterImage(imageBytes);   // Store after image
        }

        // Save the updated property with the image
        propertiesRepository.save(property);
    }
    
    
    @Override
    public List<Properties> getProjectsByDesignerId(int designerId) {
        // Fetch the projects based on the designer ID
        return propertiesRepository.findByDesignerId(designerId);
    }
    
    

}
