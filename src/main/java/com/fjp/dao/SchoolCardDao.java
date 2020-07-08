package com.fjp.dao;

import com.fjp.entity.SchoolCard;

import java.util.List;
import java.util.Map;

public interface SchoolCardDao {
    List<SchoolCard> schoolCardList();
    SchoolCard getSchoolCardById(Integer id);
    Integer reportTheLoss(Integer id);
    Integer resetPassword(Map<String, Object> params);
    Integer findTheSchoolCard(Integer id);
}
