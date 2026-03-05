package com.sis.servlet;

import com.sis.dao.StudentDAO;
import com.sis.entity.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {

    private final StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/views/addStudent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String studentCode = req.getParameter("studentCode");
        String fullName = req.getParameter("fullName");
        String address = req.getParameter("address");

        Student student = new Student(studentCode, fullName, address);
        studentDAO.save(student);

        resp.sendRedirect(req.getContextPath() + "/display");
    }
}
