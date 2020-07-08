package com.fjp.service.impl;

import com.fjp.dao.DormitoryDao;
import com.fjp.dao.SchoolCardDao;
import com.fjp.dao.StudentDao;
import com.fjp.entity.Dormitory;
import com.fjp.entity.SchoolCard;
import com.fjp.entity.Student;
import com.fjp.service.StudentService;
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

@Service("StudentService")
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentDao studentDao;
    @Resource
    private SchoolCardDao schoolCardDao;
    @Resource
    private DormitoryDao dormitoryDao;
    @Override
    public void getStudentList(HttpServletRequest request, String condition, Integer page) {
        if (condition == null) condition = "";
        List<Student> studentList = studentDao.getStudentList("%" + condition + "%");
        Map<String, Object> map = GetPageUtil.getPage(studentList, page, 13);
        request.setAttribute("students", map.get("list"));
        request.setAttribute("count", map.get("count"));
        request.setAttribute("page", map.get("currentPage"));
        request.setAttribute("condition", condition);
    }

    @Override
    public void remake(HttpServletRequest request, String studentNum, String password) {
        Map<String, Object> params = new HashMap<String, Object>();
        Student student = studentDao.getStudentByNum(studentNum);
        if (student == null) {
            request.setAttribute("message", "该学生不存在！");
            return;
        }
        if (!schoolCardDao.getSchoolCardById(student.getSchoolCardId()).getPassword().equals(password)) {
            request.setAttribute("message", "密码错误！");
            return;
        }
        params.put("num", studentNum);
        List<SchoolCard> schoolCards = schoolCardDao.schoolCardList();
        SchoolCard schoolCard = schoolCards.get(schoolCards.size() - 1);
        params.put("schoolCardId", schoolCard.getId());
        studentDao.remake(params);
        request.setAttribute("message", "补办成功！");
        params.put("newPassword", password);
        params.put("id", schoolCard.getId());
        schoolCardDao.resetPassword(params);
    }

    @Override
    public void addStudent(HttpServletRequest request, String studentNum, String password, String studentName, String phoneNumber, String dormitoryNum, String department) {
        Map<String, Object> params = new HashMap<String, Object>();
        request.setAttribute("studentNum", studentNum);
        request.setAttribute("password", password);
        request.setAttribute("studentName", studentName);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("dormitoryNum", dormitoryNum);
        request.setAttribute("department", department);
        if (!isValidate(request, studentNum, password, phoneNumber, dormitoryNum, studentName, department)) return;
        params.put("name", studentName);
        params.put("phoneNumber", phoneNumber);
        params.put("dormitoryNum", dormitoryNum);
        params.put("department", department);
        params.put("num", studentNum);
        studentDao.addStudent(params);
        params.put("newPassword", password);
        List<SchoolCard> schoolCards = schoolCardDao.schoolCardList();
        params.put("schoolCardId", schoolCards.get(schoolCards.size() - 1).getId());
        params.put("id", schoolCards.get(schoolCards.size() - 1).getId());
        studentDao.remake(params);
        schoolCardDao.resetPassword(params);
        request.setAttribute("message", "添加成功！");
    }

    private boolean isValidate(HttpServletRequest request, String studentNum, String password, String phoneNumber, String dormitoryNum, String studentName, String department) {
        if (!studentNum.matches("\\d{10}")) {
            request.setAttribute("message", "学号必须为10位数字");
            return false;
        }
        if (studentName.equals("")) {
            request.setAttribute("message", "学生名字不能为空");
            return false;
        }
        if (!password.matches("\\w{6,12}")) {
            request.setAttribute("message", "密码必须由6-12位字母或数字组成！");
            return false;
        }
        if (department.equals("")) {
            request.setAttribute("message", "所在系不能为空");
            return false;
        }
        if (!phoneNumber.matches("1\\d{10}")) {
            request.setAttribute("message", "手机号码不合法！");
            return false;
        }
        int i = 0;
        List<Dormitory> dormitories = dormitoryDao.dormitoryList();
        for (i = 0; i < dormitories.size(); i++) {
            if (dormitories.get(i).getNum().equals(dormitoryNum)) break;
        }
        if (i == dormitories.size()) {
            request.setAttribute("message", "宿舍号不存在！");
            return false;
        }
        Student student = studentDao.getStudentByNum(studentNum);
        if (student != null) {
            request.setAttribute("message", "该学号已存在");
            return false;
        }
        return true;
    }

    @Override
    public void addLotOfStudent(HttpServletRequest request) {
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
                        String num = "";
                        String name = "";
                        String phoneNumber = "";
                        String dormitoryNum = "";
                        String department = "";
                        String password = "";
                        for (row = 1; row < rowNumbers; row++) {
                            num = "";
                            name = "";
                            phoneNumber = "";
                            dormitoryNum = "";
                            department = "";
                            password = "";
                            Row r = sheet.getRow(row);
                            try {
                                num = r.getCell(0).toString();
                                name = r.getCell(1).toString();
                                phoneNumber = r.getCell(2).toString();
                                dormitoryNum = r.getCell(3).toString();
                                department = r.getCell(4).toString();
                                password = r.getCell(5).toString();
                            } catch (Exception ignored) {
                            }
                            if (!isValidate(request, num, password, phoneNumber, dormitoryNum, name, department)) break;
                        }
                        if (row < rowNumbers) {
                            String error = (String) request.getAttribute("message");
                            request.setAttribute("message", "第" + (row + 1) + "行" + error);
                            return;
                        }
                        for (row = 1; row < rowNumbers; row++) {
                            Row r = sheet.getRow(row);
                            num = r.getCell(0).toString();
                            name = r.getCell(1).toString();
                            phoneNumber = r.getCell(2).toString();
                            dormitoryNum = r.getCell(3).toString();
                            department = r.getCell(4).toString();
                            password = r.getCell(5).toString();
                            addStudent(request, num, password, name, phoneNumber, dormitoryNum, department);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteStudent(HttpServletRequest request, String studentNum, String password) {
        Student student = studentDao.getStudentByNum(studentNum);
        if (student == null) {
            request.setAttribute("message", "不存在此学生！");
            return;
        }
        SchoolCard schoolCard = schoolCardDao.getSchoolCardById(student.getSchoolCardId());
        if (!password.equals(schoolCard.getPassword())) {
            request.setAttribute("message", "密码错误！");
            return;
        }
        studentDao.deleteStudent(studentNum);
        request.setAttribute("message", "退卡成功！");
    }
}
