package com.fjp.entity;

import java.util.Date;

public class AccessRecord {
    private String studentNum;
    private Date accessTime;
    private String status;

    public AccessRecord() {
    }

    public AccessRecord(String studentNum, Date accessTime, String status) {
        this.studentNum = studentNum;
        this.accessTime = accessTime;
        this.status = status;
    }

    public String getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(String studentNum) {
        this.studentNum = studentNum;
    }

    public Date getAccessTime() {
        return accessTime;
    }

    public void setAccessTime(Date accessTime) {
        this.accessTime = accessTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
