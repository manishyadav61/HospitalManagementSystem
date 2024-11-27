package com.entity;

public class Specialist {
    private int id;
    private String specialistName;

    // Default constructor
    public Specialist() {}

    // Parameterized constructor
    public Specialist(int id, String specialistName) {
        this.id = id;
        this.specialistName = specialistName;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSpecialistName() {
        return specialistName;
    }

    public void setSpecialistName(String specialistName) {
        this.specialistName = specialistName;
    }
}
