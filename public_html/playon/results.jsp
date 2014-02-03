<%@page import="java.util.*, org.playon.*" %>

<html>
<head>
<title>Preview Profile</title>
</head>

<body>

<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String country = request.getParameter("country");
	int id = Utils.addUser(name, email, country);
%>

<h1>Preview Profile</h1>

<form action="">

<br>Name: <%=name %> <input type="hidden" name="name" value="<%=name %>">
<br>E-mail: <%=email %> <input type="hidden" name="email" value="<%=email %>">
<br>Country: <%=country %> <input type="hidden" name="country" value="<%=country %>">

<input type="submit" value="Confirm">
</form>

</body>
</html:html>
