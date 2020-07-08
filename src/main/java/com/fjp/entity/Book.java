package com.fjp.entity;

public class Book {
    private Integer id;
    private String name;
    private String author;
    private String publish;
    private Integer lendCount;
    private Integer isDelete;

    public Book(Integer id, String name, String author, String publish, Integer lendCount, Integer isDelete) {
        this.id = id;
        this.name = name;
        this.author = author;
        this.publish = publish;
        this.lendCount = lendCount;
        this.isDelete = isDelete;
    }

    public Book() {
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublish() {
        return publish;
    }

    public void setPublish(String publish) {
        this.publish = publish;
    }

    public Integer getLendCount() {
        return lendCount;
    }

    public void setLendCount(Integer lendCount) {
        this.lendCount = lendCount;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}
