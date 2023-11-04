package org.jsp.quiz.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.jsp.quiz.dto.Batch;
import org.jsp.quiz.dto.DescriptiveQuestion;
import org.jsp.quiz.dto.McqQuestion;
import org.jsp.quiz.dto.QuizTest;
import org.jsp.quiz.dto.Trainer;
import org.jsp.quiz.dto.TrueFalseQuestion;
import org.jsp.quiz.helper.LoginHelper;
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
import jakarta.servlet.http.HttpSession;
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

	@GetMapping("/home")
	public String loadHome(HttpSession session, ModelMap map) {
		Trainer trainer = (Trainer) session.getAttribute("trainer");
		if (trainer == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return "TrainerHome";
		}
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

	@PostMapping("/login")
	public String login(LoginHelper helper, ModelMap map, HttpSession session) {
		return trainerService.login(helper, map, session);
	}

	@GetMapping("/forgot-password")
	public String forgotPassword() {
		return "TrainerForgotPassword";
	}

	@PostMapping("/forgot-password")
	public String forgotPassword(@RequestParam String email, ModelMap map)
			throws UnsupportedEncodingException, MessagingException {
		return trainerService.forgotPassword(map, email);
	}

	@GetMapping("/reset-password/{id}/{token}")
	public String resetLink(@PathVariable int id, @PathVariable String token, ModelMap map) {
		return trainerService.resetLink(id, token, map);
	}

	@PostMapping("/reset-password")
	public String resetPassword(@RequestParam int id, @RequestParam String password, ModelMap map) {
		return trainerService.resetPassword(id, password, map);
	}

	@GetMapping("/add-question")
	public String addQuestion(ModelMap map, HttpSession session) {
		Trainer trainer = (Trainer) session.getAttribute("trainer");
		if (trainer == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return "AddQuestion";
		}
	}

	@GetMapping("/add-batchcode")
	public String addBatchCode(ModelMap map, HttpSession session) {
		Trainer trainer = (Trainer) session.getAttribute("trainer");
		if (trainer == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return "AddBatchCode";
		}
	}

	@PostMapping("/add-batchcode")
	public String addbatchCode(Batch batch, ModelMap map, HttpSession session) {
		Trainer trainer = (Trainer) session.getAttribute("trainer");
		if (trainer == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return trainerService.addBatchCode(batch, map);
		}
	}

	@PostMapping("/question-add-mcq")
	public String addQuestion(McqQuestion question, ModelMap map, HttpSession session) {
		Trainer trainer = (Trainer) session.getAttribute("trainer");
		if (trainer == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return trainerService.addQuestion(question, map, trainer, session);
		}
	}

	@PostMapping("/question-add-truefalse")
	public String addQuestion(TrueFalseQuestion question, ModelMap map, HttpSession session) {
		Trainer trainer = (Trainer) session.getAttribute("trainer");
		if (trainer == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return trainerService.addQuestion(question, map, trainer, session);
		}
	}

	@PostMapping("/question-add-descriptive")
	public String addQuestion(DescriptiveQuestion question, ModelMap map, HttpSession session) {
		Trainer trainer = (Trainer) session.getAttribute("trainer");
		if (trainer == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return trainerService.addQuestion(question, map, trainer, session);
		}
	}

	@GetMapping("/create-test")
	public String createTest(HttpSession session, ModelMap map) {
		Trainer trainer = (Trainer) session.getAttribute("trainer");
		if (trainer == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return trainerService.createTest(map);
		}
	}

	@PostMapping("/create-test")
	public String createTest(QuizTest test, HttpSession session, ModelMap map) {
		Trainer trainer = (Trainer) session.getAttribute("trainer");
		if (trainer == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return trainerService.createTest(test, map);
		}
	}

	@PostMapping("/add-test-questions")
	public String addQUestionsToTest(QuizTest test, HttpSession session, ModelMap map) {
		Trainer trainer = (Trainer) session.getAttribute("trainer");
		if (trainer == null) {
			map.put("fail", "Invalid Session");
			return "index";
		} else {
			return trainerService.addQuestionsToTest(test, map);
		}
	}
}
