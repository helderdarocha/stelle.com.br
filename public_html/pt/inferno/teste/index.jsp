<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
<head>
	<title>A Divina Com�dia: Inferno - Testes</title>
    <style>
    input {background: rgb(60%,40%,20%);
    	  font: bold 10pt sans-serif;
          color: white;}
    </style>
    <script type="text/javascript" language="JavaScript" 
            src="quest.js"></script>
	<script type="text/javascript" language="JavaScript" 
            src="enviar.js"></script>
    <script>
	root = "/";
    doc = root + "pt/inferno/teste/index.jsp";
 
	if (parent.nav) {
		parent.nav.location.href=root+"pt/inferno/navbar.jsp";
	}
    
	if (!parent.comedia) {
        document.cookie="menu_imagem=" + escape(doc) + "; path="+root+"pt/inferno/";
		location.href=root+"pt/inferno/inferno.html";
	}
	</script>
    <style>
    td.resposta {text-align: center}
    </style>
    <link rel="stylesheet" type="text/css" href="../cantos.css">
</head>

<body>
<script>
browmsg = "ADVERT�NCIA: Esta aplica��o utiliza recursos que s� est�o dispon�veis em navegadores Internet Explorer 4.0 em diante e Netscape Navigator 4.05 em diante. Voc� est� utilizando uma vers�o mais antiga, o que poder� provocar ERROS no programa e no seu navegador!";
brow = navigator.appName;
vers = parseFloat(navigator.appVersion);
if (((brow.indexOf("Microsoft") >= 0) && vers >= 4) || ((brow.indexOf("Netscape") >= 0) && vers >= 4.05)) { 
    ;
} else {
    alert(browmsg);
}
</script>

<TABLE WIDTH=450><TR><TD>
<P class=minimenu><table width=100% cellspacing=0 cellpadding=0 border=0>
<tr><td align=left><A HREF="../index.html">Inferno (p�gina principal)</A></td>
<script>
   if (!parent.nav) {
    s = "<td class='minimenu'><a href='../inferno.html' target='_top' onclick=\"javascript:document.cookie='menu_imagem=' + doc\">Recuperar barra de navega��o</a></td>";
	document.write(s);
   }
   </script>
</tr></table><hr><p></P>
<h1>Testes sobre o Inferno
</h1>
<p class=primeiro>Fazendo os testes de m�ltipla escolha dispon�veis neste <em>site</em>, voc� poder� testar seus conhecimentos sobre o <em>Inferno</em> de Dante e recordar a sua viagem. 
<p>S�o tr�s grupos de 10 quest�es cada. Ao terminar cada grupo voc� poder� obter uma nota parcial e saber quais quest�es voc� acertou. � medida em que voc� for marcando o teste, uma tabela aparecer� nesta p�gina com as op��es escolhidas. 
<p>Voc� pode come�ar os testes e termin�-los depois (dentro de 30 dias) desde que utilize o mesmo navegador. 

<p align=center style="text-align:center; text-indent: 0px; margin-top: 1cm; margin-bottom: 1cm; font-size: 13pt">
<a href="#t1">Teste 1</a> | <a href="#t2">Teste 2</a> | <a href="#t3">Teste 3</a>
</p>

<form method=POST action="/servlet/stelle.testes.AvaliacaoServlet">
<input type="Hidden" name="respostas">
<input type="Hidden" name="grupo">
<input type="Hidden" name="livro" value="inferno">
<input type="Hidden" name="docbase" value="/pt/inferno/">
<input type="Hidden" name="siteroot" value="/">
<input type="Hidden" name="pag_erro" value="/pt/inferno/teste/erro.html">
<input type="Hidden" name="redirect" value="/pt/inferno/teste/resposta.html">
<h2><a name=t1></a>Teste 1</h2>
  <table border=1 class=result cellpadding=1 cellspacing=0 align=center>
<script>
nota1 = getCookie("nota1");
dante1 = getCookie("dante1");
if (dante1 != null) {
    document.write("<tr><td>&nbsp;Quest�o&nbsp;</td><td>&nbsp;Resposta&nbsp;</td><td>&nbsp;Voc� marcou&nbsp;</td></tr>");
   for (i = 1; i <= 10; i++) {
      document.write("<tr><td align=center><a href=\"q.jsp?q="+i+"\">"+i+"</a></td>");
      prtSolTab(i, "gab1"); 
      prtMkTab(i,"dante1");
      document.write("</tr>");
   }
}
if (nota1 == null && dante1 != null) {
	document.write("<tr><td colspan=3 align=center><input type=button onclick=\"enviar(this.form, 'dante1')\" value=\"Enviar\"></td></tr>");
} else if (nota1 != null){
	document.write("<tr><td colspan=3 align=center>Voc� acertou "+ nota1 +"/10<br><input type=button onclick=\"esvaziar(this.form, 1)\" value=\"Limpar teste\"></td></tr>");
} else {
    document.write("<tr><td colspan=3 align=center><a href=\"q.jsp?q=1\">Fa�a este teste!</a></td></tr>");
} 
</script>
</table>
<h2><a name=t2></a>Teste 2</h2>
  <table border=1 class=result cellpadding=1 cellspacing=0 align=center>
<script>
nota2 = getCookie("nota2");
dante2 = getCookie("dante2");
if (dante2 != null) {
    document.write("<tr><td>&nbsp;Quest�o&nbsp;</td><td>&nbsp;Resposta&nbsp;</td><td>&nbsp;Voc� marcou&nbsp;</td></tr>");
   for (i = 11; i <= 20; i++) {
      document.write("<tr><td align=center><a href=\"q.jsp?q="+i+"\">"+i+"</a></td>");
      prtSolTab(i, "gab2"); 
      prtMkTab(i,"dante2");
      document.write("</tr>");
   }
}
if (nota2 == null && dante2 != null) {
	document.write("<tr><td colspan=3 align=center><input type=button onclick=\"enviar(this.form, 'dante2')\" value=\"Enviar\"></td></tr>");
} else if (nota2 != null){
	document.write("<tr><td colspan=3 align=center>Voc� acertou "+ nota2 +"/10<br><input type=button onclick=\"esvaziar(this.form, 2)\" value=\"Limpar teste\"></td></tr>");
} else {
    document.write("<tr><td colspan=3 align=center><a href=\"q.jsp?q=11\">Fa�a este teste!</a></td></tr>");
}
</script>
</table>

<h2><a name=t3></a>Teste 3</h2>
  <table border=1 class=result cellpadding=1 cellspacing=0 align=center>
<script>
nota3 = getCookie("nota3");
dante3 = getCookie("dante3");
if (dante3 != null) {
    document.write("<tr><td>&nbsp;Quest�o&nbsp;</td><td>&nbsp;Resposta&nbsp;</td><td>&nbsp;Voc� marcou&nbsp;</td></tr>");
   for (i = 21; i <= 30; i++) {
   	  document.write("<tr><td align=center><a href=\"q.jsp?q="+i+"\">"+i+"</a></td>");
      prtSolTab(i, "gab3"); 
      prtMkTab(i,"dante3");
      document.write("</tr>");
   }
}
if (nota3 == null && dante3 != null) {
	document.write("<tr><td colspan=3 align=center><input type=button onclick=\"enviar(this.form, 'dante3')\" value=\"Enviar\"></td></tr>");
} else if (nota3 != null){
	document.write("<tr><td colspan=3 align=center>Voc� acertou "+ nota3 +"/10<br><input type=button onclick=\"esvaziar(this.form, 3)\" value=\"Limpar teste\"></td></tr>");
} else {
    document.write("<tr><td colspan=3 align=center><a href=\"q.jsp?q=21\">Fa�a este teste!</a></td></tr>");
}
</script>
</table>
</form>

<P class=minimenu><hr><table width=100% cellspacing=0 cellpadding=0 border=0>
<tr><td align=left><A HREF="../index.html">Inferno (p�gina principal)</A></td></tr></table><p></P>
</TD></TR></TABLE>
</body>
</html>
