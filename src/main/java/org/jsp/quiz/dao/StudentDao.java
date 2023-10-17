package org.jsp.quiz.dao;

import org.jsp.quiz.dto.Student;
import org.jsp.quiz.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudentDao {

	@Autowired
	StudentRepository studentRepository;

	public void save(Student student) {
		studentRepository.save(student);
	}

	public Student findByEmail(String email) {
		return studentRepository.findByEmail(email);
	}

	public Student findByMobile(long mobile) {
		return studentRepository.findByMobile(mobile);
	}

}
