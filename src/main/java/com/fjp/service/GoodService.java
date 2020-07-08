package com.fjp.service;

import javax.servlet.http.HttpServletRequest;

public interface GoodService {
    void goodList(HttpServletRequest request, String condition, Integer page);

    void add(HttpServletRequest request, String name, String price, String businessName);

    void addLot(HttpServletRequest request);

    void delete(HttpServletRequest request, Integer goodId);

    void update(HttpServletRequest request, Integer goodId, String name, String price, String businessName);
}
