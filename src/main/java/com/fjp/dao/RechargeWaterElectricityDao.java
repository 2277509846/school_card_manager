package com.fjp.dao;

import com.fjp.entity.RechargeWaterElectricity;

import java.util.List;
import java.util.Map;

public interface RechargeWaterElectricityDao {
    List<RechargeWaterElectricity> getRechargeWaterElectricityByStudentNum(String studentNum);
    Integer recharge(Map<String, Object> params);
}
