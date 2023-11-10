package org.jsp.quiz.dto;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class StudentQuestions {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String question;
	String studentAnswer;
	String correctAnswer;
	double marks;
}
