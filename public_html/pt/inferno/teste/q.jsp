<% 
	final String RAIZ = "/WEB-INF/questoes/inferno";
	int MAX = 30;
	String qstr = request.getParameter("q");
	int questao = Integer.parseInt(qstr);
	char letra = 'a';
	int fim = (int)Math.ceil( (float)(questao) / 10) * 10;
	int inicio = fim - 9;
	int grupo = fim / 10;
	String[] nb = {"a","b","c"};

    java.io.InputStream stream = application.getResourceAsStream(RAIZ + "/" + questao + ".xml");
	stelle.testes.Questao q = new stelle.testes.Questao(questao, stream);
	String enunciado =      q.getEnunciado();
	stelle.testes.Alternativa[] alternativas = q.getAlternativas();
    String prim_linha = "<td rowspan=99>&nbsp;</td>"; 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>A Divina Comédia: Inferno - Testes</title> 
	<script>
	grupo = <%=grupo %>;
	if (parent.nav) {
		parent.nav.location.href="navbar6.jsp";
	}
	</script>    
	<script type="text/javascript" language="JavaScript" src="quest.js"></script>
<% if (questao == fim) { %>
	<script type="text/javascript" language="JavaScript" src="enviar.js"></script>
<% } %>
	<link rel="stylesheet" type="text/css" href="questoes.css">
</head>

<body onload="check(<%=questao %>, document.forms[1].q, 'dante<%=grupo%>')"><div class=body>
<div class=helder>

<table border=0 width=450 align=center cellspacing=0 cellpadding=0><tr>
<td align=left width=33%><a title="Índice dos testes" href="index.jsp">Índice</a></td>
<td align=center width=34%><a title="Instruções sobre como usar esta aplicação" href="javascript: void(open('instrucoes.html','ajuda','width=450,height=400,scrollbars'))" style="font-weight: bold">Ajuda</a></td>
<td align=right width=33%><a title="Página do Inferno" href="../index.html">Sair</a></td></tr></table>
</div>
<form>
<h1>A Divina Comédia: O Inferno</h1>
<h2>Testes de múltipla escolha</h2>
<fieldset>
<legend align=right><p style="margin: 0px; text-indent: 0px; font: bold 9pt sans-serif">&nbsp;Questões <%=inicio %> a <%=fim %>&nbsp;</p></legend>
<table border=1 class=result cellpadding=0 cellspacing=0 width=450>
<tr>
<%
    for (int i = inicio; i <= fim; i++) {
		String num = i<10?"0"+i:""+i;
%>
	<td align=center bgcolor=white><a href="q.jsp?q=<%=i %>"><%=num%></a></td>
<% } %>
</tr>
<tr><script>prtMks(<%=inicio%>,<%=fim%>,"dante<%=grupo%>")</script>
</tr>
</table>
</fieldset>
</form>

<form method=POST action="/servlet/stelle.testes.AvaliacaoServlet">
<input type="Hidden" name="respostas">
<input type="Hidden" name="grupo">
<input type="Hidden" name="livro" value="inferno">
<input type="Hidden" name="docbase" value="/pt/inferno/">
<input type="Hidden" name="siteroot" value="/">
<input type="Hidden" name="pag_erro" value="/pt/inferno/teste/erro.html">
<input type="Hidden" name="redirect" value="/pt/inferno/teste/resposta.html">

<table border=0 width=450 cellpadding=0 cellspacing=0>
<tr valign=top><td>
<%=questao %>.</td>
<td class=quest colspan=3> <%=enunciado %>
<%
   for (int i = 0; i < alternativas.length; i++) {
%>
	</td></tr>
	<tr valign=top><%=(i==0)?prim_linha:""%>
	<td width=50><input type="radio" name="q" value="<%=(char)(letra + i) %>" title="Alternativa (<%=(char)(letra + i) %>)"></td><td><%=(char)(letra + i) %>)&nbsp;</td>
	<td class=alter valign=middle width="100%" ><%=alternativas[i].getTexto() %>
<% } %>

</td></tr>
</table>

<table border=0 width=450 class=botoes>
<tr>
<% if (questao == inicio && inicio != 1) { %>
<td align=right><input type=button value=" &lt;&lt;&lt; Teste No. <%=grupo - 1 %>" title="Retornar ao teste anterior"  style="background-color: maroon"
onclick="mark('dante<%=grupo%>', '<%=questao %>', this.form.q, -1)"></td>
<% } else if (questao != inicio) { %>
<td><input type=button value="&lt;&lt;&lt; Questão anterior"
onclick="mark('dante<%=grupo%>', '<%=questao %>', this.form.q, -1)"></td>
<% } %>
			   
<td align=center><input type=button value="Gravar" title="Gravar opção selecionada ou alteração"
     onclick="mark('dante<%=grupo%>', '<%=questao %>', this.form.q, 0)"></td>
	 
<% if (questao == fim) { %>
<td align=right width=33%><input type=submit title="Enviar este teste (questões <%=inicio %> a <%=fim %>)" value="E N V I A R" style="background-color: red"
onclick="mark('dante<%=grupo%>', '<%=questao %>', this.form.q, 255); enviar(this.form, 'dante<%=grupo%>')"></td>
	<% if (fim != MAX) { %>
<td align=right><input type=button value="Teste No. <%=grupo + 1 %> &gt;&gt;&gt;" title="Continuar (enviar respostas deste teste mais tarde)"  style="background-color: maroon"
onclick="mark('dante<%=grupo%>', '<%=questao %>', this.form.q, 1)"></td>
    <% } %>
<% } else if (questao != fim) { %>
<td align=right><input type=button value="Próxima questão &gt;&gt;&gt;"
onclick="mark('dante<%=grupo%>', '<%=questao %>', this.form.q, 1)"></td>
<% } %></tr></table>

</form>
<address>
<p class=helder style="color: gray; text-align: right; font-size: 9pt">&copy 2000 <a href="/helder/index.html" target="_top">Helder L. S. da Rocha</a>
</address>
</div></body>
</html>