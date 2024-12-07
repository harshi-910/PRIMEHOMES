package com.klef.jfsd.sdpproject.model;

import jakarta.persistence.*;

@Entity
@Table(name = "project_table")
public class Properties {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "project_id")
    private int id;

    @Column(name = "project_name", length = 100, nullable = false)
    private String projectName;

    @Column(name = "project_type", length = 50, nullable = false)
    private String projectType;

    @Column(name = "location", length = 100)
    private String location;

    @Column(name = "timeline", length = 50)
    private String timeline;

    @Column(name = "project_cost")
    private Double projectCost;

    @Column(name = "highlights", length = 500)
    private String highlights;

    @Lob
    @Column(name = "before_image")
    private byte[] beforeImage;  // BLOB data for before image

    @Lob
    @Column(name = "after_image")
    private byte[] afterImage;   // BLOB data for after image

    @Column(name = "client_feedback", length = 500)
    private String clientFeedback; 

    @Column(name = "design_techniques", length = 255)
    private String designTechniques;

    @Column(name = "materials_used", length = 255)
    private String materialsUsed;

    @ManyToOne
    @JoinColumn(name = "designer_id", nullable = false)
    private Designer designer;

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectType() {
        return projectType;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTimeline() {
        return timeline;
    }

    public void setTimeline(String timeline) {
        this.timeline = timeline;
    }

    public Double getProjectCost() {
        return projectCost;
    }

    public void setProjectCost(Double projectCost) {
        this.projectCost = projectCost;
    }

    public String getHighlights() {
        return highlights;
    }

    public void setHighlights(String highlights) {
        this.highlights = highlights;
    }

    public byte[] getBeforeImage() {
        return beforeImage;
    }

    public void setBeforeImage(byte[] beforeImage) {
        this.beforeImage = beforeImage;
    }

    public byte[] getAfterImage() {
        return afterImage;
    }

    public void setAfterImage(byte[] afterImage) {
        this.afterImage = afterImage;
    }

    public String getClientFeedback() {
        return clientFeedback;
    }

    public void setClientFeedback(String clientFeedback) {
        this.clientFeedback = clientFeedback;
    }

    public String getDesignTechniques() {
        return designTechniques;
    }

    public void setDesignTechniques(String designTechniques) {
        this.designTechniques = designTechniques;
    }

    public String getMaterialsUsed() {
        return materialsUsed;
    }

    public void setMaterialsUsed(String materialsUsed) {
        this.materialsUsed = materialsUsed;
    }

    public Designer getDesigner() {
        return designer;
    }

    public void setDesigner(Designer designer) {
        this.designer = designer;
    }
}
