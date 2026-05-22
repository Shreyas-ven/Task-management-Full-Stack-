<%
	Integer userId = (Integer) session.getAttribute("userId");
	if (userId == null){
		response.sendRedirect("login.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Student Productivity Portal</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
    <%
		String userName = (String) session.getAttribute("userName");  
    %>
        <header>
            <h1>Welcome to Daily Task</h1>
            <p>Manage your Daily Tasks Here! </p>
        </header>
        <nav>
            <a href="index.jsp">Home</a>
            <a href="register.jsp">Register</a>
            <a href="tasks.jsp">Tasks</a>
            
            <% 
            	if (userName == null){
            %>
            	<a href="signup.jsp"id="signupLink">Sign Up</a>
            	<a href="login.jsp" id="loginLink">Login</a>
            <%
            	}
            	else{
            %>
            	<a href="logout" >Logout</a>
            <% } %>
        </nav>
        <section class = "register-section">
            <h1>DAILY TASKS</h1>
            <div >
            	<form action ="addTask"  method="post">
            	<label>Add Task :</label>
                <input type="text" name="taskName"><br><br>
                <button id="addTaskBtn">Add Task </button>
            	
            	</form>
                
            </div>
            <table>
                <thead>
                    <th>Task</th>
                    <th>Action</th>
                </thead>
                <tbody id ="taskList">

                </tbody>
            </table>
        </section>

        <footer>
        <p>&copy; 2026 Student Productivity Portal | All Rights Reserved</p>
        <p>Email: support@studentportal.com | Phone: +91 80733 18562</p>
        </footer>
        <script src="script.js"></script>
    </body>
</html>