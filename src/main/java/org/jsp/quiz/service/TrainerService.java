package org.jsp.quiz.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Random;

import org.jsp.quiz.dao.TrainerDao;
import org.jsp.quiz.dto.Batch;
import org.jsp.quiz.dto.McqQuestion;
import org.jsp.quiz.dto.Trainer;
import org.jsp.quiz.dto.TrueFalseQuestion;
import org.jsp.quiz.helper.AES;
import org.jsp.quiz.helper.LoginHelper;
import org.jsp.quiz.helper.SendMailLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Service
public class TrainerService {

	@Autowired
	TrainerDao trainerDao;

	@Autowired
	SendMailLogic mailLogic;

	public String signup(@Valid Trainer trainer, MultipartFile pic, ModelMap map)
			throws IOException, MessagingException {
		Trainer trainer1 = trainerDao.findByEmail(trainer.getEmail());
		Trainer trainer2 = trainerDao.findByMobile(trainer.getMobile());

		if (trainer1 == null && trainer2 == null) {
			trainer.setPassword(AES.encrypt(trainer.getPassword(), "123"));
			byte[] picture = new byte[pic.getInputStream().available()];
			pic.getInputStream().read(picture);
			trainer.setPicture(picture);

			trainer.setToken("abc" + new Random().nextInt() + "efg");

			trainerDao.save(trainer);

			// mailLogic.sendMail(trainer);

			map.put("pass", "Link Sent Success, CLick on Link to Create Account");
			return "TrainerLogin";
		} else {
			if (trainer1 == trainer2) {
				if (trainer1.isVerified()) {
					map.put("fail", "Account Already Exists with the above Email and Mobile");
					map.put("trainer", trainer1);
					return "TrainerSignup";
				} else {
					trainer.setToken("abc" + new Random().nextInt() + "efg");
					trainerDao.save(trainer);
					mailLogic.sendMail(trainer);
					map.put("pass", "Link Sent Again, CLick on Link to Create Account");
					return "TrainerLogin";
				}
			} else {
				if (trainer1 == null) {
					map.put("fail", "Account with Number Already Exists");
					map.put("trainer", trainer2);
					return "TrainerSignup";
				} else {
					map.put("fail", "Account with Email Already Exists");
					map.put("trainer", trainer1);
					return "TrainerSignup";
				}
			}
		}

	}

	public String verifylink(int id, String token, ModelMap map) {
		Trainer trainer = trainerDao.findById(id);
		if (trainer == null) {
			map.put("fail", "Something Went Wrong");
			return "index";
		} else {
			if (trainer.getToken().equals(token)) {
				trainer.setVerified(true);
				trainerDao.save(trainer);
				map.put("pass", "Account verified Success");
				return "TrainerLogin";
			} else {
				map.put("fail", "Something wrong with the Link");
				return "index";
			}
		}
	}

	public String login(LoginHelper helper, ModelMap map, HttpSession session) {
		Trainer trainer = trainerDao.findByEmail(helper.getEmail());
		if (trainer == null)
			map.put("fail", "Invalid Email");
		else {
			if (trainer.isVerified()) {
				if (trainer.isApproved()) {
					if (AES.decrypt(trainer.getPassword(), "123").equals(helper.getPassword())) {
						map.put("pass", "Login Success");
						session.setAttribute("trainer", trainer);
						return "TrainerHome";
					} else
						map.put("fail", "Invalid Password");
				} else
					map.put("fail", "Wait for Admins Approval");
			} else
				map.put("fail", "First Verify Email");
		}
		return "TrainerLogin";
	}

	public String forgotPassword(ModelMap map, String email) throws UnsupportedEncodingException, MessagingException {
		Trainer trainer = trainerDao.findByEmail(email);
		if (trainer == null) {
			map.put("fail", "Account with " + email + " Does't Exist");
			return "TrainerForgotPassword";
		} else {
			trainer.setToken("xyz" + new Random().nextInt() + "pqr");
			// mailLogic.reSendLink(trainer);
			trainerDao.save(trainer);
			map.put("pass", "Reset Link Sent Success Click that link to Reset Password");
			return "TrainerLogin";
		}
	}

	public String resetLink(int id, String token, ModelMap map) {
		Trainer trainer = trainerDao.findById(id);
		if (trainer == null) {
			map.put("fail", "Something went Wrong");
			return "index";
		} else {
			if (trainer.getToken().equals(token)) {
				map.put("id", trainer.getId());
				return "TrainerResetPassword";
			} else {
				map.put("fail", "Invalid Link");
				return "TrainerLogin";
			}
		}
	}

	public String resetPassword(int id, String password, ModelMap map) {
		Trainer trainer = trainerDao.findById(id);
		if (trainer == null) {
			map.put("fail", "Something went Wrong");
			return "index";
		} else {
			trainer.setPassword(AES.encrypt(password, "123"));
			trainerDao.save(trainer);
			map.put("pass", "Password Reset Success");
			return "TrainerLogin";
		}
	}

	public String addQuestion(McqQuestion question, ModelMap map, Trainer trainer, HttpSession session) {
		question.setSubject(trainer.getSubject());
		trainerDao.saveQuestion(question);
		map.put("pass", "Question Added Success");
		return "TrainerHome";
	}

	public String addBatchCode(Batch batch, ModelMap map) {
		if (trainerDao.findById(batch.getBatchCode()) == null) {
			trainerDao.saveBatch(batch);
			map.put("pass", "Batch Code Creation Success");
			return "TrainerHome";
		} else {
			map.put("fail", "Batch Code Already Exists");
			return "TrainerHome";
		}
	}

	public String addQuestion(TrueFalseQuestion question, ModelMap map, Trainer trainer, HttpSession session) {
		question.setSubject(trainer.getSubject());
		trainerDao.saveQuestion(question);
		map.put("pass", "Question Added Success");
		return "TrainerHome";
	}
}
