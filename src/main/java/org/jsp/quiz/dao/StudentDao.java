package org.jsp.quiz.dao;

import java.util.List;

import org.jsp.quiz.dto.Batch;
import org.jsp.quiz.dto.QuizTest;
import org.jsp.quiz.dto.Student;
import org.jsp.quiz.dto.StudentResult;
import org.jsp.quiz.repository.BatchRepository;
import org.jsp.quiz.repository.QuizTestRepository;
import org.jsp.quiz.repository.StudentRepository;
import org.jsp.quiz.repository.StudentResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDao {

	@Autowired
	StudentRepository studentRepository;

	@Autowired
	BatchRepository batchRepository;

	@Autowired
	QuizTestRepository testRepository;

	@Autowired
	StudentResultRepository resultRepository;

	public void save(Student student) {
		studentRepository.save(student);
	}

	public Student findByEmail(String email) {
		return studentRepository.findByEmail(email);
	}

	public Student findByMobile(long mobile) {
		return studentRepository.findByMobile(mobile);
	}

	public Student findById(int id) {
		return studentRepository.findById(id).orElse(null);
	}

	public List<Student> fetchVerifiedStudents() {
		return studentRepository.findByVerifiedTrue();
	}

	public List<Batch> fetchAllBatchCodes() {
		return batchRepository.findAll();
	}

	public List<QuizTest> fetchAllTest() {
		return testRepository.findAll();
	}

	public void saveAll(List<QuizTest> tests) {
		testRepository.saveAll(tests);
	}

	public List<QuizTest> fetchAllActiveTests(List<String> list) {
		return testRepository.findByStatusTrueAndBatchCodeIn(list);
	}

	public QuizTest findTestById(int id) {
		return testRepository.findById(id).orElse(null);
	}

	public void save(StudentResult result) {
		resultRepository.save(result);
	}
}
