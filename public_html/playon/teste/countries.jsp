<%@page import="java.util.*, org.playon.*" %>
<html>
<head>
<title>Countries</title>
<style>
*{font-family: "trebuchet ms", sans-serif}
p, li {font-size: 10pt}
</style>
</head>

<body>
<h1>Countries</h1>

<ul>
<%
	List countries = Utils.getCountries();
	for(Iterator i = countries.iterator(); i.hasNext();) {
		Country country = (Country)i.next();
%>
		<li><a href="/teste/country.jsp?code=<%=country.getCode() %>"><img border=0 src="/playon/flags/<%=country.getCode() %>.gif" width="18" height="12"> <%=country.getName() %></a></li>
<%
	}
%>
</ul>

</body>
</html>
