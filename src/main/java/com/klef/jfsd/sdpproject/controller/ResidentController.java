package com.klef.jfsd.sdpproject.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Properties;
import com.klef.jfsd.sdpproject.model.Resident;
import com.klef.jfsd.sdpproject.service.ConsultationService;
import com.klef.jfsd.sdpproject.service.DesignerService;
import com.klef.jfsd.sdpproject.service.PropertyService;
import com.klef.jfsd.sdpproject.service.ResidentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ResidentController {

    @Autowired
    private ResidentService residentService;

    @Autowired
    private DesignerService designerService;

    @Autowired
    private ConsultationService consultationService;
    
    @Autowired
    private JavaMailSender mailSender;
    
    @Autowired
    private PropertyService propertyService;
    @GetMapping("getstarted")
    public ModelAndView getstarted() {
        return new ModelAndView("getstarted");
    }
    
    @GetMapping("index")
    public ModelAndView home() {
        return new ModelAndView("index");
    }

    @GetMapping("login")
    public ModelAndView login() {
        return new ModelAndView("login");
    }
    
    @PostMapping("insertresident")
    public ModelAndView insertResident(HttpServletRequest request) {
        String userName = request.getParameter("rname");
        String email = request.getParameter("remail");
        String password = request.getParameter("rpassword");

        Resident resident = new Resident();
        resident.setUserName(userName);
        resident.setEmail(email);
        resident.setPassword(password);

        String msg = residentService.ResidentRegistration(resident);
        ModelAndView mv = new ModelAndView("login");
        mv.addObject("message", msg);

        return mv;
    }

    @PostMapping("checkressignin")
    public ModelAndView checkResidentSignin(HttpServletRequest request) {
        String remail = request.getParameter("remail");
        String rpwd = request.getParameter("rpwd");

        Resident resident = residentService.checkressignin(remail, rpwd);
        ModelAndView mv = new ModelAndView();

        if (resident != null) {
            HttpSession session = request.getSession();
            session.setAttribute("resident", resident);
            mv.setViewName("residentdashboard");
        } else {
            mv.setViewName("login");
            mv.addObject("message", "Incorrect username or password.");
        }
        return mv;
    }
    
    @GetMapping("residentdashboard")
    public ModelAndView residentdashboard(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();

        if (session != null) {
            session.setMaxInactiveInterval(7200); 
        }
        if (session == null || session.getAttribute("resident") == null) {
            mv.setViewName("login");
            mv.addObject("message", "Session expired! Please log in again.");
        } else {
            mv.setViewName("residentdashboard");
        }
        return mv;
    }

    @GetMapping("resprofile")
    public ModelAndView residentProfile(HttpServletRequest request) {
        HttpSession session = request.getSession(false); 
        ModelAndView mv = new ModelAndView();

        if (session != null) {
            session.setMaxInactiveInterval(7200); 
        }
        if (session == null || session.getAttribute("resident") == null) {
            mv.setViewName("login"); 
            mv.addObject("message", "Your session has expired. Please log in again.");
        } else {
            mv.setViewName("resprofile");
        }

        return mv;
    }
   
    @GetMapping("residentnavbar")
    public ModelAndView residentNavbar(HttpServletRequest request) {
        HttpSession session = request.getSession(false);  // Avoid creating a new session if it doesn't exist
        ModelAndView mv = new ModelAndView();

        if (session != null) {
            session.setMaxInactiveInterval(7200); 
        }
        if (session == null || session.getAttribute("resident") == null) {
            mv.setViewName("login"); // Redirect to login if session expired or doesn't exist
            mv.addObject("message", "Your session has expired. Please log in again.");
        } else {
            mv.setViewName("residentnavbar");
        }

        return mv;
    }
    
    @GetMapping("portfolio-details")
    public ModelAndView portfolio_details()
    {
    	return new ModelAndView("portfolio-details");
    }
    @GetMapping("blog-details")
    public ModelAndView blog_details() {
        return new ModelAndView("blog-details");
    }
    @GetMapping("blog-details1")
    public ModelAndView blog_details1() {
        return new ModelAndView("blog-details1");
    }
    @GetMapping("blog-details2")
    public ModelAndView blog_details2() {
        return new ModelAndView("blog-details2");
    }
    @GetMapping("residentfooter")
    public ModelAndView residentfooter() {
        return new ModelAndView("residentfooter");
    }
    @GetMapping("feedback")
    public ModelAndView feedback() {
        return new ModelAndView("feedback");
    }
    @GetMapping("service-details")
    public ModelAndView servicedetails(){
    	ModelAndView mv = new ModelAndView("service-details");
    	return mv;
    }
    
   
    
    @GetMapping("updateresprofile")
    public ModelAndView updateresprofile() {
        return new ModelAndView("updateresprofile");
    }
    

    @PostMapping("updateresprofile")
    public ModelAndView updateResidentProfile(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Resident resident = residentService.displayResidentByID(id);

            String mobile = request.getParameter("mobile");
            String addressLine1 = request.getParameter("addressLine1");
            String addressLine2 = request.getParameter("addressLine2");
            String postcode = request.getParameter("postcode");
            String state = request.getParameter("state");
            String area = request.getParameter("area");
            String country = request.getParameter("country");

            if (mobile != null && !mobile.isEmpty()) resident.setMobile(mobile);
            if (addressLine1 != null && !addressLine1.isEmpty()) resident.setAddressLine(addressLine1);
            if (postcode != null && !postcode.isEmpty()) resident.setPostcode(postcode);
            if (state != null && !state.isEmpty()) resident.setState(state);
            if (area != null && !area.isEmpty()) resident.setArea(area);
            if (country != null && !country.isEmpty()) resident.setCountry(country);

            String msg = residentService.UpdateResidentProfile(resident);

            HttpSession session = request.getSession();
            session.setAttribute("resident", resident);

            mv.setViewName("redirect:/resprofile"); 
            mv.addObject("message", msg);
        } catch (Exception e) {
            mv.setViewName("resprofile");
            mv.addObject("message", "Error: " + e.getMessage());
        }
        return mv;
    }
    

    
    @GetMapping("res_viewalldesigners")
    public ModelAndView viewAllDesigners(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        List<Designer> designerList = residentService.getAllDesigners();

        if (designerList == null || designerList.isEmpty()) {
            mv.setViewName("res_viewalldesigners");
            mv.addObject("message", "No designers available at the moment.");
        } else {
            mv.setViewName("res_viewalldesigners");
            mv.addObject("designerList", designerList); // Pass designers to the view
        }

        return mv;
    }
    
   

    

    @GetMapping("reslogout")
    public ModelAndView residentLogout(HttpServletRequest request) {
        HttpSession session = request.getSession(false); 
        if (session != null) {
            session.invalidate(); 
        }
        return new ModelAndView("login").addObject("message", "You have successfully logged out.");
    }
    
    

    @PostMapping("/addprofilepic")
    public ModelAndView adduserprofile(HttpServletRequest request, @RequestParam("profile") MultipartFile file)
        throws Exception {
      ModelAndView mv = new ModelAndView();
      try {
        HttpSession session = request.getSession();
        Resident r = (Resident) session.getAttribute("resident");

        byte[] bytes = file.getBytes();
        Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);

        Resident rs = new Resident();
        rs.setId(r.getId());
        rs.setProfilePicture(blob);

        String msg = residentService.addResProfile(rs);

        Resident resident = residentService.displayResidentByID(r.getId());
        session.setAttribute("resident", resident);

        mv.setViewName("resprofile");
        mv.addObject("smessage", msg);

      } catch (Exception e) {
        mv.setViewName("resprofile");
        mv.addObject("fmessage", e);
      }
      return mv;
    }

    @GetMapping("displayprofilepic")
    public ResponseEntity<byte[]> displayprofilepic(@RequestParam(required = false) String id) throws Exception {
        if (id == null || id.isEmpty()) {
            return ResponseEntity.badRequest().build();
        }
        
        try {
            int residentId = Integer.parseInt(id);
            Resident resident = residentService.displayResidentByID(residentId);
            
            if (resident == null || resident.getProfilePicture() == null) {
                return ResponseEntity.notFound().build();
            }
            
            byte[] imageBytes = resident.getProfilePicture().getBytes(1, (int) resident.getProfilePicture().length());
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
        } catch (NumberFormatException e) {
            return ResponseEntity.badRequest().build();
        }
    }

    
    @RequestMapping("/designerProjectsPage")
    public String getDesignerProjects(@RequestParam("designerId") int designerId, Model model) {
        Designer designer = designerService.displayDesignerByID(designerId); // Assuming designerService returns a Designer
        if (designer != null) {
            List<Properties> properties = propertyService.getProjectsByDesignerId(designerId); // Get properties for the designer
            model.addAttribute("designer", designer);
            model.addAttribute("properties", properties);
        } else {
            model.addAttribute("errorMessage", "Designer not found");
        }
        return "designerProjectsPage";
    }



    @PostMapping("/sendemail")
    public String sendEmail(HttpServletRequest request, Model model) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        try {
            SimpleMailMessage mailMessage = new SimpleMailMessage();
            mailMessage.setFrom("sdpproject29@gmail.com"); // Sender's email
            mailMessage.setTo(email); // Recipient's email
            mailMessage.setSubject(subject);
            mailMessage.setText("Hi " + name + ",\n\n" + message);

            mailSender.send(mailMessage);

            model.addAttribute("sentMessage", "Your message has been sent successfully!");
            model.addAttribute("errorMessage", null);
        } catch (Exception e) {
            model.addAttribute("sentMessage", null);
            model.addAttribute("errorMessage", "Failed to send the message. Please try again.");
        }

        return "residentdashboard"; // Adjust if using redirect
    }

    
}
