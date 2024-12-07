package com.klef.jfsd.sdpproject.service;

import java.util.List;

import com.klef.jfsd.sdpproject.model.Admin;
import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Resident;

public interface AdminService 
{
	public Admin checkadminlogin(String aname, String apassword);
	public List<Resident> ViewAllResidents();
    public String deleteres(int id);
    public String deletedes(int id);
    public long rescount();
    public long descount();
    public List<Designer> getDesignersByStatus(String status);
    void updateDesignerStatus(int id, String status); 
}
