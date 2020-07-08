package com.fjp.dao;

import com.fjp.entity.Shopping;

import java.util.List;
import java.util.Map;

public interface ShoppingDao {
    List<Shopping> shoppingList(String condition);
    Integer addRecord(Map<String, Object> record);
    List<Shopping> getShoppingListByStudentNum(String studentNum);
}
