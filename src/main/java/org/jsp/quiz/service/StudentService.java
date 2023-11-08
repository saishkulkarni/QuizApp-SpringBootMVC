package org.jsp.quiz.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.jsp.quiz.dao.StudentDao;
import org.jsp.quiz.dto.Batch;
import org.jsp.quiz.dto.DescriptiveQuestion;
import org.jsp.quiz.dto.McqQuestion;
import org.jsp.quiz.dto.QuizTest;
import org.jsp.quiz.dto.Student;
import org.jsp.quiz.dto.StudentResult;
import org.jsp.quiz.dto.TrueFalseQuestion;
import org.jsp.quiz.helper.AES;
import org.jsp.quiz.helper.AnswerHelper;
import org.jsp.quiz.helper.LoginHelper;
import org.jsp.quiz.helper.SendMailLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;

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
			// Logic for encrypting password
			student.setPassword(AES.encrypt(student.getPassword(), "123"));
			// Logic for converting multipartfile to byte[]
			byte[] picture = new byte[pic.getInputStream().available()];
			pic.getInputStream().read(picture);
			student.setPicture(picture);
			// Logic for generating otp
			student.setOtp(new Random().nextInt(100000, 999999));
			// Logic for Sending Mail
			// mailLogic.sendMail(student);
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
					// mailLogic.sendMail(student1);
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

	public String verifyOtp(int id, int otp, ModelMap map) {
		Student student = studentDao.findById(id);
		if (student == null) {
			map.put("fail", "Something went wrong");
			return "index";
		} else {
			if (student.getOtp() == otp) {
				student.setVerified(true);
				studentDao.save(student);
				map.put("pass", "Otp verified Success Account Created");
				return "StudentLogin";
			} else {
				map.put("fail", "OTP Missmatch, Try Again");
				map.put("id", student.getId());
				return "VerifyOtp";
			}
		}
	}

	public String resendOtp(int id, ModelMap map) throws UnsupportedEncodingException, MessagingException {
		Student student = studentDao.findById(id);
		if (student == null) {
			map.put("fail", "Something went wrong");
			return "index";
		} else {
			student.setOtp(new Random().nextInt(100000, 999999));
			mailLogic.sendMail(student);
			studentDao.save(student);
			map.put("id", student.getId());
			map.put("pass", "OTP Resent Success");
			return "VerifyOtp";
		}
	}

	public String login(LoginHelper helper, ModelMap map, HttpSession session) {
		Student student = studentDao.findByEmail(helper.getEmail());
		if (student == null)
			map.put("fail", "Invalid Email");
		else {
			if (student.isVerified()) {
				if (student.isApproved()) {
					if (AES.decrypt(student.getPassword(), "123").equals(helper.getPassword())) {
						map.put("pass", "Login Success");
						session.setAttribute("student", student);
						return "StudentHome";
					} else
						map.put("fail", "Invalid Password");
				} else
					map.put("fail", "Wait for Admins Approval");
			} else
				map.put("fail", "First Verify Email");
		}
		return "StudentLogin";
	}

	public String forgotPassword(ModelMap map, String email) throws UnsupportedEncodingException, MessagingException {
		Student student = studentDao.findByEmail(email);
		if (student == null) {
			map.put("fail", "Account with " + email + " Does't Exist");
			return "StudentForgotPassword";
		} else {
			student.setOtp(new Random().nextInt(100000, 999999));
			// mailLogic.reSendMail(student);
			studentDao.save(student);
			map.put("pass", "OTP Sent Success");
			map.put("id", student.getId());
			return "StudentResetPassword";
		}
	}

	public String resetPassword(int id, int otp, String password, ModelMap map) {
		Student student = studentDao.findById(id);
		if (student == null) {
			map.put("fail", "Something Went Wrong");
			return "index";
		} else {
			if (student.getOtp() == otp) {
				student.setPassword(AES.encrypt(password, "123"));
				studentDao.save(student);
				map.put("pass", "Password Reset Success");
				return "StudentLogin";
			} else {
				map.put("fail", "OTP Missmatch");
				map.put("id", student.getId());
				return "StudentResetPassword";

			}
		}
	}

	public String addBatchCode(ModelMap map) {
		List<Batch> list = studentDao.fetchAllBatchCodes();
		if (list.isEmpty()) {
			map.put("fail", "No Batches Present");
			return "StudentHome";
		} else {
			map.put("list", list);
			return "SelectBatchCode";
		}
	}

	public String addBatchCode(Student student1, Student student, HttpSession session, ModelMap map) {
		List<Batch> eBatches = student1.getBatchs();
		List<Batch> nBatches = student.getBatchs();
		if (nBatches == null || nBatches.isEmpty()) {
			map.put("fail", "Select atleast One Batch");
			return addBatchCode(map);
		} else {
			if (eBatches == null || eBatches.isEmpty()) {
				student1.setBatchs(nBatches);
				studentDao.save(student1);
				map.put("pass", "Batch Added Success");
				return "StudentHome";
			} else {
				boolean flag = false;
				for (Batch nBatch : nBatches) {
					if (!eBatches.contains(nBatch)) {
						flag = true;
						eBatches.add(nBatch);
					}
				}
				if (flag) {
					student1.setBatchs(eBatches);
					studentDao.save(student1);
					map.put("pass", "Batch Added Success");
					return "StudentHome";
				} else {
					map.put("fail", "Batch Code Already Exists");
					return addBatchCode(map);
				}
			}
		}
	}

	public void enableTest() {
		List<QuizTest> tests = studentDao.fetchAllTest();
		for (QuizTest test : tests) {
			if (Period.between(test.getStartTime().toLocalDate(), LocalDate.now()).getDays() == 0) {
				if (test.getStartTime().getHour() >= LocalDateTime.now().getHour()) {
					test.setStatus(true);
				}
			} else {
				test.setStatus(false);
			}
		}
		studentDao.saveAll(tests);

	}

	public String showTest(Student student, HttpSession session, ModelMap map) {
		enableTest();
		List<Batch> batchs = student.getBatchs();
		if (batchs.isEmpty()) {
			map.put("fail", "No Batch Selected");
			return "StudentHome";
		} else {
			List<QuizTest> quizTests = studentDao
					.fetchAllActiveTests(batchs.stream().map(x -> x.getBatchCode()).toList());
			if (quizTests.isEmpty()) {
				map.put("fail", "No Active Tests Found");
				return "StudentHome";
			} else {
				map.put("tests", quizTests);
				return "SelectTest";
			}
		}
	}

	public String startTest(int id, ModelMap map) {
		QuizTest test = studentDao.findTestById(id);
		if (test == null) {
			map.put("fail", "Something went wrong");
			return "index";
		} else {
			map.put("test", test);
			return "Test";
		}
	}

	public String submitTest(int id, AnswerHelper helper, ModelMap map, Student student, HttpSession session) {
		QuizTest test = studentDao.findTestById(id);
		if (test == null) {
			map.put("fail", "Something went wrong");
			return "index";
		} else {
			StudentResult result = new StudentResult();
			result.setBatchCode(test.getBatchCode());
			result.setTestName(test.getName());
			result.setTotalMarks(test.getTotalMarks());
			double obtainerMarks = 0;

			for (McqQuestion question : test.getMcqs()) {
				if (helper.getAnswer().keySet().contains(question.getId())) {
					if (question.getAnswer().equals(helper.getAnswer().get(question.getId()))) {
						obtainerMarks += question.getMarks();
					}
				}
			}
			for (TrueFalseQuestion question : test.getTrueFalseQuestions()) {
				if (helper.getAnswer().keySet().contains(question.getId())) {
					if ((question.isAnswer() + "").equals(helper.getAnswer().get(question.getId()))) {
						obtainerMarks += question.getMarks();
					}
				}
			}
			for (DescriptiveQuestion question : test.getDescriptiveQuestions()) {
				if (helper.getAnswer().keySet().contains(question.getId())) {
					if (question.getAnswer().equalsIgnoreCase(helper.getAnswer().get(question.getId()))) {
						obtainerMarks += question.getMarks();
					}
				}
			}
			result.setObtainedMarks(obtainerMarks);
			result.setPercentage(obtainerMarks / test.getTotalMarks() * 100);

			List<StudentResult> results = student.getResults();
			if (results == null)
				results = new ArrayList<StudentResult>();
			results.add(result);
			student.setResults(results);
			studentDao.save(student);
			session.setAttribute("student", student);
			map.put("result", result);
			return "StudentResult";
		}
	}

}
