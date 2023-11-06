package org.jsp.quiz.repository;

import java.util.List;

import org.jsp.quiz.dto.Batch;
import org.jsp.quiz.dto.QuizTest;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuizTestRepository extends JpaRepository<QuizTest, Integer> {

	List<QuizTest> findByStatusTrue();

	List<QuizTest> findByStatusTrueAndBatchCodeIn(List<String> list);

}
