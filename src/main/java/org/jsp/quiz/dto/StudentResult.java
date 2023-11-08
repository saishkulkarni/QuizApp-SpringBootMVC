package org.jsp.quiz.dto;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Component
@Entity
public class StudentResult {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	String testName;
	String batchCode;
	double totalMarks;
	double obtainedMarks;
	double percentage;
}
