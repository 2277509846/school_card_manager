package com.fjp.service;

import com.fjp.entity.Student;

import javax.servlet.http.HttpServletRequest;

public interface StudentService {
    void getStudentList(HttpServletRequest request, String condition, Integer page);
    void remake(HttpServletRequest request, String studentNum, String password);
    void addStudent(HttpServletRequest request, String studentNum, String password, String studentName, String phoneNumber, String dormitoryNum, String department);
    void addLotOfStudent(HttpServletRequest request);
    void deleteStudent(HttpServletRequest request, String studentNum, String password);
}
