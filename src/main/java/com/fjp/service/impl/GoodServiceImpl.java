package com.fjp.service.impl;

import com.fjp.dao.GoodDao;
import com.fjp.entity.Book;
import com.fjp.entity.Good;
import com.fjp.service.GoodService;
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

@Service("GoodService")
public class GoodServiceImpl implements GoodService {
    @Resource
    private GoodDao goodDao;
    @Override
    public void goodList(HttpServletRequest request, String condition, Integer page) {
        if (condition == null) condition = "";
        List<Good> goods = goodDao.goodList("%" +condition + "%");
        Map<String, Object> pages = GetPageUtil.getPage(goods, page, 13);
        request.setAttribute("goods", pages.get("list"));
        request.setAttribute("page", pages.get("currentPage"));
        request.setAttribute("condition", condition);
        request.setAttribute("count", pages.get("count"));
    }

    @Override
    public void add(HttpServletRequest request, String name, String price, String businessName) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("businessName", businessName);
        params.put("name", name);
        params.put("price", price);
        if (isValidate(request, name, price, businessName)) {
            goodDao.add(params);
            request.setAttribute("message", "添加成功");
        }
    }

    private boolean isValidate(HttpServletRequest request, String name, String price, String businessName) {
        if (name.equals("")) {
            request.setAttribute("message", "名称不能为空");
            return false;
        }
        if (price.equals("")) {
            request.setAttribute("message", "价格不能为空");
            return false;
        }
        if (businessName.equals("")) {
            request.setAttribute("message", "商家名称不能为空");
            return false;
        }
        try {
            Double price2 = Double.parseDouble(price);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "输入的价格必须是数字");
            return false;
        }
        if (name.length() > 20) {
            request.setAttribute("message", "商品名长度不能超过20");
            return false;
        } else if (businessName.length() > 25) {
            request.setAttribute("message", "商家名长度不能超过25");
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
                        String price = "";
                        String businessName = "";
                        for (row = 1; row < rowNumbers; row++) {
                            name = "";
                            price = "";
                            businessName = "";
                            Row r = sheet.getRow(row);
                            try {
                                name = r.getCell(0).toString();
                                price = r.getCell(1).toString();
                                businessName = r.getCell(2).toString();
                            } catch (Exception ignored) {
                            }
                            if (!isValidate(request, name, price, businessName)) break;
                            System.out.println(name);
                        }
                        if (row < rowNumbers) {
                            String error = (String) request.getAttribute("message");
                            request.setAttribute("message", "第" + (row + 1) + "行" + error);
                            return;
                        }
                        for (row = 1; row < rowNumbers; row++) {
                            Row r = sheet.getRow(row);
                            name = r.getCell(0).toString();
                            price = r.getCell(1).toString();
                            businessName = r.getCell(2).toString();
                            add(request, name, price, businessName);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(HttpServletRequest request, Integer goodId) {
        goodDao.delete(goodId);
        request.setAttribute("message", "删除成功");
    }

    @Override
    public void update(HttpServletRequest request, Integer goodId, String name, String price, String businessName) {
        if (name == null) {
            Good good = goodDao.getGoodById(goodId);
            name = good.getName();
            price = good.getPrice().toString();
            businessName = good.getBusinessName();
            request.setAttribute("name", name);
            request.setAttribute("price", price);
            request.setAttribute("businessName", businessName);
            request.setAttribute("goodId", goodId);
            return;
        }
        Map<String, Object> params = new HashMap<String, Object>();
        try {
            Double price2 = Double.parseDouble(price);
        } catch (NumberFormatException e) {
            request.setAttribute("message", "输入的价格必须是数字");
            return;
        }
        params.put("id", goodId);
        params.put("businessName", businessName);
        params.put("name", name);
        params.put("price", price);
        if (name.length() > 20) {
            request.setAttribute("message", "商品名长度不能超过20");
        } else if (businessName.length() > 25) {
            request.setAttribute("message", "商家名长度不能超过25");
        } else {
            goodDao.update(params);
            request.setAttribute("message", "修改成功");
        }
    }
}
