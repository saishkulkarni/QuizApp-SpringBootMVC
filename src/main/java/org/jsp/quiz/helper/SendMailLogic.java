package org.jsp.quiz.helper;

import java.io.UnsupportedEncodingException;

import org.jsp.quiz.dto.Student;
import org.jsp.quiz.dto.Trainer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class SendMailLogic {

	@Autowired
	JavaMailSender mailSender;

	@Value("${server.host}")
	String host;

	@Value("${server.port}")
	int port;

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

	public void reSendMail(Student student) throws MessagingException, UnsupportedEncodingException {
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
				+ "</h1><h2>Your OTP for Resetting Password is : " + student.getOtp()
				+ "</h2><h3>Thank you, Regards</h3><h1>Quiz App Jspiders</h1></body></html>";
		helper.setText(body, true);
		mailSender.send(message);
	}

	public void sendMail(Trainer trainer) throws MessagingException, UnsupportedEncodingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom("saishkulkarni7@gmail.com", "Quiz App");
		helper.setTo(trainer.getEmail());
		helper.setSubject("Verification Link");

		String gender = null;
		if (trainer.getGender().equals("male"))
			gender = "Mr. ";
		else
			gender = "Ms. ";

		String url = host + port + "/trainer/verify-link/" + trainer.getId() + "/" + trainer.getToken();

		String body = "<html><body><h1>Hello " + gender + trainer.getName()
				+ "</h1><h2>Your Verification link is : <a href='" + url
				+ "'>Click here to Verify</a></h2><h3>Thank you, Regards</h3><h1>Quiz App Jspiders</h1></body></html>";
		helper.setText(body, true);
		mailSender.send(message);
	}

	public void reSendLink(Trainer trainer) throws UnsupportedEncodingException, MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		helper.setFrom("saishkulkarni7@gmail.com", "Quiz App");
		helper.setTo(trainer.getEmail());
		helper.setSubject("Reset Password Link");

		String gender = null;
		if (trainer.getGender().equals("male"))
			gender = "Mr. ";
		else
			gender = "Ms. ";

		String url = host + port + "/trainer/reset-password/" + trainer.getId() + "/" + trainer.getToken();

		String body = "<html><body><h1>Hello " + gender + trainer.getName()
				+ "</h1><h2>Your Password Reset link is : <a href='" + url
				+ "'>Click here to Reset</a></h2><h3>Thank you, Regards</h3><h1>Quiz App Jspiders</h1></body></html>";
		helper.setText(body, true);
		mailSender.send(message);
	}

}
