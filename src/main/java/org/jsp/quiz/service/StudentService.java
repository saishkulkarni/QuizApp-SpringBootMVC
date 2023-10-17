package org.jsp.quiz.service;

import java.io.IOException;
import java.util.Random;

import org.jsp.quiz.dto.Student;
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

	public String signup(Student student, MultipartFile pic, ModelMap map) throws IOException, MessagingException {
		// Logic for converting multipartfile to byte[]
		byte[] picture = new byte[pic.getInputStream().available()];
		pic.getInputStream().read(picture);
		student.setPicture(picture);
		// Logic for generating otp
		student.setOtp(new Random().nextInt(100000, 999999));
		// Logic for Sending Mail
		mailLogic.sendMail(student);
		
		
	}

}
