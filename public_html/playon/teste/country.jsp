<%@page import="java.util.*, org.playon.*" %>
<html>
<style>
*{font-family: "trebuchet ms", sans-serif}
p, li {font-size: 10pt}
</style>
<script>
function viewProfile(id) {
	document.peopleform.person.value = id;
	document.peopleform.submit();
}
</script>
<head>
<%
	String countryCode = (String) request.getParameter("code");
	Country country = Utils.getCountry(countryCode);
%>
<title>Participants from <%=country.getName() %></title>
</head>

<body>
<h1>Participants from <%=country.getName() %></h1>
<form action="/teste/person.jsp" name="peopleform" method="post">
<input type="hidden" name="person">
<ul>
<%
	List people = Utils.getByCountry(countryCode);
	for(Iterator i = people.iterator(); i.hasNext();) {
		Person person = (Person)i.next();
%>
		<li><input type="checkbox" name="addtolist" value="<%=person.getEmail() %>"> <a href="javascript:viewProfile(<%=person.getId() %>)"><%=person.getName() %></a>: <b><a href="mailto:<%=person.getEmail() %>"><%=person.getEmail() %></a></b></li>
<%
	}
%>
</ul>
<script>
function checkAll(form) {
	for(i = 0; i < form.elements.length; i++) {
		if(form.elements[i].name=="addtolist") {
			form.elements[i].checked = true;
		}
	}
}
function unCheckAll(form) {
	for(i = 0; i < form.elements.length; i++) {
		if(form.elements[i].name=="addtolist") {
			form.elements[i].checked = false;
		}
	}
}
function concatEmails(form) {
	emails = "";
	for(i = 0; i < form.elements.length; i++) {
		if(form.elements[i].checked && form.elements[i].name=="addtolist") {
			emails += form.elements[i].value + ",";
		}
	}
	form.selem.value = emails;
}
</script>

<p><input type="button" value="Select All" onclick="checkAll(this.form)">
<input type="button" value="Unselect All" onclick="unCheckAll(this.form)">
<p><input type="button" value="Get selected emails" onclick="concatEmails(this.form)">
<p>Copy selected email list below<br>
<textarea name="selem" cols=60 rows=1></textarea><br>
<input type=button value="select list" onclick="this.form.selem.select()">

</form>

</body>
</html>
