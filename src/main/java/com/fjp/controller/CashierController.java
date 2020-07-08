package com.fjp.controller;

import com.fjp.service.GoodService;
import com.fjp.service.ShoppingService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/CashierController")
public class CashierController {
    @Resource
    private GoodService goodService;
    @Resource
    private ShoppingService shoppingService;
    @RequestMapping("/goodList")
    public String goodList(HttpServletRequest request, String condition, Integer page) {
        goodService.goodList(request, condition, page);
        return "cashier/goodList";
    }
    @RequestMapping("/shopping")
    public String shopping(HttpServletRequest request, Integer schoolCardId, Integer goodId, Integer shoppingCount) {
        shoppingService.addRecord(request, schoolCardId, goodId, shoppingCount);
        return "cashier/shopping";
    }

    @RequestMapping("/shoppingList")
    public String shoppingList(HttpServletRequest request, String condition, Integer page) {
        shoppingService.shoppingList(request, condition, page);
        return "cashier/consumptionRecord";
    }

    @RequestMapping("/addGood")
    public String addGood(HttpServletRequest request, String name, String price, String businessName) {
        goodService.add(request, name, price, businessName);
        return "cashier/addGood";
    }

    @RequestMapping("/addLotOfGood")
    public String addLotOfGood(HttpServletRequest request) {
        goodService.addLot(request);
        return "cashier/addGood";
    }

    @RequestMapping("/deleteGood")
    public String deleteGood(HttpServletRequest request, Integer goodId) {
        goodService.delete(request, goodId);
        return goodList(request, "", 1);
    }

    @RequestMapping("/updateGood")
    public String updateGood(HttpServletRequest request, Integer goodId, String name, String price, String businessName) {
        goodService.update(request, goodId, name, price, businessName);
        if (name == null) return "cashier/updateGood";
        return goodList(request, "", 1);
    }
}
