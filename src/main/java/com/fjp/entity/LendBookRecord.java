package com.fjp.entity;

import java.util.Date;

public class LendBookRecord {
    private String studentNum;
    private Integer bookId;
    private Date lendTime;
    private Date backTime;
    private String bookName;

    public LendBookRecord(String studentNum, Integer bookId, Date lendTime, Date backTime) {
        this.studentNum = studentNum;
        this.bookId = bookId;
        this.lendTime = lendTime;
        this.backTime = backTime;
    }

    public LendBookRecord() {
    }

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Date getLendTime() {
        return lendTime;
    }

    public void setLendTime(Date lendTime) {
        this.lendTime = lendTime;
    }

    public Date getBackTime() {
        return backTime;
    }

    public void setBackTime(Date backTime) {
        this.backTime = backTime;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }
}
