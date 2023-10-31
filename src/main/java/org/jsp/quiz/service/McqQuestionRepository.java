package org.jsp.quiz.service;

import org.jsp.quiz.dto.McqQuestion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface McqQuestionRepository extends JpaRepository<McqQuestion, Integer> {

}
