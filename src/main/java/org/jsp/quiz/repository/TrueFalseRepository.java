package org.jsp.quiz.repository;

import org.jsp.quiz.dto.TrueFalseQuestion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrueFalseRepository extends JpaRepository<TrueFalseQuestion, Integer> {

}
