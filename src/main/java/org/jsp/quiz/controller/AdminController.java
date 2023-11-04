package org.jsp.quiz.controller;

import org.jsp.quiz.helper.LoginHelper;
import org.jsp.quiz.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminService adminService;

	@GetMapping("/login")
	public String loadLogin() {
		return "AdminLogin";
	}

	@GetMapping("/home")
	public String loadHome(HttpSession session, ModelMap map) {
		String admin = (String) session.getAttribute("admin");
		if (admin == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return "AdminHome";
		}
	}

	@PostMapping("/login")
	public String login(LoginHelper helper, ModelMap map, HttpSession session) {
		return adminService.login(helper, map, session);
	}

	@GetMapping("/fetch-trainer")
	public String fetchTrainers(ModelMap map, HttpSession session) {
		String admin = (String) session.getAttribute("admin");
		if (admin == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return adminService.fetchTrainers(map);
		}
	}

	@GetMapping("/fetch-student")
	public String fetchStudents(ModelMap map, HttpSession session) {
		String admin = (String) session.getAttribute("admin");
		if (admin == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return adminService.fetchStudents(map);
		}
	}

	@GetMapping("/trainer/change-status/{id}")
	public String changeTrainerStatus(@PathVariable int id, ModelMap map, HttpSession session) {
		String admin = (String) session.getAttribute("admin");
		if (admin == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return adminService.changeTrainerStatus(id, map);
		}
	}

	@GetMapping("/student/change-status/{id}")
	public String changeStudentStatus(@PathVariable int id, ModelMap map, HttpSession session) {
		String admin = (String) session.getAttribute("admin");
		if (admin == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return adminService.changeStudentStatus(id, map);
		}
	}
}
