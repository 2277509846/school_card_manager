package com.fjp.entity;

public class Dormitory {
    private String num;
    private Double water;
    private Double electricity;

    public Dormitory(String num, Double water, Double electricity) {
        this.num = num;
        this.water = water;
        this.electricity = electricity;
    }

    public Dormitory() {
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public Double getWater() {
        return water;
    }

    public void setWater(Double water) {
        this.water = water;
    }

    public Double getElectricity() {
        return electricity;
    }

    public void setElectricity(Double electricity) {
        this.electricity = electricity;
    }
}
