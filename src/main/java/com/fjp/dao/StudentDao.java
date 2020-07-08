package com.fjp.dao;

import com.fjp.entity.Student;

import java.util.List;
import java.util.Map;

public interface StudentDao {
    List<Student> getStudentList(String condition);
    Student getStudentBySchoolCard(Integer schoolCardId);
    Student getStudentByNum(String num);
    Integer remake(Map<String, Object> params);
    Integer addStudent(Map<String, Object> params);
    Integer deleteStudent(String num);
}
