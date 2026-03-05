package com.sis.servlet;

import com.sis.dao.StudentDAO;
import com.sis.dao.StudentScoreDAO;
import com.sis.dao.SubjectDAO;
import com.sis.entity.Student;
import com.sis.entity.StudentScore;
import com.sis.entity.Subject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/score")
public class ScoreServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();
    private final SubjectDAO subjectDAO = new SubjectDAO();
    private final StudentScoreDAO scoreDAO = new StudentScoreDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("students", studentDAO.findAll());
        req.setAttribute("subjects", subjectDAO.findAll());
        req.getRequestDispatcher("/WEB-INF/views/addScore.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        int studentId = Integer.parseInt(req.getParameter("studentId"));
        int subjectId = Integer.parseInt(req.getParameter("subjectId"));
        double score1 = Double.parseDouble(req.getParameter("score1"));
        double score2 = Double.parseDouble(req.getParameter("score2"));

        Student student = studentDAO.findById(studentId);
        Subject subject = subjectDAO.findById(subjectId);

        StudentScore score = new StudentScore();
        score.setStudent(student);
        score.setSubject(subject);
        score.setScore1(score1);
        score.setScore2(score2);

        scoreDAO.save(score);

        resp.sendRedirect(req.getContextPath() + "/display");
    }
}
