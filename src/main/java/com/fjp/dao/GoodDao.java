package com.fjp.dao;

import com.fjp.entity.Good;

import java.util.List;
import java.util.Map;

public interface GoodDao {
    List<Good> goodList(String condition);
    Good getGoodById(Integer id);
    Integer add(Map<String, Object> params);
    Integer delete(Integer id);
    Integer update(Map<String, Object> params);
}
