package org.jsp.quiz.dto;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity
public class TrueFalseQuestion {
	@GeneratedValue(generator = "trueFalse")
	@SequenceGenerator(name = "trueFalse", initialValue = 5000, allocationSize = 1)
	@Id
	int id;
	String question;
	int marks;
	String subject;
	boolean answer;
}
