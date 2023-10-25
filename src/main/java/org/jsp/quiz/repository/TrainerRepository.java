package org.jsp.quiz.repository;

import java.util.List;

import org.jsp.quiz.dto.Trainer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TrainerRepository extends JpaRepository<Trainer, Integer> {

	Trainer findByEmail(String email);

	Trainer findByMobile(long mobile);

	List<Trainer> findByVerifiedTrue();

}
