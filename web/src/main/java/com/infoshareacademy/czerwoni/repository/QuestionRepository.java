package com.infoshareacademy.czerwoni.repository;

import com.infoshareacademy.czerwoni.domain.Question;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Stateless
public class QuestionRepository {
    @PersistenceContext(unitName = "pUnit")
    EntityManager entityManager;

    public void addQuestion(Question question){
        entityManager.persist(question);
    }

    public Question getQuestionById(int id){
        return entityManager.find(Question.class, id);
    }

    public List<Question> getAllQuestions(){
        return entityManager.createNamedQuery("selectAllQuestions").getResultList();
    }

}
