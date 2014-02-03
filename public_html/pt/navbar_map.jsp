<%
	String context = "/pt";
	if (!request.getServletPath().endsWith("pt/navbar.jsp")) {
		context = "..";
	}
%>
<map name="livros">
  <area shape="rect" coords="0,58,119,80" 
  		href="<%=context %>/paraiso/paraiso.html" 
  		alt="Paraíso" 
		onmouseover="acende('paraiso')" 
		onmouseout="apaga('<%=context %>/<%=img_livro %>.gif')" 
		target="_top">
		
  <area shape="rect" coords="0,35,119,58" 
  		href="<%=context %>/purgatorio/purgatorio.html" 
		alt="Purgatório" 
		onmouseover="acende('purgato')" 
		onmouseout="apaga('<%=context %>/<%=img_livro %>.gif')" 
		target="_top">
		
  <area shape="rect" coords="0,0,119,34" 
  		href="<%=context %>/inferno/inferno.html" 
		alt="Inferno" 
		onmouseover="acende('inferno')" 
		onmouseout="apaga('<%=context %>/<%=img_livro %>.gif')" 
		target="_top">
</map>
