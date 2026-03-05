package com.sis.servlet;

import com.sis.dao.StudentScoreDAO;
import com.sis.entity.StudentScore;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/display")
public class DisplayServlet extends HttpServlet {

    private final StudentScoreDAO scoreDAO = new StudentScoreDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        List<StudentScore> scores = scoreDAO.findAll();
        req.setAttribute("scores", scores);
        req.getRequestDispatcher("/WEB-INF/views/display.jsp").forward(req, resp);
    }
}
