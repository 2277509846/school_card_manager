package com.fjp.dao;

import com.fjp.entity.Book;

import java.util.List;
import java.util.Map;

public interface BookDao {
    List<Book> bookList(String condition);
    Book getBookById(Integer id);
    Integer add(Map<String, Object> params);
    Integer delete(Integer id);
    Integer update(Map<String, Object> params);
}
