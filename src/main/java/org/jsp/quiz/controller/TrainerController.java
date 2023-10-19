package org.jsp.quiz.controller;

import java.io.IOException;

import org.jsp.quiz.dto.Trainer;
import org.jsp.quiz.service.TrainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.mail.MessagingException;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/trainer")
public class TrainerController {

	@Autowired
	Trainer trainer;

	@Autowired
	TrainerService trainerService;

	@GetMapping("/login")
	public String loadLogin() {
		return "TrainerLogin";
	}

	@GetMapping("/signup")
	public String loadSignup(ModelMap map) {
		map.put("trainer", trainer);
		return "TrainerSignup";
	}

	@PostMapping("/signup")
	public String signup(@Valid Trainer trainer, BindingResult result, @RequestParam MultipartFile pic, ModelMap map)
			throws IOException, MessagingException {
		if (result.hasErrors())
			return "TrainerSignup";
		else
			return trainerService.signup(trainer, pic, map);
	}

	@GetMapping("/verify-link/{id}/{token}")
	public String verifyLink(@PathVariable int id, @PathVariable String token, ModelMap map) {
		return trainerService.verifylink(id, token, map);
	}
}
