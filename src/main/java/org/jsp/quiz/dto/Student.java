package org.jsp.quiz.dto;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Entity
@Data
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Size(min = 3, message = "*Enter Atleast 3 charecters")
	@Size(max = 15, message = "*At Max only 15 charecters Allowed")
	private String name;
	@Email(message = "Enter Proper Email")
	@NotEmpty
	private String email;
	private long mobile;
	private String password;
	private String gender;
	@Lob
	private byte[] picture;
}
