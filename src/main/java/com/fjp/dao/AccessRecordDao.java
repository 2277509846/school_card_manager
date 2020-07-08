package com.fjp.dao;

import com.fjp.entity.AccessRecord;

import java.util.List;

public interface AccessRecordDao {
    List<AccessRecord> accessRecordList(String condition);
    List<AccessRecord> getAccessRecordsByStudentNum(String studentNum);
}
