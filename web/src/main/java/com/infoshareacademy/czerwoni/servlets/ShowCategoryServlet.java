package com.infoshareacademy.czerwoni.servlets;

import com.infoshareacademy.czerwoni.dao.CategoryDao;
import com.infoshareacademy.czerwoni.dao.QuestionAnswerDao;
import com.infoshareacademy.czerwoni.domain.Answer;
import com.infoshareacademy.czerwoni.domain.Category;
import com.infoshareacademy.czerwoni.domain.Question;


import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("show-category")
public class ShowCategoryServlet extends HttpServlet{

    @Inject
    QuestionAnswerDao questionAnswerDaoBean;

    @Inject
    CategoryDao categoryDaoBean;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        Integer answerId = Integer.parseInt(request.getParameter("answerRadio"));
        request.setAttribute("selectedRadio", answerId);
        Answer answer = questionAnswerDaoBean.getAnswerById(answerId);
        Category category = categoryDaoBean.getCategoryById(answer.getRelatedCategory().getCategoryId());
        request.setAttribute("category", category);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("show-category.jsp");
        requestDispatcher.forward(request,response);
    }
}
