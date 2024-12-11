package com.klef.jfsd.sdpproject.controller;


import java.io.IOException;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Properties;
import com.klef.jfsd.sdpproject.model.Resident;
import com.klef.jfsd.sdpproject.service.DesignerService;
import com.klef.jfsd.sdpproject.service.PropertyService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@Controller
public class DesignerController {

    @Autowired
    private DesignerService designerService;
    
    @Autowired
    private PropertyService propertyservice;
   
    @GetMapping("home")
    public ModelAndView index() {
        return new ModelAndView("index");
    }
    
    @PostMapping("insertdesigner")
    public ModelAndView insertDesigner(HttpServletRequest request) {
        String userName = request.getParameter("dname");
        String email = request.getParameter("demail");
        String password = request.getParameter("dpassword");

        Designer designer = new Designer();
        designer.setName(userName);
        designer.setEmail(email);
        designer.setPassword(password);

        String msg = designerService.DesignerRegistration(designer);

        ModelAndView mv = new ModelAndView("designerlogin");
        mv.addObject("message", msg);
        return mv;
    }
    
    @PostMapping("checkdesignersignin")
    public ModelAndView checkDesignerSignin(HttpServletRequest request) {
        String demail = request.getParameter("demail");
        String dpassword = request.getParameter("dpassword");

        Designer designer = designerService.checkdesignersignin(demail, dpassword);
        ModelAndView mv = new ModelAndView();

        if (designer == null) {
            mv.setViewName("designerlogin");
            mv.addObject("message", "Incorrect Credentials. Please enter valid Credentials.");
        } else {
            System.out.println("Designer Status: " + designer.getStatus()); // Debugging
            if ("Rejected".equalsIgnoreCase(designer.getStatus())) {
                mv.setViewName("designerlogin");
                mv.addObject("message", "Your Profile is rejected.");
            } else if ("Accepted".equalsIgnoreCase(designer.getStatus())) {
                HttpSession session = request.getSession();
                session.setAttribute("designer", designer);
                mv.setViewName("redirect:/designerdashboard");
            } else {
                mv.setViewName("designerlogin");
                mv.addObject("message", "Your profile is under review. Please wait for admin approval.");
            }
        }

        return mv;
    }
    
    @GetMapping("designerlogin")
    public ModelAndView designerLogin() {
        return new ModelAndView("designerlogin");
    }
    
  
    @GetMapping("designerdashboard")
    public ModelAndView designerdashboard(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();

        if (session != null) {
            session.setMaxInactiveInterval(7200); 
        }
        if (session == null || session.getAttribute("designer") == null) {
            mv.setViewName("designerlogin");
            mv.addObject("message", "Session expired! Please log in again.");
        } else {
            mv.setViewName("designerdashboard");
        }
        return mv;
    }

    @GetMapping("desprofile")
    public ModelAndView designerProfile(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();

		/*
		 * if (session != null) { session.setMaxInactiveInterval(7200); }
		 */
        if (session == null || session.getAttribute("designer") == null) {
            mv.setViewName("designerlogin");
            mv.addObject("message", "Session Expired!!! Please log in to view your profile.");
        } else {
            mv.setViewName("desprofile");
            Designer designer = (Designer) session.getAttribute("designer");
            mv.addObject("designer", designer);
        }
        return mv;
    }

    @GetMapping("updatedesprofile")
    public ModelAndView updatedesprofile(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();

		/*
		 * if (session != null) { session.setMaxInactiveInterval(7200); }
		 */
        if (session == null || session.getAttribute("designer") == null) {
            mv.setViewName("designerlogin");
            mv.addObject("message", "Session expired! Please log in to update your profile.");
        } else {
            mv.setViewName("updatedesprofile");
            Designer designer = (Designer) session.getAttribute("designer");
            mv.addObject("designer", designer);  
        }

        return mv;
    }

    @PostMapping("updatedesprofile")
    public ModelAndView updateDesignerProfile(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();

		/*
		 * if (session != null) { session.setMaxInactiveInterval(7200); }
		 */
        if (session == null || session.getAttribute("designer") == null) {
            mv.setViewName("designerlogin");
            mv.addObject("message", "Session expired! Please log in again.");
        } else {
            String designerId = request.getParameter("id");
            String dname = request.getParameter("dname");
            String demail = request.getParameter("demail");
            String dpassword = request.getParameter("dpassword");
            String dcontact = request.getParameter("dcontact");
            String ddob = request.getParameter("ddob");
            String dgender = request.getParameter("dgender");
            String dskills = request.getParameter("dskills");
            String dexperienceLevel = request.getParameter("dexperience_level");

            Designer designer = (Designer) session.getAttribute("designer");

            designer.setName(dname);
            designer.setEmail(demail);
            designer.setPassword(dpassword);
            designer.setContact(dcontact);
            designer.setDob(ddob);
            designer.setGender(dgender);
            designer.setSkills(dskills);
            designer.setExperienceLevel(dexperienceLevel);

            designerService.updateDesignerProfile(designer);

            session.setAttribute("designer", designer);

            mv.setViewName("desprofile");
            mv.addObject("message", "Profile updated successfully!");
        }

        return mv;
    }
    
    
    @GetMapping("addproperty")
    public ModelAndView showAddPropertyForm() {
        return new ModelAndView("addproperty");
    }

    private static final long MAX_IMAGE_SIZE = 16 * 1024 * 1024; // 16 MB

    @PostMapping("insertproperty")
    public ModelAndView insertProperty(HttpServletRequest request) throws IOException, ServletException {
        ModelAndView mv = new ModelAndView();

        // Fetch the current session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("designer") == null) {
            mv.setViewName("designerlogin");
            mv.addObject("message", "Session expired! Please log in to add a property.");
            return mv;
        }

        // Fetch the designer from the session
        Designer designer = (Designer) session.getAttribute("designer");

        // Extract form data
        String projectName = request.getParameter("projectName");
        String projectType = request.getParameter("projectType");
        String location = request.getParameter("location");
        String timeline = request.getParameter("timeline");
        String projectCost = request.getParameter("projectCost");
        String highlights = request.getParameter("highlights");
        String designTechniques = request.getParameter("designTechniques");
        String materialsUsed = request.getParameter("materialsUsed");

        // Validate required fields
        if (projectName == null || projectName.isEmpty() || 
            projectType == null || projectType.isEmpty() || 
            location == null || location.isEmpty() || 
            timeline == null || timeline.isEmpty() || 
            projectCost == null || projectCost.isEmpty()) {
            mv.setViewName("addproperty");
            mv.addObject("message", "Please fill in all required fields.");
            return mv;
        }

        // Parse and validate project cost
        double cost;
        try {
            cost = Double.parseDouble(projectCost);
        } catch (NumberFormatException e) {
            mv.setViewName("addproperty");
            mv.addObject("message", "Invalid project cost. Please enter a valid number.");
            return mv;
        }

        // Extract image files
        Part beforeImagePart = request.getPart("beforeImage");
        Part afterImagePart = request.getPart("afterImage");

        // Create a new Property object
        Properties property = new Properties();
        property.setProjectName(projectName);
        property.setProjectType(projectType);
        property.setLocation(location);
        property.setTimeline(timeline);
        property.setProjectCost(cost);
        property.setHighlights(highlights);
        property.setDesignTechniques(designTechniques);
        property.setMaterialsUsed(materialsUsed);
        property.setDesigner(designer);

        if (beforeImagePart != null && beforeImagePart.getSize() > 0) {
            if (beforeImagePart.getSize() > MAX_IMAGE_SIZE) {
                mv.setViewName("addproperty");
                mv.addObject("message", "Image size exceeds the maximum limit of 16 MB.");
                return mv;
            }

            // Convert the before image to byte array
            byte[] beforeImageBytes = beforeImagePart.getInputStream().readAllBytes();
            property.setBeforeImage(beforeImageBytes);
        }

        if (afterImagePart != null && afterImagePart.getSize() > 0) {
            if (afterImagePart.getSize() > MAX_IMAGE_SIZE) {
                mv.setViewName("addproperty");
                mv.addObject("message", "Image size exceeds the maximum limit of 16 MB.");
                return mv;
            }

            // Convert the after image to byte array
            byte[] afterImageBytes = afterImagePart.getInputStream().readAllBytes();
            property.setAfterImage(afterImageBytes);
        }

        // Save the property in the database
        propertyservice.addProperty(property);

        // Show success message
        mv.setViewName("addproperty");
        mv.addObject("message", "Property added successfully!");
        return mv;
    
}

    @GetMapping("propertiestable")
    public ModelAndView propertiestable(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();

        if (session == null || session.getAttribute("designer") == null) {
            mv.setViewName("designerlogin");
            mv.addObject("message", "Session expired! Please log in to view properties.");
        } else {
            mv.setViewName("propertiestable");

            // Fetch designer details
            Designer designer = (Designer) session.getAttribute("designer");
            mv.addObject("designer", designer);

            // Get the designer's ID
            int designerId = designer.getId(); // Assuming the designer object has a method getId()

            // Fetch property list from service based on designer ID
            List<Properties> propertiesList = propertyservice.getProjectsByDesignerId(designerId);

            // Check if there are no properties
            if (propertiesList.isEmpty()) {
                mv.addObject("message", "No projects yet. Please add a property.");
            } else {
                // Encode images for all properties and add them to a new list
                List<Map<String, Object>> propertiesWithImages = new ArrayList<>();
                for (Properties property : propertiesList) {
                    Map<String, Object> propertyMap = new HashMap<>();
                    propertyMap.put("property", property);
                    propertyMap.put("beforeImageBase64", encodeImageToBase64(property.getBeforeImage()));
                    propertyMap.put("afterImageBase64", encodeImageToBase64(property.getAfterImage()));
                    propertiesWithImages.add(propertyMap);
                }

                mv.addObject("propertiesWithImages", propertiesWithImages);
            }
        }

        return mv;
    }



    // Utility method for Base64 encoding
    private String encodeImageToBase64(byte[] imageBytes) {
        if (imageBytes != null) {
            return Base64.getEncoder().encodeToString(imageBytes);
        }
        return null;
    }



    
    
    
    @GetMapping("deslogout")
    public ModelAndView designerLogout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); 
        }
        return new ModelAndView("index");
    }
    
    
    
    @PostMapping("/addprofilepicture")
    public ModelAndView adduserprofile(HttpServletRequest request, @RequestParam("profile") MultipartFile file)
        throws Exception {
      ModelAndView mv = new ModelAndView();
      try {
        HttpSession session = request.getSession();
        Designer d = (Designer) session.getAttribute("designer");

        byte[] bytes = file.getBytes();
        Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

        Designer ds = new Designer();
        ds.setId(d.getId());
        ds.setProfilePicture(blob);

        String msg = designerService.addDesProfile(ds);

        Designer designer = designerService.displayDesignerByID(d.getId());
        session.setAttribute("designer", designer);

        mv.setViewName("desprofile");
        mv.addObject("smessage", msg);

      } catch (Exception e) {
        mv.setViewName("desprofile");
        mv.addObject("fmessage", e);
      }
      return mv;
    }

    @GetMapping("displayprofilepicture")
    public ResponseEntity<byte[]> displayprofilepic(@RequestParam(required = false) String id) throws Exception {
        if (id == null || id.isEmpty()) {
            return ResponseEntity.badRequest().build();
        }
        
        try {
            int designerId = Integer.parseInt(id);
            Designer designer = designerService.displayDesignerByID(designerId);
            
            if (designer == null || designer.getProfilePicture() == null) {
                return ResponseEntity.notFound().build();
            }
            
            byte[] imageBytes = designer.getProfilePicture().getBytes(1, (int) designer.getProfilePicture().length());
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
        } catch (NumberFormatException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    
    

    
    
}
