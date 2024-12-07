package com.klef.jfsd.sdpproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Resident;

@Repository
public interface DesignerRepository extends JpaRepository<Designer, Integer>

{
  @Query("select d from Designer d where d.email=?1 and d.password=?2")
  public Designer checkdesignersignin(String email,String password);
  
  List<Designer> findByIsBookedFalse();
  List<Designer> findByStatus(String status);
  
  //public Designer findById(int id);

}