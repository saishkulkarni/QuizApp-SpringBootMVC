package org.jsp.quiz.dao;

import java.util.List;

import org.jsp.quiz.dto.Trainer;
import org.jsp.quiz.repository.TrainerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jakarta.validation.Valid;

@Repository
public class TrainerDao {

	@Autowired
	TrainerRepository trainerRepository;

	public Trainer findByEmail(String email) {
		return trainerRepository.findByEmail(email);
	}

	public Trainer findByMobile(long mobile) {
		return trainerRepository.findByMobile(mobile);
	}

	public void save(@Valid Trainer trainer) {
		trainerRepository.save(trainer);
	}

	public Trainer findById(int id) {
		return trainerRepository.findById(id).orElse(null);
	}
	
	public List<Trainer> fetchVerifiedTrainers()
	{
		return trainerRepository.findByVerifiedTrue();
	}

}
