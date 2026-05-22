package controller;

import java.io.IOException;

import dao.RegisterDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Register;

@WebServlet("/registerStudent")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String course = request.getParameter("course");

        // For multiple checkbox values
        String[] skillsArray = request.getParameterValues("skills");

        // Convert array to comma separated string
        String skills = "";

        if (skillsArray != null) {
            skills = String.join(", ", skillsArray);
        }

        // Create Register object
        Register register = new Register();

        register.setName(name);
        register.setEmail(email);
        register.setPhone(phone);
        register.setGender(gender);
        register.setCourse(course);
        register.setSkills(skills);

        // DAO object
        RegisterDAO dao = new RegisterDAO();

        boolean status = dao.registerStudent(register);

        // Response
        if (status) {
            response.getWriter().println("Registration Successful");
        } else {
            response.getWriter().println("Registration Failed");
        }
    }
}