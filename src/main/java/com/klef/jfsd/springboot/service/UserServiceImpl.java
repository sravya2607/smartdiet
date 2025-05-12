package com.klef.jfsd.springboot.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.FoodTracking;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.repository.FoodTrackingRepository;
import com.klef.jfsd.springboot.repository.userRepository;

import jakarta.transaction.Transactional;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	 private JavaMailSender mailSender;
	
    @Autowired
    private userRepository userRepository;
    @Autowired
    private FoodTrackingRepository foodTrackingRepository;

    @Override
    public User checkUserLogin(String email, String password) {
        User user = userRepository.checkUserLogin(email, password);
        if (user == null) {
            System.out.println("Login failed: User not found for given credentials.");
        }
        return user;
    }
    

    @Override
    public String userRegistration(User user) {
        String password = user.getPassword();
        if (password == null || password.isEmpty()) {
            throw new IllegalArgumentException("Password cannot be empty.");
        }

        if (!password.matches("^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d).{8,}$")) {
            throw new IllegalArgumentException(
                "Password must be at least 8 characters long, contain one uppercase letter, one lowercase letter, and one number."
            );
        }

        if (user.getContactno() == null || user.getContactno().isEmpty()) {
            throw new IllegalArgumentException("Contact cannot be null.");
        }

        userRepository.save(user);
     // Sending a welcome email
        String subject = "Welcome to FitPlate!";
        String message = "Hi " + user.getName() + ",\n\n" +
                "Thank you for signing up with FitPlate! We're excited to have you onboard.\n\n" +
                "Best regards,\nThe FitPlate Team";
        try {
			String emailResponse = null;
			try {
				emailResponse = sendEmail(user.getEmail(), subject, message);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println(emailResponse);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        return "User Registered Successfully";
    }


    @Override
    public String updateUserProfile(User user) {
        User existingUser = userRepository.findById(user.getId()).orElse(null);

        if (existingUser != null) {
            existingUser.setContactno(user.getContactno());
            existingUser.setDateofbirth(user.getDateofbirth());
            existingUser.setGender(user.getGender());
            existingUser.setName(user.getName());
            existingUser.setPassword(user.getPassword());
            existingUser.setEmail(user.getEmail());

            userRepository.save(existingUser);
            return "User Profile Updated Successfully";
        }
        return "User Not Found";
    }

    @Override
    public User displayUserByID(int userId) {
        return userRepository.findById(userId).orElse(null);
    }

    @Override
    public boolean isValidUser(String email, String password) {
        return checkUserLogin(email, password) != null;
    }

    @Override
    public String updateUserPassword(int userId, String oldPassword, String newPassword) {
        User user = userRepository.findById(userId).orElse(null);
        if (user != null && user.getPassword().equals(oldPassword)) {
            user.setPassword(newPassword);
            userRepository.save(user);
            return "Password Updated Successfully";
        }
        return "Old password is incorrect or user not found";
    }

    @Override
    public FoodTracking saveFoodTracking(FoodTracking foodTracking) {
        foodTracking.setCreatedAt(LocalDateTime.now()); 
        return foodTrackingRepository.save(foodTracking);
    }
    
    @Override
    public List<FoodTracking> getFoodTrackingByUserId(Long userId) {
        return foodTrackingRepository.findByUserId(userId);
    }
  

    
    	@Override
    	public String sendEmail(String toemail, String subject, String message) {
    		try {
    			SimpleMailMessage mailMessage = new SimpleMailMessage();
    			mailMessage.setFrom("2200030151cseh@gmail.com");
    			mailMessage.setTo(toemail);
    			mailMessage.setSubject(subject);
    			mailMessage.setText(message);
    			
    			mailSender.send(mailMessage);
    			return ("sucessfully sent email");
    			
    		}
    		catch(Exception e) {
    			return ("failed, try again!!!.... ");
    		}
    	}


    	@Override
    	@Transactional
    	public String deletefood(long id) {
    		foodTrackingRepository.deleteById(id);
    		return "Foodtracking was deleted successfully";
    	}
    	
    }




	


