<% 
	final String RAIZ = "/WEB-INF/questoes/inferno";

	String qstr = request.getParameter("q");
	int questao = Integer.parseInt(qstr);
	char letra = 'a';
	int fim = (int)Math.ceil( (float)(questao) / 10) * 10;
	int inicio = fim - 9;
	int grupo = fim / 10;
	String[] nb = {"a","b","c"};
	
	int prox = (questao == fim) ? inicio : questao + 1;
	int ante = (questao == inicio) ? fim : questao - 1;
	
    java.io.InputStream stream = application.getResourceAsStream(RAIZ + "/" + questao + ".xml");
	stelle.testes.Questao q = new stelle.testes.Questao(questao, stream);
	String enunciado = q.getEnunciado();
	String resposta  = q.getResposta();    
	stelle.testes.Alternativa[] alternativas = q.getAlternativas();
    String prim_linha = "<td rowspan=99>&nbsp;</td>"; 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>A Divina Comédia: Inferno - Testes</title>
	<script><!--
	grupo = <%=grupo %>;
	if (parent.nav) {
		parent.nav.location.href="navbar6.jsp";
	}
	//--></script>    
	<script type="text/javascript" language="JavaScript" src="quest.js"></script>
    <script>
    qst = <%=questao %>; grp = <%=grupo %>;
    user = getMark(qst, "dante"+grp);
    gaba = getMark(qst, "gab"+grp);
    op = new Object();
    op["a"] = op["b"] = op["c"] = op["d"] = op["e"] = "&nbsp";
    if (user == gaba) {
        op[user] = "<img src='chk.gif' width=12 height=12 alt='alternativa certa!'>";
    } else {
        op[user] = "<img src='eks.gif' width=12 height=12 alt='alternativa errada!'>";
        op[gaba] = "<img src='chk.gif' width=12 height=12 alt='alternativa certa!'>";
    }
    document.write("<style>#op"+gaba+", #alt"+gaba+" {color: maroon; font-weight: bold}</style>");
    </script>
	<link rel="stylesheet" type="text/css" href="questoes.css">
</head>

<body><div class=body>
<div class=helder>
<table border=0 width=450 align=center cellspacing=0 cellpadding=0><tr>
<td align=left width=33%><a title="Índice dos testes" href="/pt/inferno/teste/index.jsp">Índice</a></td>
<td align=right width=33%><a title="Página do Inferno" href="/pt/inferno/index.html">Sair</a></td></tr></table>
</div>

<h1>A Divina Comédia: O Inferno</h1>
<h2>Solução dos testes</h2>

<!-- inserir questao aqui -->

<table border=0 width=450 cellpadding=0 cellspacing=0>
<tr valign=top><td>
<%=questao %>.</td>
<td class=quest colspan=3> <%=enunciado %>
<%
   for (int i = 0; i < alternativas.length; i++) {
%>
	</td></tr>
	<tr valign=top><%=(i==0)?prim_linha:""%>
	<td width=50><script>document.write(op["<%=(char)(letra + i) %>"]);</script></td><td id=alt<%=(char)(letra + i) %>><%=(char)(letra + i) %>)&nbsp;</td>
	<td class=alter valign=middle width=100% id=op<%=(char)(letra + i) %>><%=alternativas[i].getTexto() %>
<% } %>

</td></tr>
</table>

<hr>
<p class=livro> 
<script>
if (user != null) {
    document.write("Você marcou a letra <b>("+user+")</b>. ");
} else {
    document.write("Você deixou esta questão <strong>em branco</strong>. ");
}
if (user == gaba) {
    document.write("Você acertou!");
} else {
    document.write("A resposta correta é <b>(" + gaba + ")</b>. "); 
}
</script>

<%=resposta %>

<p align=center>
<% if (questao != inicio) { %>
<a href="javascript: document.location = 'r.jsp?q='+<%=ante %>">Anterior</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<% } %>
<a href="index.jsp#t1">Voltar para o índice</a>
<% if (questao != fim) { %>
&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="javascript: document.location = 'r.jsp?q='+<%=prox %>">Próximo</a></p>
<% } %>
<address>
<p class=helder style="color: gray; text-align: right; font-size: 9pt">&copy 2000 <a href="/helder/index.html" target="_top">Helder L. S. da Rocha</a>
</address>
</div></body>
</html>