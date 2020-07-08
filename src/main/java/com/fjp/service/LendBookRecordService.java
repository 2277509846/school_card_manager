package com.fjp.service;

import javax.servlet.http.HttpServletRequest;

public interface LendBookRecordService {
    void lendBookRecordList(HttpServletRequest request, String condition, Integer page);
    void lendBook(HttpServletRequest request, Integer schoolCardId, Integer bookId);
    void giveBack(HttpServletRequest request, Integer bookId);
    void getLendBookRecordsByStudentNum(HttpServletRequest request, Integer page);
}
