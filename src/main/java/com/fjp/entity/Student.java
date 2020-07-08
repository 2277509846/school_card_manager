package com.fjp.entity;

public class Student {
    private String num;
    private String name;
    private Integer schoolCardId;
    private String phoneNumber;
    private String dormitoryNum;
    private String department;

    public Student() {
    }

    public Student(String num, String name, Integer schoolCardId, String phoneNumber, String dormitoryNum, String department) {
        this.num = num;
        this.name = name;
        this.schoolCardId = schoolCardId;
        this.phoneNumber = phoneNumber;
        this.dormitoryNum = dormitoryNum;
        this.department = department;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSchoolCardId() {
        return schoolCardId;
    }

    public void setSchoolCardId(Integer schoolCardId) {
        this.schoolCardId = schoolCardId;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getDormitoryNum() {
        return dormitoryNum;
    }

    public void setDormitoryNum(String dormitoryNum) {
        this.dormitoryNum = dormitoryNum;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}
