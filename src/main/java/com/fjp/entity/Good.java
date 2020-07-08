package com.fjp.entity;

public class Good {
    private Integer id;
    private String name;
    private Double price;
    private String businessName;
    private Integer isDelete;

    public Good() {
    }

    public Good(Integer id, String name, Double price, String businessName, Integer isDelete) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.businessName = businessName;
        this.isDelete = isDelete;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}
