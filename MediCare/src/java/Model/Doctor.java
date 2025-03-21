/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class Doctor {
    private int id;
    private User user;  
    private String specialization;
    private int experienceYears;
    private String hospital;

    public Doctor() {
    }
    

    public Doctor(int id, User user, String specialization, int experienceYears, String hospital) {
        this.id = id;
        this.user = user;
        this.specialization = specialization;
        this.experienceYears = experienceYears;
        this.hospital = hospital;
    }

    public int getId() { return id; }
    public User getUser() { return user; }  // Trả về User thay vì userId
    public String getSpecialization() { return specialization; }
    public int getExperienceYears() { return experienceYears; }
    public String getHospital() { return hospital; }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public void setExperienceYears(int experienceYears) {
        this.experienceYears = experienceYears;
    }

    public void setHospital(String hospital) {
        this.hospital = hospital;
    }
    
    
    
}
