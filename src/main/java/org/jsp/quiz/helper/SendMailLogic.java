package org.jsp.quiz.helper;

import java.io.UnsupportedEncodingException;

import org.jsp.quiz.dto.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class SendMailLogic {

	@Autowired
	JavaMailSender mailSender;

	public void sendMail(Student student) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom("saishkulkarni7@gmail.com", "Quiz App");
		helper.setTo(student.getEmail());
		helper.setSubject("Otp Verification");
		String gender = null;
		if (student.getGender().equals("male"))
			gender = "Mr. ";
		else
			gender = "Ms. ";
		String body = "<html><body><h1>Hello " + gender + student.getName()
				+ "</h1><h2>Your OTP for Creating Account is : " + student.getOtp()
				+ "</h2><h3>Thank you, Regards</h3><h1>Quiz App Jspiders</h1></body></html>";
		helper.setText(body, true);
		mailSender.send(message);
	}

}
