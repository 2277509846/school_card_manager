package com.fjp.dao;

import com.fjp.entity.Dormitory;

import java.util.List;

public interface DormitoryDao {
    List<Dormitory> dormitoryList();
    Dormitory getDormitoryByStudentNum(String studentNum);
}
