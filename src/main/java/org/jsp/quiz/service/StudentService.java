package org.jsp.quiz.service;

import java.io.IOException;
import java.util.Random;

import org.jsp.quiz.dao.StudentDao;
import org.jsp.quiz.dto.Student;
import org.jsp.quiz.helper.AES;
import org.jsp.quiz.helper.SendMailLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import jakarta.mail.MessagingException;

@Service
public class StudentService {

	@Autowired
	SendMailLogic mailLogic;

	@Autowired
	StudentDao studentDao;

	public String signup(Student student, MultipartFile pic, ModelMap map) throws IOException, MessagingException {
		Student student1 = studentDao.findByEmail(student.getEmail());
		Student student2 = studentDao.findByMobile(student.getMobile());
		// Checking if Email and Mobile Already Exists
		if (student1 == null && student2 == null) {
			//Logic for encrypting password
			student.setPassword(AES.encrypt(student.getPassword(), "123"));
			// Logic for converting multipartfile to byte[]
			byte[] picture = new byte[pic.getInputStream().available()];
			pic.getInputStream().read(picture);
			student.setPicture(picture);
			// Logic for generating otp
			student.setOtp(new Random().nextInt(100000, 999999));
			// Logic for Sending Mail
			mailLogic.sendMail(student);
			// Logic for Saving Data
			studentDao.save(student);
			map.put("id", student.getId());
			map.put("pass", "OTP Sent Success");
			return "VerifyOtp";
		} else {
			if (student1 == student2) {
				if (student1.isVerified()) {
					map.put("fail", "Account Already Exists with the above Email and Mobile");
					map.put("student", student1);
					return "StudentSignup";
				} else {
					student1.setOtp(new Random().nextInt(100000, 999999));
					mailLogic.sendMail(student1);
					studentDao.save(student1);
					map.put("id", student1.getId());
					map.put("pass", "OTP Sent Again");
					return "VerifyOtp";
				}
			} else {
				if (student1 == null) {
					map.put("fail", "Account with Number Already Exists");
					map.put("student", student2);
					return "StudentSignup";
				} else {
					map.put("fail", "Account with Email Already Exists");
					map.put("student", student1);
					return "StudentSignup";
				}
			}
		}
	}

}
