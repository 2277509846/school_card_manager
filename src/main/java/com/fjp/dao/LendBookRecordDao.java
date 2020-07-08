package com.fjp.dao;

import com.fjp.entity.LendBookRecord;

import java.util.List;
import java.util.Map;

public interface LendBookRecordDao {
    List<LendBookRecord> lendBookRecordList(String condition);
    Integer lendBook(Map<String, Object> record);
    Integer giveBack(Integer id);
    List<LendBookRecord> getLendBookRecordsByStudentNum(String studentNum);
}
