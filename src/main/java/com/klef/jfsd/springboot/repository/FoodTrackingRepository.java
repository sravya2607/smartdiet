package com.klef.jfsd.springboot.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.FoodTracking;

import jakarta.transaction.Transactional;

@Repository
public interface FoodTrackingRepository extends JpaRepository<FoodTracking, Long> {
    List<FoodTracking> findByUserId(Long userId);
    
    @Modifying
    @Transactional
    @Query("DELETE FROM FoodTracking f WHERE f.id = :id")
    int deleteFood(@Param("id") Long id); 
}

