package com.fjp.service;

import javax.servlet.http.HttpServletRequest;

public interface RechargeWaterElectricityService {
    void getRechargeWaterElectricityByStudentNum(HttpServletRequest request, Integer page);
    void recharge(HttpServletRequest request, String dormitoryNum, String type, Double rechargeMoney, String password);
}
