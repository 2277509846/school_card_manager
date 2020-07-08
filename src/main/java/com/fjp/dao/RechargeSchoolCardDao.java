package com.fjp.dao;

import com.fjp.entity.RechargeSchoolCard;

import java.util.List;
import java.util.Map;

public interface RechargeSchoolCardDao {
    List<RechargeSchoolCard> rechargeSchoolCardList(String condition);
    List<RechargeSchoolCard> getRechargeSchoolCardsByStudentNum(String studentNum);
    Integer recharge(Map<String, Object> params);
}
