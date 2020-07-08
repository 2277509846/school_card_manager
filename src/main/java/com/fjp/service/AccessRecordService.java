package com.fjp.service;

import com.fjp.entity.AccessRecord;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface AccessRecordService {
    void accessRecordList(HttpServletRequest request, String condition, Integer page);
    void getAccessRecordsByStudentNum(HttpServletRequest request, Integer page);
}
