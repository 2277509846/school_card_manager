package com.fjp.service.impl;

import com.fjp.dao.DormitoryDao;
import com.fjp.dao.RechargeWaterElectricityDao;
import com.fjp.dao.SchoolCardDao;
import com.fjp.dao.StudentDao;
import com.fjp.entity.Dormitory;
import com.fjp.entity.RechargeWaterElectricity;
import com.fjp.entity.SchoolCard;
import com.fjp.entity.Student;
import com.fjp.service.RechargeWaterElectricityService;
import com.fjp.util.GetPageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("RechargeWaterElectricityService")
public class RechargeWaterElectricityServiceImpl implements RechargeWaterElectricityService {
    @Resource
    private RechargeWaterElectricityDao rechargeWaterElectricityDao;
    @Resource
    private DormitoryDao dormitoryDao;
    @Resource
    private StudentDao studentDao;
    @Resource
    private SchoolCardDao schoolCardDao;
    @Override
    public void getRechargeWaterElectricityByStudentNum(HttpServletRequest request, Integer page) {
        String username = (String) request.getSession().getServletContext().getAttribute("username");
        List<RechargeWaterElectricity> rechargeWaterElectricityRecords = rechargeWaterElectricityDao.getRechargeWaterElectricityByStudentNum(username);
        Map<String, Object> map = GetPageUtil.getPage(rechargeWaterElectricityRecords, page, 13);
        Dormitory dormitory = dormitoryDao.getDormitoryByStudentNum(username);
        request.setAttribute("rechargeWaterElectricityRecords", map.get("list"));
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("count", map.get("count"));
        request.setAttribute("dormitory", dormitory);
    }

    @Override
    public void recharge(HttpServletRequest request, String dormitoryNum, String type, Double rechargeMoney, String password) {
        Map<String, Object> params = new HashMap<String, Object>();
        String username = (String) request.getSession().getServletContext().getAttribute("username");
        Student student = studentDao.getStudentByNum(username);
        SchoolCard schoolCard = schoolCardDao.getSchoolCardById(student.getSchoolCardId());
        List<Dormitory> dormitories = dormitoryDao.dormitoryList();
        int i = 0;
        for (i = 0; i < dormitories.size(); i++) {
            if (dormitories.get(i).getNum().equals(dormitoryNum)) {
                break;
            }
        }
        if (i == dormitories.size()) {
            request.setAttribute("message", "没有找到此宿舍！");
        } else if (schoolCard.getStatus().equals("挂失")) {
            request.setAttribute("message", "此校园卡已挂失！");
        } else if (!schoolCard.getPassword().equals(password)) {
            request.setAttribute("message", "密码错误！");
        } else if (schoolCard.getBalance() < rechargeMoney) {
            request.setAttribute("message", "余额不足！");
        } else {
            params.put("studentNum", username);
            params.put("dormitoryNum", dormitoryNum);
            params.put("rechargeTime", new Date());
            params.put("rechargeMoney", rechargeMoney);
            params.put("type", type);
            rechargeWaterElectricityDao.recharge(params);
            request.setAttribute("message", "充值成功！");
        }
    }
}
