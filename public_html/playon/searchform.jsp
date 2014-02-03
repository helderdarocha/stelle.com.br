<%@page import="java.util.*, org.playon.*" %>
<html>
<head>
<title>Search</title>
<style>
*{font-family: "trebuchet ms", sans-serif}
p, li {font-size: 10pt}
</style>
</head>
<body>
<h1>Search for someone</h1>
<form action="/playon/people.jsp" method="post">
<p>Type a name or part of a name <input type=text name="name" >
<p>Choose a country (optional)
<select name="country">
<option value="all">All countries</option>
<%
	List countries = Utils.getCountries();
	for(Iterator i = countries.iterator(); i.hasNext();) {
		Country country = (Country)i.next();
%>
		<option value="<%=country.getCode() %>"><%=country.getName() %></option>
<%
	}
%>
</select>
<input type="submit" value="Search">
</form>
</body>
</html>
