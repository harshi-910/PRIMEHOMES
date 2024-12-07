package com.klef.jfsd.sdpproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klef.jfsd.sdpproject.model.Feedback;

public interface FeedbackRepository extends JpaRepository<Feedback, Integer>
{
	

}
