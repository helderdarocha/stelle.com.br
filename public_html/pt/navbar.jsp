<!-- This document was created with HomeSite 2.5 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
	<TITLE>Barra de Navegação</TITLE>
	<STYLE>
	BODY {background-color: rgb(0%,0%,0%); color: rgb(90%,80%,0%);}
	BODY, P, TD {font-family: tahoma, sans-serif; font-size: 13px; color: rgb(90%,80%,0%);}
	A:link {color: rgb(90%,80%,0%); font-weight: bold; text-decoration: none}
	A:visited {color: rgb(60%,50%,0%); font-weight: bold; text-decoration: none}
	P {text-align: center}
	P.ref {line-height: 100%; margin-top: 7px; margin-bottom: 7px;
	        padding: 1px; border-style: outset; border-width: 1px; border-color: gray;
			background-color: rgb(10%,10%,10%); width: 100%}
	A.mainlink:visited {color: rgb(90%,80%,0%); text-decoration: none}
	.marc {font-size: 11px; text-align: right; line-height: 100%; font-family: tahoma, sans-serif}
	a:hover {color: rgb(100%,90%,0%);}
	</STYLE>
	<script src="navbar.js"></script>
	<BASE TARGET="comedia">
</HEAD>

<BODY bgcolor="black" text="white" link="yellow" vlink="orange" onload="loadImages('inf.gif','pur.gif','par.gif')"><div align=center>
<P style="text-align:center"><A class="mainlink" HREF="../index.html" target="_top" name="mainlink"><img src="../imagens/homeicon.gif" width=120 height=41 border="0" alt="Volta para
a página principal"></A></P>

	<script>
	if (getCookie('marcada') != "dead" && getCookie('marcada') != "") {
		document.write("<table cellspacing=0><tr><td align=right>");
	    page = getCookie('nomearq').split("|"); cor="255,255,128";
		if (page[0].toLowerCase() == "inferno") {cor = "100%,80%,70%";}
		else if (page[0].toLowerCase() == "purgatorio") {cor = "80%,100%,70%";}
		else {cor = "80%,80%,100%";}
		document.write("<p class=marc><a href='javascript:tiraMarca()' target='_self'>Página<br>marcada</a></p></td><td>&nbsp;</td>");
		document.write("<td style='background-color: rgb("+cor+"); border-style: outset; border-color: rgb("+cor+"); border-width: 1px'><a href='javascript:tiraMarca()' target='_self'><img src='" + page[0].toLowerCase()+ "/bookmark.gif' width=18 height=30 alt='Continuar leitura de " + page[0] + ": " + page[1] + " " + page[2] + "' border=0>");
		document.write("</a></td></tr></table>");
	} 
	</script>
</div>
<p><img src="../imagens/grpixel.gif" width=120 height="1" alt="----------------" border=0></p>
<P class=ref><A HREF="introducao.html">Introdução</A></P>
<P class=ref><A HREF="dante.html">Dante Alighieri</a></P>
<P class=ref><A HREF="comedia.html">Divina Comédia</A></P>
<P class=ref><A HREF="original.html">Poema original</A></P>
<P class=ref><A HREF="busca.html">Busca</A></P>
<P class=ref><A HREF="imagens.html">Imagens</A></P> 
<P class=ref><A HREF="referencias.html">Referências</A></P>
<P class=ref><A HREF="estudos.html">Estudos</A></P>
<p><img src="../imagens/grpixel.gif" width=120 height="1" alt="----------------" border=0></p>
<div align=center>
<img src="tomos.gif" width=120 height=81 border=0 usemap="#livros" name="tomos" alt="Escolha um livro">
</div>
<p><img src="../imagens/grpixel.gif" width=120 height="1" alt="----------------" border=0></p>
<p style="font-size: 11px">&copy 1999, 2000<br>Helder da Rocha</p>

<% String img_livro="tomos"; %>
<%@include file="navbar_map.jsp" %>

</BODY>
</HTML>
