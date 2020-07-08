package com.fjp.entity;

import java.util.Date;

public class SchoolCard {
    private int id;
    private Double balance;
    private String password;
    private String bankCardNum;
    private Date startTime;
    private String status;

    public SchoolCard() {
    }

    public SchoolCard(int id, Double balance, String password, String bankCardNum, Date startTime, String status) {
        this.id = id;
        this.balance = balance;
        this.password = password;
        this.bankCardNum = bankCardNum;
        this.startTime = startTime;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBankCardNum() {
        return bankCardNum;
    }

    public void setBankCardNum(String bankCardNum) {
        this.bankCardNum = bankCardNum;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
