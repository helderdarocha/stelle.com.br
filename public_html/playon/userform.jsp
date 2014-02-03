<%@page import="java.util.*, org.playon.*" %>
<html>
<head>
<title>Add User</title>
</head>
<body>
<h1>Add User</h1>
<form action="/playon/results.jsp" method="post">
<p>Your name  <input type=text name="name" > <input type=radio name="display" value="name">
<p>If you are known (a.k.a) by another name, what is it? 
<input type=text name="nickname" > <input type=radio name="display" value="nick">
<p>Choose the one you wish to display in your profile.
<input type=radio name="display" value="nick">

<p>Choose an optional headline for your profile
<textarea width=400 height=100 name="headline"></textarea>

<p>Type in the password you received via email:
<input type=password name="password" >
<br>Choose a new password, if you wish:
<input type=password name="newpassword_1" >
<br>Repeat the new password:
<input type=password name="newpassword_2" >

<p>Select the country which you represented in the Festival:
<select name="country">
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

<p>Main email <input type=text name="email" >
<p>Other emails <input type=text name="email_other" > (separate with commas)

<p>When is your birthday? DD/MM/YYYY
<input type=text name="birthday" >, 
<select name="birthmonth">
	<option value="01">January</option>
	<option value="02">February</option>
	<option value="03">March</option>
	<option value="04">April</option>
	<option value="05">May</option>
	<option value="06">June</option>
	<option value="07">July</option>
	<option value="08">August</option>
	<option value="09">September</option>
	<option value="10">October</option>
	<option value="11">November</option>
	<option value="12">December</option>
</select>, 
<input type=text name="birthyear" >

<p>You can upload a photo of yourself (or change the current photo).
<input type="file" name="photo">

<p>Where do you live?
Country <input type="text" name="address_country">
City <input type="text" name="city">
Other address information (street, postal code, state/province)
<input type="text" name="address_1">
<input type="text" name="address_2">
<input type="text" name="address_3">

<p>Telephone
<br>Country code <input type="text" name="tel_country_code" value="+">
<br>Telephone number <input type="text" name="telephone_1">
<br>Other telephone <input type="text" name="telephone_2">

<p>Do you have a website? Blog? <input type="text" name="website">
<br>Do you have other sites? <input type="text" name="website_other">

<p>Do you use instant messaging? What kind?
<select name="messenger_type">
 	<option>MSN</option>
	<option>Yahoo</option>
	<option>AIM</option>
	<option>ICQ</option>
 </select>
<br>What is your messenger ID? <input type="text" name="messenger">
Any other messaging info: <input type="text" name="messenger_other">

<p>Add here any information you wish (255 chars)
<textarea height=100 width=400 name="other_profile_info">
</textarea>

<input type="submit">
</form>
</body>
</html>
