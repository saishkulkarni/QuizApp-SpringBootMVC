package org.jsp.quiz.dto;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.Data;

@Data
@Entity
public class DescriptiveQuestion {

	@Id
	@GeneratedValue(generator = "descriptive")
	@SequenceGenerator(name = "descriptive", allocationSize = 1, initialValue = 50000)
	int id;
	String question;
	String answer;
	int marks;
	String subject;
}
