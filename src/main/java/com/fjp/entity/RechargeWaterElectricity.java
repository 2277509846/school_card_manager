package com.fjp.entity;

import java.util.Date;

public class RechargeWaterElectricity {
    private String studentNum;
    private String dormitoryNum;
    private Date rechargeTime;
    private Double rechargeMoney;
    private String type;

    public RechargeWaterElectricity() {
    }

    public RechargeWaterElectricity(String studentNum, String dormitoryNum, Date rechargeTime, Double rechargeMoney, String type) {
        this.studentNum = studentNum;
        this.dormitoryNum = dormitoryNum;
        this.rechargeTime = rechargeTime;
        this.rechargeMoney = rechargeMoney;
        this.type = type;
    }

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum;
    }

    public String getDormitoryNum() {
        return dormitoryNum;
    }

    public void setDormitoryNum(String dormitoryNum) {
        this.dormitoryNum = dormitoryNum;
    }

    public Date getRechargeTime() {
        return rechargeTime;
    }

    public void setRechargeTime(Date rechargeTime) {
        this.rechargeTime = rechargeTime;
    }

    public Double getRechargeMoney() {
        return rechargeMoney;
    }

    public void setRechargeMoney(Double rechargeMoney) {
        this.rechargeMoney = rechargeMoney;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
