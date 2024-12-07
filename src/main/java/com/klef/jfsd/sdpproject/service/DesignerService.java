package com.klef.jfsd.sdpproject.service;

import java.util.List;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Resident;

public interface DesignerService {
    public String DesignerRegistration(Designer d);
    public Designer checkdesignersignin(String email, String password);
    public String updateDesignerProfile(Designer designer);
    public long rescount();
    public Designer displayDesignerByID(int id);
    void updateDesigner(Designer designer);
    List<Designer> findDesignersByStatus(String status);
    List<Designer> findAvailableDesigners();
    
    public String addDesProfile(Designer designer);
   
}