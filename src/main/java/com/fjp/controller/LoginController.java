package com.fjp.controller;

import com.fjp.entity.SchoolCard;
import com.fjp.entity.Student;
import com.fjp.entity.Visitor;
import com.fjp.service.SchoolCardService;
import com.fjp.service.StudentService;
import com.fjp.service.VisitorService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/LoginController")
public class LoginController {
	@Resource
	private VisitorService visitorService;
	@Resource
	private StudentService studentService;
	@Resource
	private SchoolCardService schoolCardService;
	@RequestMapping("/login")
	public String login(HttpServletRequest request, String username, String password) {
		List<Visitor> visitorList = visitorService.getUserList();
		for (Visitor visitor : visitorList) {
			if (visitor.getUsername().equals(username) && visitor.getPassword().equals(password)) {
				request.getSession().getServletContext().setAttribute("username", username);
				if (visitor.getType().equals("学生")) {
					request.getSession().getServletContext().setAttribute("student", "student");
					return "student/index";
				} else if (visitor.getType().equals("管理员")) {
					request.getSession().setAttribute("manager", "manager");
					return "manager/index";
				} else if (visitor.getType().equals("图书馆管理员")) {
					request.getSession().setAttribute("libraryManager", "libraryManager");
					return "libraryManager/index";
				} else {
					request.getSession().setAttribute("cashier", "cashier");
					return "cashier/index";
				}
			}
		}
		request.setAttribute("message", "账号或密码错误！");
		return "index";
	}
}
