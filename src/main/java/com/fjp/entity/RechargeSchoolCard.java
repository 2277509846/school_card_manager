package com.fjp.entity;

import java.util.Date;

public class RechargeSchoolCard {
    private String studentNum;
    private Date rechargeTime;
    private Double rechargeMoney;

    public RechargeSchoolCard() {
    }

    public RechargeSchoolCard(String studentNum, Date rechargeTime, Double rechargeMoney) {
        this.studentNum = studentNum;
        this.rechargeTime = rechargeTime;
        this.rechargeMoney = rechargeMoney;
    }

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum;
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
}
