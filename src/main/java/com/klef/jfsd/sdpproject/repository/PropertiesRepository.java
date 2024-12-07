package com.klef.jfsd.sdpproject.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.sdpproject.model.Designer;
import com.klef.jfsd.sdpproject.model.Properties;

public interface PropertiesRepository extends JpaRepository<Properties, Integer>
{
	List<Properties> findByDesignerId(int designerId);

}
