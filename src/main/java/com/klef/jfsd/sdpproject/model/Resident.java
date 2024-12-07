package com.klef.jfsd.sdpproject.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "resident_table")
public class Resident 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    @Column(name="id")
    private int id;
    
    @Column(name="rname", nullable=false, length = 50)
    private String UserName;
    
    @Column(name="remail", nullable=false, unique = true, length = 50)
    private String Email;
    
    @Column(name="rpassword", nullable=false, length = 50)
    private String Password;
    
    // Additional profile fields that can be updated later
    @Column(name="mobile", length = 15)
    private String mobile;
    
    @Column(name="address_line", length = 255)
    private String addressLine;
    
    private Blob ProfilePicture;
    
    
    @Column(name="postcode", length = 10)
    private String postcode;
    
    @Column(name="state", length = 50)
    private String state;
    
    @Column(name="area", length = 50)
    private String area;
    
    @Column(name="country", length = 50)
    private String country;
    
    
    
    
    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        this.UserName = userName;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        this.Email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        this.Password = password;
    }

    // Additional profile fields getters and setters
    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddressLine() {
        return addressLine;
    }

    public void setAddressLine(String addressLine1) {
        this.addressLine = addressLine1;
    }

    

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

	public Blob getProfilePicture() {
		return ProfilePicture;
	}

	public void setProfilePicture(Blob profilePicture) {
		ProfilePicture = profilePicture;
	}

	
}
