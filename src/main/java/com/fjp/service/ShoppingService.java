package com.fjp.service;

import javax.servlet.http.HttpServletRequest;

public interface ShoppingService {
    void shoppingList(HttpServletRequest request, String condition, Integer page);
    void addRecord(HttpServletRequest request, Integer schoolCardId, Integer goodId, Integer shoppingCount);
    void getShoppingListByStudentNum(HttpServletRequest request, Integer page);
}
