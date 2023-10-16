package org.jsp.quiz.controller;

import org.jsp.quiz.dto.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	Student student;

	@GetMapping("/login")
	public String loadLogin() {
		return "StudentLogin";
	}

	@GetMapping("/signup")
	public String loadSignup(ModelMap map) {
		map.put("student", student);
		return "StudentSignup";
	}

	@PostMapping("/signup")
	public String signup(@Valid Student student, BindingResult result, ModelMap map) {
		if (result.hasErrors()) {
			return "StudentSignup";
		} else {
			return "StudentLogin";
		}
	}
}
