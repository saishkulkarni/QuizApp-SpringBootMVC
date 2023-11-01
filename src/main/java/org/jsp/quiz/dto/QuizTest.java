package org.jsp.quiz.dto;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import lombok.Data;

@Component
@Data
@Entity
public class QuizTest {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String name;
	LocalDateTime startTime;
	int duration;
	double totalMarks;
	String batchCode;
	boolean status;
	boolean completed;

	@ManyToMany
	List<McqQuestion> mcqs;

	@ManyToMany
	List<TrueFalseQuestion> trueFalseQuestions;

	@ManyToMany
	List<DescriptiveQuestion> descriptiveQuestions;

}
