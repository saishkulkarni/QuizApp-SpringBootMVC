package org.jsp.quiz.service;

import java.util.List;

import org.jsp.quiz.dao.TrainerDao;
import org.jsp.quiz.dto.Trainer;
import org.jsp.quiz.helper.LoginHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import jakarta.servlet.http.HttpSession;

@Service
public class AdminService {

	@Autowired
	TrainerDao trainerDao;

	public String login(LoginHelper helper, ModelMap map, HttpSession session) {
		if (helper.getEmail().equals("admin") && helper.getPassword().equals("admin")) {
			session.setAttribute("admin", "admin");
			map.put("pass", "Login Success");
			return "AdminHome";
		} else {
			map.put("fail", "Invalid Credentials");
			return "AdminLogin";
		}
	}

	public String fetchTrainers(ModelMap map) {
		List<Trainer> trainers = trainerDao.fetchVerifiedTrainers();
		if (trainers.isEmpty()) {
			map.put("fail", "No Data Found");
			return "AdminHome";
		}
		else {
			map.put("trainers", trainers);
			return "AdminFetchTrainers";
		}
	}

}
