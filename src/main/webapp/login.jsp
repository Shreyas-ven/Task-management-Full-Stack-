<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>
<body>
<%
		String userName = (String) session.getAttribute("userName");  
    %>
    <header>
        <h1>Login Here</h1>
        <p>Access your account</p>
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
            <form class="register-form"  action="login" method = "post">
            <div class="input-group">
            <label>Email</label>
            <input type="email" id ="email" placeholder="Enter your email" name="email">
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" id="password" placeholder="Enter your password" name="pass">
        </div>

        <button type="submit">Login</button>
            </form>
        </section>
        <script src="script.js"></script>
</body>
</html>