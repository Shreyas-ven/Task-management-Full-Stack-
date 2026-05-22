package controller;

import java.io.IOException;

import dao.TaskDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Task;

@WebServlet("/addTask")
public class AddTaskServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String taskName = request.getParameter("taskName");

        // Get session
        HttpSession session = request.getSession();

        // Get logged-in user id from session
        int userId = (int) session.getAttribute("userId");

        // Create task object
        Task task = new Task();
        task.setUserId(userId);
        task.setTaskName(taskName);

        // Save task
        TaskDAO dao = new TaskDAO();
        boolean status = dao.addTask(task);

        if (status) {
            response.getWriter().println("Task Added Successfully");
            response.sendRedirect("tasks.jsp");
        } else {
            response.getWriter().println("Failed to Add Task");
        }
    }
}