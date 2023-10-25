package org.jsp.quiz.repository;

import java.util.List;

import org.jsp.quiz.dto.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, Integer> {

	Student findByEmail(String email);

	Student findByMobile(long mobile);

	List<Student> findByVerifiedTrue();

}
