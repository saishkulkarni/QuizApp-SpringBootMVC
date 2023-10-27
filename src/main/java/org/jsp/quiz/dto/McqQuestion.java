package org.jsp.quiz.dto;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity
public class McqQuestion {
	@GeneratedValue(generator = "mcq")
	@SequenceGenerator(name = "mcq", initialValue = 500, allocationSize = 1)
	@Id
	int id;
	String question;
	int marks;
	String answer;
	String option1;
	String option2;
	String option3;
	String option4;
	String subject;
}
