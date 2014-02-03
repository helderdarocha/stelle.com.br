<!-- This document was created with HomeSite 2.5 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
	<TITLE>Barra de Navegação</TITLE>
	<link rel="stylesheet" type="text/css" href="navbar.css">
	<script src="navbar.js"></script>
	<script src="enviar.js"></script>
	<script src="quest.js"></script>
	<BASE TARGET="comedia">
</HEAD>

<BODY onload="loadImages();checkRef()" bgcolor="400000" text="white" link="yellow" vlink="orange">
<P style="text-align:center"><A class="mainlink" HREF="../../../index.html" target="_top"><img src="../../../imagens/homeicon.gif" width=120 height=41 border="0" alt="Volta para a página principal"></A><br>
  <A class="mainlink" HREF="index.html" onmouseover="acende()" onmouseout="apaga()"><img src="../../../imagens/infhome.gif" width=74 height=30 alt="Página inicial do Inferno" border="0" name="infhome"></A></P>

  	<script>
	if (getCookieV1('marcada') != "dead" && getCookieV1('marcada') != "") {
		document.write("<div align=center><table cellspacing=0 cellpadding=0 border=0><tr><td align=right>");
	    page = getCookieV1('nomearq').split("|"); cor="255,255,128";
		if (page[0].toLowerCase() == "inferno") {cor = "100%,80%,70%";}
		else if (page[0].toLowerCase() == "purgatorio") {cor = "80%,100%,70%";}
		else {cor = "80%,80%,100%";}
		document.write("<p class=marc><a href='javascript:tiraMarca()' target='_self'>Página<br>marcada</a></p></td><td>&nbsp;</td>");
		document.write("<td style='background-color: rgb("+cor+"); border-style: outset; border-color: rgb("+cor+"); border-width: 1px'><a href='javascript:tiraMarca()' target='_self'><img src='/pt/" + page[0].toLowerCase()+ "/bookmark.gif' width=18 height=30 alt='Continuar leitura de " + page[0] + ": " + page[1] + " " + page[2] + "' border=0>");
		document.write("</a></td></tr></table></div>");
	} 
	</script>

	<p><img src="../../../imagens/grpixel.gif" width=120 height="1" alt="----------------" border=0></p>
<P class=ref><A HREF="index.jsp">Índice</A></P>
<form method=POST action="/servlet/stelle.testes.AvaliacaoServlet">
<input type="Hidden" name="respostas">
<input type="Hidden" name="grupo">
<input type="Hidden" name="livro" value="inferno">
<input type="Hidden" name="docbase" value="/pt/inferno/">
<input type="Hidden" name="siteroot" value="/">
<input type="Hidden" name="pag_erro" value="/pt/inferno/teste/erro.html">
<input type="Hidden" name="redirect" value="/pt/inferno/teste/resposta.html">
<table border=1 class=result cellpadding=1 cellspacing=0 align=center>
<script>
grpnum = parent.comedia.grupo;
for (i = ((grpnum - 1)*10 + 1); i <= (grpnum * 10); i++) {
    j = "";
    if (i < 10) j = "0"+i;
	else j = "" + i;
    document.write("<tr><td align=center><a href=\"q.jsp?q="+i+"\">Questão "+j+"</a></td>");
    document.write("<td class=resposta width=30 align=center>");
    prtMk(i,"dante" + grpnum);
    document.write("</td></tr>");
}
</script>
</table>
<table width=100% align=center border=0>
<script>
nota = getCookie("nota" + grpnum);
dante = getCookie("dante" + grpnum);

if (nota == null && dante != null) {
	document.write("<tr><td colspan=2 align=center><input type=button onclick=\"enviar(this.form, 'dante'+grpnum)\" value=\"Enviar\"></td></tr>");
} else if (nota != null){
	document.write("<tr><td colspan=2 align=center class=ans>Você acertou "+ nota +"/10<br><input type=button onclick=\"esvaziar(this.form, grpnum)\" value=\"Limpar\"></td></tr>");
} 
</script>
</tr></table>
</form>
<p style="font-size: 11px">Copyright &copy 1999<br>Helder da Rocha</p>

</BODY>
</HTML>
