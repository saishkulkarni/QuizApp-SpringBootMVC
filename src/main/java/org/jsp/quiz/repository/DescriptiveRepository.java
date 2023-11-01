package org.jsp.quiz.repository;

import org.jsp.quiz.dto.DescriptiveQuestion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DescriptiveRepository extends JpaRepository<DescriptiveQuestion, Integer> {

}
