package com.klef.jfsd.springboot.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.FoodTracking;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.service.UserService;
import com.klef.jfsd.springboot.service.UserServiceImpl;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class UserController {
    
    @Autowired
    private UserService userService;
    
    @Autowired
    UserServiceImpl usi;

    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("userhome");
        return mv;
   
    }

    @GetMapping("userreg")
    public ModelAndView userReg() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("userreg");
        return mv;
    }
    
   
    
    @GetMapping("userdashboard")
    public ModelAndView userdashboard() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("userdashboard");
        return mv;
    }
    
    @GetMapping("recipesearch")
    public ModelAndView rechipesearch() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("recipesearch");
        return mv;
    }
    @GetMapping("searchdietplan")
    public ModelAndView searchdietplan() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("searchdietplan");
        return mv;
    }

    @GetMapping("userhome")
    public ModelAndView userHome() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("userhome");
        return mv;
    }

    @GetMapping("userlogin")
    public ModelAndView userLogin() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("userlogin");
        return mv;
    }

    @PostMapping("checkuserlogin")
    public ModelAndView checkUserLogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String uemail = request.getParameter("uemail");
        String upwd = request.getParameter("upwd");

        User user = userService.checkUserLogin(uemail, upwd);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            mv.setViewName("userdashboard");
        } else {
            mv.setViewName("userlogin");
            if (upwd.length() < 8) {
                mv.addObject("message", "Password must be at least 8 characters.");
            } else if (!upwd.matches(".*[0-9].*")) {
                mv.addObject("message", "Password must contain at least one number.");
            } else {
                mv.addObject("message", "Login Failed! Invalid email or password.");
            }
        }
        return mv;
    }

   
        
    @GetMapping("userprofile")
    public ModelAndView userProfile() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("userprofile");
        return mv;
    }
    
    
    @GetMapping("userdietplan")
    public ModelAndView userdietplan() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("userdietplan");
        return mv;
    }
    @PostMapping("updateuserprofile")
    public ModelAndView updateUserProfile(HttpServletRequest request, @RequestParam("pic") MultipartFile picFile) {
        ModelAndView mv = new ModelAndView();
        try {
            // Extract user details from the request
            int id = Integer.parseInt(request.getParameter("uid"));
            String name = request.getParameter("uname");
            String gender = request.getParameter("ugender");
            String dob = request.getParameter("udob");
            String email = request.getParameter("uemail");
            String contact = request.getParameter("ucontact");
            double height = Double.parseDouble(request.getParameter("uheight"));
            double weight = Double.parseDouble(request.getParameter("uweight"));
            String activityLevel = request.getParameter("uactivity");
            String dietaryPreferences = request.getParameter("udietary");
            String medicalCondition = request.getParameter("umedicalCondition");
            double bmi = Double.parseDouble(request.getParameter("ubmi"));
            String goal = request.getParameter("goal");
           

            // Retrieve the user by ID
            User user = userService.displayUserByID(id);
            if (user == null) {
                throw new Exception("User not found");
            }

            // Update the user details
            user.setName(name);
            user.setGender(gender);
            user.setDateofbirth(dob);
            user.setEmail(email);
            user.setContactno(contact);
            user.setHeight(height);
            user.setWeight(weight);
            user.setActivityLevel(activityLevel);
            user.setDietaryPreferences(dietaryPreferences);
            user.setMedicalCondition(medicalCondition);
            user.setBmi(bmi);
            user.setGoal(goal);
            

            // Handle the profile picture update
			
			 if (!picFile.isEmpty()) { 
				 user.setPic(new javax.sql.rowset.serial.SerialBlob(picFile.getBytes())); 
			 }
			 

            // Save the updated user profile
            String msg = userService.updateUserProfile(user);
           
            User updatedUser = userService.displayUserByID(id);
            HttpSession session = request.getSession();
            session.setAttribute("user", updatedUser);
            
            mv.setViewName("userprofile");
            System.out.println("hi3");
            mv.addObject("message", msg);
        } catch (Exception e) {
        	System.out.println("hello");
            mv.setViewName("updateerror");
            mv.addObject("message", "Error updating profile: " + e.getMessage());
        }
        return mv;
    }

    @GetMapping("userlogout")
    public ModelAndView userLogout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("user"); 
        ModelAndView mv = new ModelAndView("userlogin");
        return mv;
    }
    

    @PostMapping("userdashboard")
    public ModelAndView userDashboard(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("userdashboard");

        // Retrieve user from the session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            mv.addObject("user", user);
        } else {
            mv.setViewName("userdashboard");
            mv.addObject("message", "Please log in to view your dashboard.");
        }

        return mv;
    }
    @GetMapping("usersessionexpiry")
	public ModelAndView usersessionexpiry(HttpServletRequest request) {

		ModelAndView mv= new ModelAndView();
		mv.setViewName("usersessionexpiry");
		return mv;
	}
    
    @PostMapping("insertuser")
    public ModelAndView insertuser(HttpServletRequest request) {
 	   String name=request.getParameter("uname");
 	   String gender=request.getParameter("ugender");
 	   String dob=request.getParameter("udob");
 	  String email= request.getParameter("uemail");
 	  String contact=request.getParameter("ucontact");
 	  String password=request.getParameter("upwd");
 	  
 	  User user=new User();
 	  user.setName(name);
 	  user.setGender(gender);
 	  user.setDateofbirth(dob);
 	  user.setEmail(email);
 	  user.setContactno(contact);
 	  user.setPassword(password);
 	  
 	  String message = userService.userRegistration(user);
 	  
 	  ModelAndView mv=new ModelAndView();
 	  mv.setViewName("regsuccess");
 	  mv.addObject("message", message);
 	  
 	  return mv;
    }
    @GetMapping("foodtracking")
	public ModelAndView foodtracking() {

		ModelAndView mv= new ModelAndView();
		mv.setViewName("foodtracking");
		return mv;
	}
    @GetMapping("thrive tracker")
	public ModelAndView thrivetracker() {

		ModelAndView mv= new ModelAndView();
		mv.setViewName("thrive tracker");
		return mv;
	}
    
    @PostMapping("logout")
    public ModelAndView logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("userlogin");
        return mv;
    }

		
	
    @PostMapping("/addFoodTracking")
    public ModelAndView addFoodTracking(HttpServletRequest request, HttpSession session) {

       
        User user = (User) session.getAttribute("user");
        System.out.println(user.getId());
        String breakfast=request.getParameter("breakfast");
        String lunch=request.getParameter("lunch");
        String snacks=request.getParameter("snacks");
        String dinner=request.getParameter("dinner");
        int waterIntake = Integer.parseInt(request.getParameter("waterIntake"));
        
        
        FoodTracking foodTracking = new FoodTracking();
        foodTracking.setUserId((long)user.getId());
        foodTracking.setBreakfast(breakfast);
        foodTracking.setLunch(lunch);
        foodTracking.setSnacks(snacks);
        foodTracking.setDinner(dinner);
        foodTracking.setWaterIntake(waterIntake);
        foodTracking.setCreatedAt(LocalDateTime.now());

     
        userService.saveFoodTracking(foodTracking);

      
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/viewFoodTracking?id="+user.getId());
        return mv;
    }
   
    
    @GetMapping("/viewFoodTracking")
    public ModelAndView viewFoodTracking(@RequestParam("id") int id) {
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("viewFoodTracking");
    	mv.addObject("trackinglist", userService.getFoodTrackingByUserId((long)id));
    	return mv;
    }
    @GetMapping("/delete/{id}")
    public String deleteFoodTracking(@PathVariable("id") Long id) {
        System.out.println("Deleting food tracking record with ID: " + id);
        userService.deletefood(id); 
        System.out.println("Deletion request processed successfully.");
        return "redirect:/viewFoodTracking"; 
    }



}
