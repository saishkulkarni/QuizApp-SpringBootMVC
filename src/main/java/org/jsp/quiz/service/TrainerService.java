package org.jsp.quiz.service;

import java.io.IOException;
import java.util.Random;

import org.jsp.quiz.dao.TrainerDao;
import org.jsp.quiz.dto.Trainer;
import org.jsp.quiz.helper.AES;
import org.jsp.quiz.helper.SendMailLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import jakarta.mail.MessagingException;
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

	//		mailLogic.sendMail(trainer);

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

}
