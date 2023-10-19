package org.jsp.quiz.dto;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
@Entity
@Component
public class Trainer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Size(min = 3, message = "*Enter Atleast 3 charecters")
	@Size(max = 15, message = "*At Max only 15 charecters Allowed")
	private String name;
	@Email(message = "*Enter Proper Email")
	@NotEmpty(message = "*Enter Proper Email")
	private String email;
	@DecimalMin(value = "6000000000", message = "*Enter Proper Mobile Number")
	@DecimalMax(value = "9999999999", message = "*Enter Proper Mobile Number")
	@NotNull(message = "*Enter Proper Mobile Number")
	private long mobile;
	@Pattern(regexp = "^.*(?=.{8,})(?=..*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$", message = "*Enter atleast one uppercase,lowercase,digit and special charecter and minimum 8 charecters")
	private String password;
	@NotEmpty(message = "*This Field Can not be Empty")
	private String gender;
	private String subject;
	@Lob
	@Column(columnDefinition = "MEDIUMBLOB")
	private byte[] picture;
	private String token;
	private boolean verified;
	public String eid;
	private boolean approved;
}
