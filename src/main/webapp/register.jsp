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
            <h1>Enroll for a new course here!</h1>
            <p>Register for a new course here</p>
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

        <section class="register-section">
    <form class="register-form" action="registerStudent" method="post">
        <h2>Student Registration</h2>

        <div class="input-group">
            <label>Full Name</label>
            <input type="text" placeholder="Enter your full name" name="name">
        </div>

        <div class="input-group">
            <label>Email</label>
            <input type="email" placeholder="Enter your email" name="email">
        </div>

        <div class="input-group">
            <label>Phone</label>
            <input type="tel" placeholder="Enter your phone number" name="phone">
        </div>

        <div class="input-group">
            <label>Gender</label>

            <div class="gender-box">
                <label>
                    <input type="radio" name="gender" value="Male"> Male
                </label>

                <label>
                    <input type="radio" name="gender" value="Female"> Female
                </label>
            </div>
        </div>

        <div class="input-group">
            <label>Course</label>

         	<select name="course">

        	<option value="">Select Course</option>

       		 <option value="Python">Python</option>

       		 <option value="Java">Java</option>

        	<option value="DBMS">DBMS</option>

       		 <option value="HTML and CSS">HTML and CSS</option>

    </select>
    
    
        </div>
        
        <label>Skills:</label>
            <input type="text" placeholder="Enter your skills" name="skills">

        <button type="submit">Register</button>
    </form>
</section>

        <footer>
            <p>&copy; 2026 Student Productivity Portal | All Rights Reserved</p>
        <p>Email: support@studentportal.com | Phone: +91 80733 18562</p>
        </footer>
    </body>
</html>