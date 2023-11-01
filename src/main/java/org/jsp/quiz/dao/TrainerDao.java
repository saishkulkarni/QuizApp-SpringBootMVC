package org.jsp.quiz.dao;

import java.util.List;

import org.jsp.quiz.dto.Batch;
import org.jsp.quiz.dto.DescriptiveQuestion;
import org.jsp.quiz.dto.McqQuestion;
import org.jsp.quiz.dto.QuizTest;
import org.jsp.quiz.dto.Trainer;
import org.jsp.quiz.dto.TrueFalseQuestion;
import org.jsp.quiz.repository.BatchRepository;
import org.jsp.quiz.repository.DescriptiveRepository;
import org.jsp.quiz.repository.QuizTestRepository;
import org.jsp.quiz.repository.TrainerRepository;
import org.jsp.quiz.repository.TrueFalseRepository;
import org.jsp.quiz.service.McqQuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jakarta.validation.Valid;

@Repository
public class TrainerDao {

	@Autowired
	TrainerRepository trainerRepository;

	@Autowired
	QuizTestRepository quizTestRepository;

	@Autowired
	BatchRepository batchRepository;

	@Autowired
	TrueFalseRepository trueFalseRepository;

	@Autowired
	DescriptiveRepository descriptiveRepository;

	@Autowired
	McqQuestionRepository mcqQuestionRepository;

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

	public List<Trainer> fetchVerifiedTrainers() {
		return trainerRepository.findByVerifiedTrue();
	}

	public Batch saveBatch(Batch batch) {
		return batchRepository.save(batch);
	}

	public Batch findById(String id) {
		return batchRepository.findById(id).orElse(null);
	}

	public McqQuestion saveQuestion(McqQuestion question) {
		return mcqQuestionRepository.save(question);
	}

	public TrueFalseQuestion saveQuestion(TrueFalseQuestion question) {
		return trueFalseRepository.save(question);
	}

	public DescriptiveQuestion saveQuestion(DescriptiveQuestion question) {
		return descriptiveRepository.save(question);
	}

	public List<Batch> fetchAllBatchCodes() {
		return batchRepository.findAll();
	}

	public List<McqQuestion> fetchAllMcqs() {
		return mcqQuestionRepository.findAll();
	}

	public List<TrueFalseQuestion> fetchAllTrueFalses() {
		return trueFalseRepository.findAll();
	}

	public List<DescriptiveQuestion> fetchAllDescriptiveQuestions() {
		return descriptiveRepository.findAll();
	}

	public QuizTest findTestById(int id) {
		return quizTestRepository.findById(id).orElse(null);
	}

	public QuizTest saveTest(QuizTest quizTest) {
		return quizTestRepository.save(quizTest);
	}

}
