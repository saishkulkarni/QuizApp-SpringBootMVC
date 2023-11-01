package org.jsp.quiz.dto;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Data;

@Entity
@Data
public class Batch {
	@Id
	String batchCode;

	@OneToMany(cascade = CascadeType.ALL)
	List<QuizTest> tests;
}
