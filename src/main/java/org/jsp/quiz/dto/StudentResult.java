package org.jsp.quiz.dto;

import java.util.List;

import org.springframework.stereotype.Component;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.Data;

@Data
@Component
@Entity
public class StudentResult {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id;
	int testId;
	String testName;
	String batchCode;
	double totalMarks;
	double obtainedMarks;
	double percentage;

	@ManyToOne
	Student student;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	List<StudentQuestions> questions;
}
