package com.klef.jfsd.sdpproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Resident;

@Repository
public interface ResidentRepository extends JpaRepository<Resident, Integer>
{
	@Query("select r from Resident r where r.Email=?1 and r.Password=?2")
    
	public Resident checkressignin(String email, String password);

	public Resident findById(int id);
	
}
