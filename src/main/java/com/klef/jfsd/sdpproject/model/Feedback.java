package com.klef.jfsd.sdpproject.model;

import jakarta.persistence.*;

@Entity
@Table(name = "feedback_table")
public class Feedback {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "feedback_id")
    private int id;

    @Column(name = "name", length = 100, nullable = false)
    private String name;

    @Column(name = "email", length = 100, nullable = false)
    private String email;

    @Column(name = "message", length = 500)
    private String message;

    @Column(name = "rating", nullable = false)
    private int rating;

    // Association to the Designer table
    @ManyToOne
    @JoinColumn(name = "designer_id", nullable = false)
    private Designer designer;

    // Association to the Properties (Project) table
    @ManyToOne
    @JoinColumn(name = "property_id", nullable = false)
    private Properties property; // Link to the Properties (Project) table

    // Default constructor
    public Feedback() {}

    // Parameterized constructor
    public Feedback(String name, String email, String message, int rating, Designer designer, Properties property) {
        this.name = name;
        this.email = email;
        this.message = message;
        this.rating = rating;
        this.designer = designer;
        this.property = property;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Designer getDesigner() {
        return designer;
    }

    public void setDesigner(Designer designer) {
        this.designer = designer;
    }

    public Properties getProperty() {
        return property;
    }

    public void setProperty(Properties property) {
        this.property = property;
    }

    @Override
    public String toString() {
        return "Feedback{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", message='" + message + '\'' +
                ", rating=" + rating +
                ", designer=" + designer +
                ", property=" + property +
                '}';
    }
}
