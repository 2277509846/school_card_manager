package com.fjp.service;

import com.alipay.api.AlipayApiException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface RechargeSchoolCardService {
    void rechargeSchoolCardList(HttpServletRequest request, String condition, Integer page);
    void getRechargeSchoolCardsByStudentNum(HttpServletRequest request, Integer page);
    void recharge(HttpServletRequest request, HttpServletResponse response, String password, Double rechargeMoney) throws AlipayApiException, Exception;
    void recharge2(HttpServletRequest request);
}
