package com.klef.jfsd.sdpproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.sdpproject.model.Admin;
import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Resident;
import com.klef.jfsd.sdpproject.repository.AdminRepository;
import com.klef.jfsd.sdpproject.repository.ConsultationRepository;
import com.klef.jfsd.sdpproject.repository.DesignerRepository;
import com.klef.jfsd.sdpproject.repository.ResidentRepository;

import jakarta.transaction.Transactional;

@Service
public class AdminServiceImpl implements AdminService
{
    @Autowired
	private ResidentRepository residentRepository;
    @Autowired
    private AdminRepository adminRepository;
	
    @Autowired
    private ConsultationRepository consultationRepository;
    
    @Autowired
    private DesignerRepository designerRepository;
    
	@Override
	public List<Resident> ViewAllResidents() {
		return residentRepository.findAll();
	}

	@Override
	public Admin checkadminlogin(String aname, String apassword) {
		

		return adminRepository.checkadminlogin(aname, apassword);
	}

	@Override
	@Transactional
	public String deleteres(int id) {
		consultationRepository.deleteByResidentId(id);
		residentRepository.deleteById(id);
		return "Resident Deleted successfully";
	}
	
	@Override
	public String deletedes(int id)
	{
		designerRepository.deleteById(id);
		return "Designer Deleted Successfullt";
	}

	@Override
	public long rescount() {
		return residentRepository.count();
		
	}
	

	public List<Designer> getDesignersByStatus(String status) {
	    return designerRepository.findByStatus(status);
	}

	@Override
	public long descount() {
		return designerRepository.count();
	}
	
	@Override
    public void updateDesignerStatus(int id, String status) {
        Designer designer = designerRepository.findById(id).orElse(null);
        if (designer != null) {
            designer.setStatus(status);
            designerRepository.save(designer);
        }
    }

}