package com.infoshareacademy.czerwoni.servlets;

import com.infoshareacademy.czerwoni.dao.QuestionAnswerDao;
import com.infoshareacademy.czerwoni.domain.Answer;
import com.infoshareacademy.czerwoni.domain.Question;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("add-answer")
public class AddAnswerServlet extends HttpServlet {


    @Inject
    QuestionAnswerDao questionAnswerDaoBean;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String answerName = request.getParameter("answerName");
        Answer answer = new Answer();
        answer.setAnswerName(answerName);
//        Question question = questionAnswerDaoBean.getQuestionById(21);
//        answer.setRelatedQuest(question);

        questionAnswerDaoBean.addAnswer(answer);

    }

}
