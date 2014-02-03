<!-- This document was created with HomeSite 2.5 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
	<TITLE>Barra de Navegação</TITLE>
	<STYLE>
	BODY {background-color: rgb(0%,0%,0%); color: rgb(90%,100%,0%);
              background-image: url(../../imagens/pur_back_bar.jpg)}
	BODY, P, TD {font-family: tahoma, sans-serif; font-size: 12px; color: rgb(90%,100%,0%);}
	A:link {color: rgb(50%,80%,0%); font-weight: bold; text-decoration: none}
	A:visited {color: rgb(50%,80%,0%); font-weight: bold; text-decoration: none}
	P {text-align: center}
	P.ref {line-height: 100%; margin-top: 7px; margin-bottom: 7px;
	        padding: 1px; border-style: outset; border-width: 1px; border-color: green;
			background-color: rgb(10%,25%,10%); width: 100%}
	A.mainlink:visited {color: rgb(90%,100%,0%); text-decoration: none}
	.marc {font-size: 11px; text-align: right; line-height: 100%; font-family: tahoma, sans-serif}
	a:hover {color: rgb(100%,100%,70%);}
	</STYLE>
    <script src="../navbar.js"></script>
	<BASE TARGET="comedia">
</HEAD>

<BODY onload="loadImages('../inf.gif','../pur.gif','../par.gif'); checkRef()" bgcolor="400000" text="white" link="yellow" vlink="orange">
<div align=center>
<P style="text-align:center"><A class="mainlink" HREF="../../index.html" target="_top"><img src="../../imagens/homeicon.gif" width=120 height=41 border="0" alt="Volta para a página principal"></A></p>
<p><img src="../pur.gif" width=120 height=81 border=0 usemap="#livros" name="tomos" alt="Escolha um livro">
</div>

	<script>
	if (getCookie('marcada') != "dead" && getCookie('marcada') != "") {
		document.write("<p><div align=center><table cellspacing=0 cellpadding=0 border=0><tr><td align=right>");
	    page = getCookie('nomearq').split("|"); cor="255,255,128";
		if (page[0].toLowerCase() == "inferno") {cor = "100%,80%,70%";}
		else if (page[0].toLowerCase() == "purgatorio") {cor = "80%,100%,70%";}
		else {cor = "80%,80%,100%";}
		document.write("<p class=marc><a href='javascript:tiraMarca()' target='_self'>Página<br>marcada</a></p></td><td>&nbsp;</td>");
		document.write("<td style='background-color: rgb("+cor+"); border-style: outset; border-color: rgb("+cor+"); border-width: 1px'><a href='javascript:tiraMarca()' target='_self'><img src='/pt/" + page[0].toLowerCase()+ "/bookmark.gif' width=18 height=30 alt='Continuar leitura de " + page[0] + ": " + page[1] + " " + page[2] + "' border=0>");
		document.write("</a></td></tr></table></div></p>");
	} 
	</script>

<P class=ref><A HREF="intro.html">Introdução</A></P>
<P class=ref><A HREF="portal.html" title="Comece aqui a leitura de Purgatório">Canto 1 (início)</A></P>
<P class=ref><A HREF="cantos.html" title="Índice de Cantos">Índice<br></A></P>
<P class=ref><A HREF="estrutura.html" title="Esquema do Purgatório">Estrutura</A></P>
<p class=ref><a href="cantos_orig.html" title="Índice de Cantos em Italiano">Poema original</a></p>

<P class=ref><A HREF="imagens.html" title="Ilustrações e mapas">Imagens</A></P>
<P class=ref><A HREF="glossario.html">Glossário e Busca</A></P>
<P class=ref><A HREF="teste/index.jsp">Testes</A></P>
<!--<P class=ref><A HREF="referencias.html">Referências</A></P> 
--> 

<p style="font-size: 11px">Copyright &copy 1999<br>Helder da Rocha</p>

<% String img_livro="pur"; %>
<%@include file="../navbar_map.jsp" %> 

</BODY>
</HTML>
