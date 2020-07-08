package com.fjp.controller;

import com.fjp.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/ManagerController")
public class ManagerController {
    @Resource
    ShoppingService shoppingService;
    @Resource
    private StudentService studentService;
    @Resource
    private LendBookRecordService lendBookRecordService;
    @Resource
    private AccessRecordService accessRecordService;
    @Resource
    private RechargeSchoolCardService rechargeSchoolCardService;

    @RequestMapping("/shoppingList")
    public String shoppingList(HttpServletRequest request, String condition, Integer page) {
        shoppingService.shoppingList(request, condition, page);
        return "manager/consumptionRecord";
    }

    @RequestMapping("/studentList")
    public String studentList(HttpServletRequest request, String condition, Integer page) {
        studentService.getStudentList(request, condition, page);
        return "manager/studentList";
    }

    @RequestMapping("/lendBookRecordList")
    public String lendBookRecordList(HttpServletRequest request, String condition, Integer page) {
        lendBookRecordService.lendBookRecordList(request, condition, page);
        return "manager/lendBookRecord";
    }

    @RequestMapping("/RechargeSchoolCardList")
    public String rechargeSchoolCardList(HttpServletRequest request, String condition, Integer page) {
        rechargeSchoolCardService.rechargeSchoolCardList(request, condition, page);
        return "manager/recharge";
    }

    @RequestMapping("/AccessRecordList")
    public String accessRecordList(HttpServletRequest request, String condition, Integer page) {
        accessRecordService.accessRecordList(request, condition, page);
        return "manager/accessRecord";
    }

    @RequestMapping("/reportTheLoss")
    public String reportTheLoss(HttpServletRequest request, String studentNum, String password) {
        studentService.remake(request, studentNum, password);
        return "manager/reportTheLoss";
    }

    @RequestMapping("/registerStudent")
    public String registerStudent(HttpServletRequest request, String studentNum, String password, String studentName, String phoneNumber, String dormitoryNum, String department) {
        studentService.addStudent(request, studentNum, password, studentName, phoneNumber, dormitoryNum, department);
        return "manager/addStudentInfo";
    }

    @RequestMapping("/registerLotOfStudent")
    public String registerLotOfStudent(HttpServletRequest request) {
        studentService.addLotOfStudent(request);
        return "manager/addStudentInfo";
    }

    @RequestMapping("/refund")
    public String refund(HttpServletRequest request, String studentNum, String password) {
        studentService.deleteStudent(request, studentNum, password);
        return "manager/refund";
    }
}
