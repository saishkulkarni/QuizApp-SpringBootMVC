package org.jsp.quiz.dto;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Batch {
	@Id
	String batchCode;
}
