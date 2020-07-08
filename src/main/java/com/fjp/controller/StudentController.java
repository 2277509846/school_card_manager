package com.fjp.controller;

import com.fjp.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/StudentController")
public class StudentController {
    @Resource
    private AccessRecordService accessRecordService;
    @Resource
    private ShoppingService shoppingService;
    @Resource
    private LendBookRecordService lendBookRecordService;
    @Resource
    private RechargeWaterElectricityService rechargeWaterElectricityService;
    @Resource
    private SchoolCardService schoolCardService;
    @Resource
    private RechargeSchoolCardService rechargeSchoolCardService;

    @RequestMapping("/accessRecords")
    public String accessRecords(HttpServletRequest request, Integer page) {
        accessRecordService.getAccessRecordsByStudentNum(request, page);
        return "student/accessRecord";
    }

    @RequestMapping("/shoppingList")
    public String shoppingList(HttpServletRequest request, Integer page) {
        shoppingService.getShoppingListByStudentNum(request, page);
        return "student/consumptionRecord";
    }

    @RequestMapping("/lendBookRecordList")
    public String lendBookRecordList(HttpServletRequest request, Integer page) {
        lendBookRecordService.getLendBookRecordsByStudentNum(request, page);
        return "student/lendBookRecord";
    }

    @RequestMapping("/rechargeWaterElectricityRecordList")
    public String rechargeWaterElectricityRecordList(HttpServletRequest request, Integer page) {
        rechargeWaterElectricityService.getRechargeWaterElectricityByStudentNum(request, page);
        return "student/waterAndElectricity";
    }

    @RequestMapping("rechargeWaterElectricity")
    public String rechargeWaterElectricity(HttpServletRequest request, String dormitoryNum, String type, Double rechargeMoney, String password) {
        rechargeWaterElectricityService.recharge(request, dormitoryNum, type, rechargeMoney, password);
        return "student/rechargeWaterElectricity";
    }

    @RequestMapping("/RechargeSchoolCardList")
    public String rechargeSchoolCardList(HttpServletRequest request, Integer page) {
        rechargeSchoolCardService.getRechargeSchoolCardsByStudentNum(request, page);
        return "student/rechargeSchoolCardRecord";
    }

    @RequestMapping("/RechargeSchoolCard")
    public void rechargeSchoolCard(HttpServletRequest request, HttpServletResponse response, String password, Double total_amount) throws Exception {
        rechargeSchoolCardService.recharge(request, response, password, total_amount);
    }

    @RequestMapping("/recharge")
    public String recharge(HttpServletRequest request) {
        rechargeSchoolCardService.recharge2(request);
        return "student/index";
    }

    @RequestMapping("/reportTheLoss")
    public String reportTheLoss(HttpServletRequest request, String password, String c) {
        schoolCardService.reportTheLoss(request, password, c);
        return "student/reportTheLoss";
    }

    @RequestMapping("/resetPassword")
    public String resetPassword(HttpServletRequest request, String newPassword, String oldPassword) {
        schoolCardService.resetPassword(request, newPassword, oldPassword);
        return "student/resetPassword";
    }

    @RequestMapping("/findTheSchoolCard")
    public String findTheSchoolCard(HttpServletRequest request, String password) {
        schoolCardService.findTheSchoolCard(request, password);
        return "student/findTheSchoolCard";
    }
}
