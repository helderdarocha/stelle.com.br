<%@page import="java.util.*, org.playon.*" %>
<%
	int id = Integer.parseInt(request.getParameter("person"));
	Person person = Utils.getPerson(id);
%>
<html>
<head>
<style>
*{font-family: "trebuchet ms", sans-serif}
p, li {font-size: 10pt}
</style>
<title><%=person.getName() %></title>
</head>

<body>

<h1><%=person.getName() %></h1>

<p>[This profile page is under construction]
<form>
<p><img src="" width="120" height="120" border=1>
<p>Name: <%=person.getName() %> <input type="hidden" name="name" value="<%=person.getName() %>">
<br>E-mail: <%=person.getEmail() %> <input type="hidden" name="email" value="<%=person.getEmail() %>">
<br>Country: <%=person.getCountry().getName() %> <input type="hidden" name="country" value="<%=person.getCountry().getCode() %>">
<hr>
<p>emailOther
<br>password
<br>name
<br>nickname
<br>headline
<br>birthday
<br>birthmonth
<br>birthyear
<br>country 
<br>photo
<br>city
<br>address1
<br>address2
<br>address3
<br>addressCountry
<br>telCountryCode
<br>telephone1
<br>telephone2
<br>website
<br>websiteOther
<br>messenger
<br>messengerType
<br>messengerOther
<br>otherProfileInfo
</form>
</body>
</html:html>
