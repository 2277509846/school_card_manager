package com.fjp.service.impl;

import com.fjp.dao.SchoolCardDao;
import com.fjp.dao.StudentDao;
import com.fjp.entity.SchoolCard;
import com.fjp.service.SchoolCardService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Service("SchoolCardService")
public class SchoolCardServiceImpl implements SchoolCardService {
    @Resource
    private SchoolCardDao schoolCardDao;
    @Resource
    private StudentDao studentDao;

    @Override
    public void reportTheLoss(HttpServletRequest request, String password, String c) {
        String username = (String) request.getSession().getServletContext().getAttribute("username");
        SchoolCard schoolCard = schoolCardDao.getSchoolCardById(studentDao.getStudentByNum(username).getSchoolCardId());
        if (schoolCard.getStatus().equals("挂失")) {
            request.setAttribute("message", "已挂失");
        }
        if ("first".equals(c)) {
            return;
        } else if (!schoolCard.getPassword().equals(password)) {
            request.setAttribute("message", "密码错误！");
        } else {
            schoolCardDao.reportTheLoss(schoolCard.getId());
            request.setAttribute("message", "挂失成功！");
        }
    }

    @Override
    public void resetPassword(HttpServletRequest request, String newPassword, String oldPassword) {
        String username = (String) request.getSession().getServletContext().getAttribute("username");
        SchoolCard schoolCard = schoolCardDao.getSchoolCardById(studentDao.getStudentByNum(username).getSchoolCardId());
        if (!schoolCard.getPassword().equals(oldPassword)) {
            request.setAttribute("message", "密码错误！");
        } else if (!newPassword.matches("\\w{6,12}")) {
            request.setAttribute("message", "密码只能由6-12位字母或数字组成！");
        } else {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("newPassword", newPassword);
            params.put("id", schoolCard.getId());
            schoolCardDao.resetPassword(params);
            request.setAttribute("message", "修改成功！");
        }
    }

    @Override
    public void findTheSchoolCard(HttpServletRequest request, String password) {
        String username = (String) request.getSession().getServletContext().getAttribute("username");
        SchoolCard schoolCard = schoolCardDao.getSchoolCardById(studentDao.getStudentByNum(username).getSchoolCardId());
        if (schoolCard.getPassword().equals(password)) {
            schoolCardDao.findTheSchoolCard(schoolCard.getId());
            request.setAttribute("message", "已取消挂失！");
        } else {
            request.setAttribute("message", "密码错误！");
        }
    }
}
