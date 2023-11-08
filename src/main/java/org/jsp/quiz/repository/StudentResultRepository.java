package org.jsp.quiz.repository;

import org.jsp.quiz.dto.StudentResult;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentResultRepository extends JpaRepository<StudentResult, Integer> {

}
