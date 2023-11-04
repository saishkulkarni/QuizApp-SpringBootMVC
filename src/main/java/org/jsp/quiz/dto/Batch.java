package org.jsp.quiz.dto;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class Batch {
	@Id
	String batchCode;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	List<QuizTest> tests;

	@Override
	public boolean equals(Object obj) {
		if (obj != null) {
			Batch batch = (Batch) obj;
			if (batch.getBatchCode().equals(batchCode))
				return true;
			else
				return false;
		}
		return false;
	} 
}
