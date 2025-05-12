package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.klef.jfsd.springboot.model.User;

@Repository
public interface userRepository extends JpaRepository<User, Integer> {

    
    @Query("SELECT u FROM User u WHERE u.email = ?1 AND u.password = ?2")
    User checkUserLogin(String email, String password);
                      
    
}