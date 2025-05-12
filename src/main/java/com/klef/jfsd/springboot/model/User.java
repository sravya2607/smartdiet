package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import javax.sql.rowset.serial.SerialBlob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user_table")
public class User {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // this is auto increment
    @Column(name = "user_id")
    private int id;

    @Column(name = "user_name", nullable = false, length = 100)
    private String name;

    @Column(name = "user_gender", nullable = false, length = 10)
    private String gender;

    @Column(name = "user_dob", nullable = false, length = 20)
    private String dateofbirth;

    @Column(name = "user_email", nullable = false, unique = true, length = 100)
    private String email;

    @Column(name = "user_password", nullable = false, length = 100)
    private String password;

    @Column(name = "user_contact", nullable = false, unique = true, length = 10)
    private String contactno;

    @Column(name = "user_height", nullable = true)
    private double height;

    @Column(name = "user_weight", nullable = true)
    private double weight;

    @Column(name = "user_activity", nullable = true, length = 100) // Allowing null
    private String activityLevel;
    
    @Column(name = "user_BMI", nullable = true) // Allowing null
    private double bmi;

    @Column(name = "user_medicalcondition", nullable = true, length = 100) // Allowing null
    private String medicalCondition;
    
    @Column(name = "user_goals", nullable = true) // Allowing null
    private String goal;

    @Column(name = "user_preferences", nullable = true, length = 100) // Allowing null
    private String dietaryPreferences;

    @Column(name = "user_profile_pic", nullable = true)
    private Blob profilePic;

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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContactno() {
		return contactno;
	}

	public void setContactno(String contactno) {
		this.contactno = contactno;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getActivityLevel() {
		return activityLevel;
	}

	public void setActivityLevel(String activityLevel) {
		this.activityLevel = activityLevel;
	}

	public double getBmi() {
		return bmi;
	}

	public void setBmi(double bmi) {
		this.bmi = bmi;
	}

	public String getMedicalCondition() {
		return medicalCondition;
	}

	public void setMedicalCondition(String medicalCondition) {
		this.medicalCondition = medicalCondition;
	}

	public String getGoal() {
		return goal;
	}

	public void setGoal(String goal) {
		this.goal = goal;
	}

	public String getDietaryPreferences() {
		return dietaryPreferences;
	}

	public void setDietaryPreferences(String dietaryPreferences) {
		this.dietaryPreferences = dietaryPreferences;
	}

	public Blob getProfilePic() {
		return profilePic;
	}

	public void setProfilePic(Blob profilePic) {
		this.profilePic = profilePic;
	}

	public void setPic(SerialBlob serialBlob) {
		// TODO Auto-generated method stub
		
	}

    

	
}
