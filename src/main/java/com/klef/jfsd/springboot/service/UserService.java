package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.mail.SimpleMailMessage;

import com.klef.jfsd.springboot.model.FoodTracking;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.repository.FoodTrackingRepository;


public interface UserService {
    
   
    public String userRegistration(User user);
    public User checkUserLogin(String email, String password);
    public String updateUserProfile(User user);
    public User displayUserByID(int userId);
    public boolean isValidUser(String email, String password);  // for internal validation
    public String updateUserPassword(int userId, String oldPassword, String newPassword);
    
    FoodTracking saveFoodTracking(FoodTracking foodTracking);
    List<FoodTracking> getFoodTrackingByUserId(Long userId);
    public String deletefood(long id);
	String sendEmail(String toemail, String subject, String message);
    
   
	
    
}