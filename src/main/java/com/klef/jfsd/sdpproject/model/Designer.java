package com.klef.jfsd.sdpproject.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="designer_table")
public class Designer 
{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name="did")
    private int id;
    
    @Column(name="dname", length=50)
    private String name;

    @Column(name="demail", length=100,unique=true, nullable=false)
    private String email;
    
    @Column(name="dpassword",length=50,nullable=false)
	private String password;

    @Column(name="dcontact", length=15)
    private String contact;

    @Column(name="ddob")
    private String dob;  

    @Column(name="dgender", length=10)
    private String gender;

    @Column(name="dskills", length=255)
    private String skills;

    @Column(name="dexperience_level", length=20)
    private String experienceLevel;

    @Column(name="dstatus", length=20)
    private String status;

    @Column(name="dis_booked")
    private boolean isBooked;
    
    private Blob ProfilePicture;
    
    
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    
    public String getDob() {
        return dob;
    }
    public void setDob(String dob) {
        this.dob = dob;
    }
    
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public String getSkills() {
        return skills;
    }
    public void setSkills(String skills) {
        this.skills = skills;
    }
    
    public String getExperienceLevel() {
        return experienceLevel;
    }
    public void setExperienceLevel(String experienceLevel) {
        this.experienceLevel = experienceLevel;
    }
    
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    
    public boolean getisBooked() {
        return isBooked;
    }
    
	public boolean isBooked() {
		return isBooked;
	}
	public void setBooked(boolean isBooked) {
        this.isBooked = isBooked;
    }
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Blob getProfilePicture() {
		return ProfilePicture;
	}
	public void setProfilePicture(Blob profilePicture) {
		ProfilePicture = profilePicture;
	}
}
