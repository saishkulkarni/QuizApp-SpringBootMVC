package org.jsp.quiz.service;

import java.util.List;

import org.jsp.quiz.dao.StudentDao;
import org.jsp.quiz.dao.TrainerDao;
import org.jsp.quiz.dto.Student;
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

	@Autowired
	StudentDao studentDao;

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
		} else {
			map.put("trainers", trainers);
			return "AdminFetchTrainers";
		}
	}

	public String changeTrainerStatus(int id, ModelMap map) {
		Trainer trainer = trainerDao.findById(id);
		if (trainer == null) {
			map.put("fail", "Something went Wrong");
			return "index";
		} else {
			if (trainer.isApproved())
				trainer.setApproved(false);
			else
				trainer.setApproved(true);

			trainerDao.save(trainer);
			map.put("pass", "Status Changed Success");
			return fetchTrainers(map);
		}
	}

	public String changeStudentStatus(int id, ModelMap map) {
		Student student = studentDao.findById(id);
		if (student == null) {
			map.put("fail", "Something went Wrong");
			return "index";
		} else {
			if (student.isApproved())
				student.setApproved(false);
			else
				student.setApproved(true);

			studentDao.save(student);
			map.put("pass", "Status Changed Success");
			return fetchStudents(map);
		}
	}

	public String fetchStudents(ModelMap map) {
		List<Student> students = studentDao.fetchVerifiedStudents();
		if (students.isEmpty()) {
			map.put("fail", "No Data Found");
			return "AdminHome";
		} else {
			map.put("students", students);
			return "AdminFetchStudents";
		}
	}

}
