package com.klef.jfsd.sdpproject.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.sdpproject.model.Admin;
import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Resident;
import com.klef.jfsd.sdpproject.service.AdminService;
import com.klef.jfsd.sdpproject.service.DesignerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private DesignerService designerService;
    
    @GetMapping("adminlogin")
   public ModelAndView adminlogin() {
       ModelAndView mv = new ModelAndView();
       mv.setViewName("adminlogin");
       return mv;
   }
    
    @PostMapping("checkadminlogin")
    public ModelAndView checkadminlogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ModelAndView mv = new ModelAndView();
        String aname = request.getParameter("aname");
        String apassword = request.getParameter("apassword");

        
        if (aname == null || aname.isEmpty() || apassword == null || apassword.isEmpty()) {
            mv.setViewName("adminlogin");
            mv.addObject("message", "Username and password are required.");
            return mv;
        }

        Admin admin = adminService.checkadminlogin(aname, apassword);

        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            mv.setViewName("redirect:admindashboard");
        } else {
            mv.setViewName("adminlogin");
            mv.addObject("message", "Invalid credentials. Please try again.");
        }
        return mv;
    }

    @GetMapping("admindashboard")
    public ModelAndView admindashboard(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();

        if (session != null) {
            session.setMaxInactiveInterval(7200); 
        }

        if (session == null || session.getAttribute("admin") == null) {
            mv.setViewName("adminlogin"); 
            mv.addObject("message", "Session Expired! Please Login Again"); 
        } else {
            mv.setViewName("admindashboard"); 
        }

        return mv;
    }


   
    
    @GetMapping("admin_viewallresidents")
    public ModelAndView viewallresidents(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();

        if (session != null) {
            session.setMaxInactiveInterval(7200); 
        }
        if (session == null || session.getAttribute("admin") == null) {
            mv.setViewName("adminlogin"); 
            mv.addObject("message", "Session Expired! Please Login Again");
        } else {
            List<Resident> residentlist = adminService.ViewAllResidents();
            mv.setViewName("admin_viewallresidents");
            mv.addObject("residentlist", residentlist);

            long count = adminService.rescount();
            mv.addObject("count", count);
        }

        return mv;
    }

    
    @GetMapping("viewalldesigners")
    public ModelAndView viewAllDesigners(HttpServletRequest request, @RequestParam(value = "status", defaultValue = "pending") String status) {
        HttpSession session = request.getSession(false);
        ModelAndView mv = new ModelAndView();

        if (session != null) {
            session.setMaxInactiveInterval(7200);
        }

        if (session == null || session.getAttribute("admin") == null) {
            mv.setViewName("adminlogin");
            mv.addObject("message", "Session Expired! Please Login Again");
        } else {
            List<Designer> designerList;
            if ("approved".equalsIgnoreCase(status)) {
                designerList = adminService.getDesignersByStatus("Accepted");
            } else {
                designerList = adminService.getDesignersByStatus("Pending");
            }
            
            mv.setViewName("viewalldesigners");
            mv.addObject("designerlist", designerList);
            mv.addObject("count", designerList.size());
            mv.addObject("status", status);
        }
        return mv;
    }


    
    @GetMapping("deleteres")
    public String deleteres(@RequestParam("id") int id)
    {
    	adminService.deleteres(id);
    	return "redirect:/admin_viewallresidents";
    }
    
    @GetMapping("deletedes")
    public String deletedes(@RequestParam("id") int id)
    {
    	adminService.deletedes(id);
    	return "redirect:/viewalldesigners";
    }

    
    @PostMapping("/updatedesignerstatus")
    public String updateDesignerStatus(@RequestParam("id") int designerId, 
                                       @RequestParam("status") String status) {
        Designer designer = designerService.displayDesignerByID(designerId);

        if (designer != null) {
            designer.setStatus(status);
            designerService.updateDesigner(designer); // Calls the updated method
        }

        return "redirect:/viewalldesigners"; // Redirects after updating
    }


    
    @PostMapping("/acceptConsultation")
    public String acceptConsultation(@RequestParam("id") int designerId, Model model) {
        Designer designer = designerService.displayDesignerByID(designerId);
        if (designer == null) {
            model.addAttribute("errorMessage", "Designer not found.");
            return "error";  // Return an error page
        }

        if ("accepted".equalsIgnoreCase(designer.getStatus())) {
            designer.setBooked(true);
            designerService.updateDesigner(designer);
            model.addAttribute("successMessage", "Designer accepted successfully!");
        } else {
            model.addAttribute("errorMessage", "Designer status is not 'accepted'.");
        }

        return "redirect:/designer_consultations";
    }



    @GetMapping("adminlogout")
    public ModelAndView adminLogout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        ModelAndView mv = new ModelAndView("adminlogin");
        mv.addObject("message", "You have successfully logged out.");
        return mv;
    }
}
