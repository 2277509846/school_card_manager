package com.fjp.entity;

import java.util.Date;

public class Shopping {
    private String studentNum;
    private Integer goodId;
    private Date shoppingTime;
    private Double shoppingMoney;
    private Integer shoppingCount;
    private String goodName;

    public Shopping() {
    }

    public Shopping(String studentNum, Integer goodId, Date shoppingTime, Double shoppingMoney, Integer shoppingCount) {
        this.studentNum = studentNum;
        this.goodId = goodId;
        this.shoppingTime = shoppingTime;
        this.shoppingMoney = shoppingMoney;
        this.shoppingCount = shoppingCount;
    }

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Date getShoppingTime() {
        return shoppingTime;
    }

    public void setShoppingTime(Date shoppingTime) {
        this.shoppingTime = shoppingTime;
    }

    public Double getShoppingMoney() {
        return shoppingMoney;
    }

    public void setShoppingMoney(Double shoppingMoney) {
        this.shoppingMoney = shoppingMoney;
    }

    public Integer getShoppingCount() {
        return shoppingCount;
    }

    public void setShoppingCount(Integer shoppingCount) {
        this.shoppingCount = shoppingCount;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }
}
