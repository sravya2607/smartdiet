package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "food_tracking")
public class FoodTracking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_id", nullable = false)
    private Long userId;

    private String breakfast;
    private String lunch;
    private String snacks;
    private String dinner;

    @Column(name = "water_intake", nullable = false)
    private int waterIntake; // in milliliters

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getBreakfast() {
        return breakfast;
    }

    public void setBreakfast(String breakfast) {
        this.breakfast = breakfast;
    }

    public String getLunch() {
        return lunch;
    }

    public void setLunch(String lunch) {
        this.lunch = lunch;
    }

    public String getSnacks() {
        return snacks;
    }

    public void setSnacks(String snacks) {
        this.snacks = snacks;
    }

    public String getDinner() {
        return dinner;
    }

    public void setDinner(String dinner) {
        this.dinner = dinner;
    }

    public int getWaterIntake() {
        return waterIntake;
    }

    public void setWaterIntake(int waterIntake) {
        this.waterIntake = waterIntake;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
