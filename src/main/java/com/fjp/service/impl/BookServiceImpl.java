package com.fjp.service.impl;

import com.fjp.dao.BookDao;
import com.fjp.entity.Book;
import com.fjp.service.BookService;
import com.fjp.util.GetPageUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("BookService")
public class BookServiceImpl implements BookService {
    @Resource
    private BookDao bookDao;
    @Override
    public void bookList(HttpServletRequest request, String condition, Integer page) {
        if (condition == null) condition = "";
        List<Book> books = bookDao.bookList("%" + condition + "%");
        Map<String, Object> map = GetPageUtil.getPage(books, page, 13);
        request.setAttribute("books", map.get("list"));
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("condition", condition);
        request.setAttribute("count", map.get("count"));
    }

    @Override
    public void add(HttpServletRequest request, String name, String author, String publish) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("name", name);
        params.put("author", author);
        params.put("publish", publish);
        if (isValidate(request, name, author, publish)) {
            bookDao.add(params);
            request.setAttribute("message", "添加成功");
        }
    }

    private boolean isValidate(HttpServletRequest request, String name, String author, String publish) {
        if (name.equals("")) {
            request.setAttribute("message", "书名不能为空");
            return false;
        }
        if (author.equals("")) {
            request.setAttribute("message", "作者名不能为空");
            return false;
        }
        if (publish.equals("")) {
            request.setAttribute("message", "出版社不能为空");
            return false;
        }
        if (name.length() > 20) {
            request.setAttribute("message", "书名长度不能超过20");
            return false;
        } else if (author.length() > 10) {
            request.setAttribute("message", "作者名长度不能超过10");
            return false;
        } else if (publish.length() > 10) {
            request.setAttribute("message", "出版社长度不能超过10");
            return false;
        }
        return true;
    }

    @Override
    public void addLot(HttpServletRequest request) {
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> fileItems = upload.parseRequest(request);
            for (FileItem fileItem : fileItems) {
                if (!fileItem.isFormField()) {
                    String fileName = fileItem.getName();
                    File file = new File("E:\\" + fileName);
                    if (!file.exists()) file.createNewFile();
                    fileItem.write(file);
                    Workbook workbook = WorkbookFactory.create(file);
                    Sheet sheet = workbook.getSheetAt(0);
                    int rowNumbers = sheet.getLastRowNum() + 1;
                    Row temp = sheet.getRow(0);
                    if (temp != null) {
                        int row;
                        String name = "";
                        String author = "";
                        String publish = "";
                        for (row = 1; row < rowNumbers; row++) {
                            name = "";
                            author = "";
                            publish = "";
                            Row r = sheet.getRow(row);
                            try {
                                name = r.getCell(0).toString();
                                author = r.getCell(1).toString();
                                publish = r.getCell(2).toString();
                            } catch (Exception ignored) {
                            }
                            if (!isValidate(request, name, author, publish)) break;
                        }
                        if (row < rowNumbers) {
                            String error = (String) request.getAttribute("message");
                            request.setAttribute("message", "第" + (row + 1) + "行" + error);
                            return;
                        }
                        for (row = 1; row < rowNumbers; row++) {
                            Row r = sheet.getRow(row);
                            name = r.getCell(0).toString();
                            author = r.getCell(1).toString();
                            publish = r.getCell(2).toString();
                            add(request, name, author, publish);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(HttpServletRequest request, Integer bookId) {
        bookDao.delete(bookId);
        request.setAttribute("message", "注销成功");
    }

    @Override
    public void update(HttpServletRequest request, Integer bookId, String name, String author, String publish) {
        if (name == null) {
            Book book = bookDao.getBookById(bookId);
            name = book.getName();
            author = book.getAuthor();
            publish = book.getPublish();
            request.setAttribute("name", name);
            request.setAttribute("author", author);
            request.setAttribute("publish", publish);
            request.setAttribute("bookId", bookId);
            return;
        }
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("name", name);
        params.put("author", author);
        params.put("publish", publish);
        params.put("id", bookId);
        if (name.length() > 20) {
            request.setAttribute("message", "书名长度不能超过20");
        } else if (author.length() > 10) {
            request.setAttribute("message", "作者名长度不能超过10");
        } else if (publish.length() > 10) {
            request.setAttribute("message", "出版社长度不能超过10");
        } else {
            bookDao.update(params);
            request.setAttribute("message", "修改成功");
        }
    }
}
