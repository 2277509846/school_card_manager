package com.fjp.service.impl;

import com.fjp.dao.GoodDao;
import com.fjp.dao.SchoolCardDao;
import com.fjp.dao.ShoppingDao;
import com.fjp.dao.StudentDao;
import com.fjp.entity.Good;
import com.fjp.entity.SchoolCard;
import com.fjp.entity.Shopping;
import com.fjp.entity.Student;
import com.fjp.service.ShoppingService;
import com.fjp.util.GetPageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("ShoppingService")
public class ShoppingServiceImpl implements ShoppingService {
    @Resource
    private ShoppingDao shoppingDao;
    @Resource
    private GoodDao goodDao;
    @Resource
    private SchoolCardDao schoolCardDao;
    @Resource
    private StudentDao studentDao;
    @Override
    public void shoppingList(HttpServletRequest request, String condition, Integer page) {
        if (condition == null) condition = "";
        List<Shopping> shoppingList = shoppingDao.shoppingList("%" + condition + "%");
        for (Shopping shopping : shoppingList) {
            shopping.setGoodName(goodDao.getGoodById(shopping.getGoodId()).getName());
        }
        Map<String, Object> map = GetPageUtil.getPage(shoppingList, page, 13);
        request.setAttribute("shoppingList", map.get("list"));
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("condition", condition);
        request.setAttribute("count", map.get("count"));
    }

    @Override
    public void addRecord(HttpServletRequest request, Integer schoolCardId, Integer goodId, Integer shoppingCount) {
        Good good = goodDao.getGoodById(goodId);
        Map<String, Object> record = new HashMap<String, Object>();
        SchoolCard schoolCard = schoolCardDao.getSchoolCardById(schoolCardId);
        Student student = studentDao.getStudentBySchoolCard(schoolCardId);
        if (good == null) {
            request.setAttribute("message", "商品不存在！");
        } else if (good.getIsDelete() == 1) {
            request.setAttribute("message", "该商品已被删除！");
        } else if (student == null) {
            request.setAttribute("message", "学生不存在！");
        } else if (schoolCard == null) {
            request.setAttribute("message", "校园卡号不存在！");
        } else if (schoolCard.getBalance() < good.getPrice() * shoppingCount) {
            request.setAttribute("message", "余额不足！");
        } else if (schoolCard.getStatus().equals("挂失")){
            request.setAttribute("message", "该校园卡已挂失！");
        } else {
            record.put("studentNum", student.getNum());
            record.put("goodId", good.getId());
            record.put("shoppingTime", new Date());
            record.put("shoppingCount", shoppingCount);
            shoppingDao.addRecord(record);
            request.setAttribute("message", "消费成功！");
        }
    }

    @Override
    public void getShoppingListByStudentNum(HttpServletRequest request, Integer page) {
        String username = (String) request.getSession().getServletContext().getAttribute("username");
        List<Shopping> shoppingList = shoppingDao.getShoppingListByStudentNum(username);
        for (Shopping shopping : shoppingList) {
            shopping.setGoodName(goodDao.getGoodById(shopping.getGoodId()).getName());
        }
        Map<String, Object> map = GetPageUtil.getPage(shoppingList, page, 13);
        request.setAttribute("shoppingList", map.get("list"));
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("count", map.get("count"));
    }
}
