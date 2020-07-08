package com.fjp.service;

import javax.servlet.http.HttpServletRequest;

public interface BookService {
    void bookList(HttpServletRequest request, String condition, Integer page);
    void add(HttpServletRequest request, String name, String author, String publish);
    void addLot(HttpServletRequest request);
    void delete(HttpServletRequest request, Integer bookId);
    void update(HttpServletRequest request, Integer bookId, String name, String author, String publish);
}
