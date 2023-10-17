package org.jsp.quiz.controller;

import java.io.IOException;

import org.jsp.quiz.dto.Student;
import org.jsp.quiz.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.mail.MessagingException;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/student")
public class StudentController {

	@Autowired
	Student student;

	@Autowired
	StudentService studentService;

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
	public String signup(@Valid Student student, @RequestParam MultipartFile pic, BindingResult result, ModelMap map) throws IOException, MessagingException {
		if (result.hasErrors()) {
			return "StudentSignup";
		} else {
			return studentService.signup(student,pic,map);
		}
	}
}
