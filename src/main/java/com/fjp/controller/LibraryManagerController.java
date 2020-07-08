package com.fjp.controller;

import com.fjp.service.BookService;
import com.fjp.service.LendBookRecordService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/LibraryManagerController")
public class LibraryManagerController {
    @Resource
    private BookService bookService;
    @Resource
    private LendBookRecordService lendBookRecordService;
    @RequestMapping("/bookList")
    public String bookList(HttpServletRequest request, String condition, Integer page) {
        bookService.bookList(request, condition, page);
        return "libraryManager/bookList";
    }

    @RequestMapping("/lendBookRecordList")
    public String lendBookRecordList(HttpServletRequest request, String condition, Integer page) {
        lendBookRecordService.lendBookRecordList(request, condition, page);
        return "libraryManager/lendBookRecord";
    }

    @RequestMapping("/lendBook")
    public String lendBook(HttpServletRequest request, Integer schoolCardId, Integer bookId) {
        lendBookRecordService.lendBook(request, schoolCardId, bookId);
        return "libraryManager/lendBook";
    }

    @RequestMapping("/giveBackBook")
    public String giveBackBook(HttpServletRequest request, Integer bookId) {
        lendBookRecordService.giveBack(request, bookId);
        return "libraryManager/giveBackBook";
    }

    @RequestMapping("/addBook")
    public String addBook(HttpServletRequest request, String name, String author, String publish) {
        bookService.add(request, name, author, publish);
        return "libraryManager/addBook";
    }

    @RequestMapping("/addLotOfBook")
    public String addLotOfBook(HttpServletRequest request) {
        bookService.addLot(request);
        return "libraryManager/addBook";
    }

    @RequestMapping("/deleteBook")
    public String deleteBook(HttpServletRequest request, Integer bookId) {
        bookService.delete(request, bookId);
        return bookList(request, "", 1);
    }

    @RequestMapping("/updateBook")
    public String updateBook(HttpServletRequest request, Integer bookId, String name, String author, String publish) {
        bookService.update(request, bookId, name, author, publish);
        if (name == null) return "libraryManager/updateBook";
        return bookList(request, "", 1);
    }
}
