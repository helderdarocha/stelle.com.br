<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
	<TITLE>Barra Nav Figuras</TITLE>
<STYLE>
	BODY {background-color: rgb(20%,0%,0%); color: rgb(100%,90%,0%);
              background-image: url(../../imagens/inf_back_bar.jpg)}
	BODY, P, TD {font-family: tahoma, sans-serif; font-size: 12px; color: rgb(100%,90%,0%);}
	A:link {color: rgb(100%,90%,0%); font-weight: bold; text-decoration: none}
	A:visited {color: orange; font-weight: bold; text-decoration: none}
	P {text-align: center;}
	P.ref {line-height: 100%; margin-top: 7px; margin-bottom: 7px;
	        padding: 1px; border-style: outset; border-width: 1px; border-color: brown;
			background-color: rgb(25%,10%,10%); width: 100%;}
	A.mainlink:visited {color: rgb(100%,90%,0%); text-decoration: none}
	.marc {font-size: 11px; text-align: right; line-height: 100%; font-family: tahoma, sans-serif}
	a:hover {color: rgb(100%,100%,0%);}
	</STYLE>
    <script src="../navbar.js"></script>
	<script>
	if(navigator.appName != "Netscape") {
		document.write("<STYLE>TABLE.ref TD {line-height: 100%; margin-top: 7px; margin-bottom: 7px; padding: 1px; border-style: outset; border-width: 1px; border-color: brown; background-color: rgb(25%,10%,10%);}</STYLE>");
	}
	</script>
	<script> <!--
	if (document.cookie) {
	    str = document.cookie;
	    ini = str.indexOf("nav");
	    menutype = str.substring(ini+4, ini+7);  // pegar cookie tipo de menu
		if (menutype == "img") {
		    location.href="navbar3_tv.jsp";
		}
	}
	var ie4 = ver5 = false;
	document.cookie = "nav=txt";  // menu com texto � default
	if (navigator.appName == "Microsoft Internet Explorer" && parseInt(navigator.appVersion) >= 4) {
		ie4 = true;
	}
    if (parseInt(navigator.appVersion) >= 5) {
		ver5 = true;
	}
	function flutuar() {
		open("navbar3f.html", "nav_img", "height=480,width=150,resizable,scrollbars");
		url = parent.comedia.document.location;
		parent.name = "imagens";
		parent.location.href = url;
	}
	//--></script>
	<BASE TARGET="comedia">
</HEAD>

<BODY onload="loadImages('../inf.gif','../pur.gif','../par.gif'); checkRef()" bgcolor="400000" text="white" link="yellow" vlink="orange">
<div align=center>
<P style="text-align:center"><A class="mainlink" HREF="../../index.html" target="_top"><img src="../../imagens/homeicon.gif" width=120 height=41 border="0" alt="Volta para a p�gina principal"></A><br>
<p><img src="../inf.gif" width=120 height=81 border=0 usemap="#livros" name="tomos" alt="Escolha um livro">
</div>

<script><!--
	if (ie4 || ver5) {
		document.write("<p class=ref><a href='javascript:void(0)' onclick='flutuar()'>Menu<br>flutuante</a></p>");
	}
//--></script>
<p class=ref><a href="navbar3_tv.jsp" target="_self">Menu com<br>imagens</a></p>
<DIV style="text-align:center">
<P style="text-align:center; line-height: 200%"><B>DESENHOS</B><br>
<table border="1" cellspacing=0 cellpadding=2 class=ref>
<tr><td><A HREF="dore2.html">Selva escura</A></td></tr>
<tr><td><A HREF="helder1.html">Portal (1)</A></td></tr>
<tr><td><A HREF="blake1.html">Portal (2)</A></td></tr>
<tr><td><A HREF="rodin1.html">Portal (3)</A></td></tr>
<tr><td><A HREF="dore3.html">Limbo</A></td></tr>
<tr><td><A HREF="dore4.html">Lux�ria (1)</A></td></tr>
<tr><td><A HREF="blake2.html">Lux�ria (2)</A></td></tr>
<tr><td><A HREF="rossetti1.html">Lux�ria (3)</A></td></tr>
<tr><td><A HREF="feuerbach.html">Lux�ria (4)</A></td></tr>
<tr><td><A HREF="dore5.html">Rio Estige (1)</A></td></tr>
<tr><td><A HREF="delacroix.html">Rio Estige (2)</A></td></tr>
<tr><td><A HREF="dore6.html">Her�ticos</A></td></tr>
<tr><td><A HREF="dore7.html">Rio de sangue</A></td></tr>
<tr><td><A HREF="dore8.html">Suicidas</A></td></tr>
<tr><td><A HREF="dore9.html">Blasfemos</A></td></tr>
<tr><td><a href="helder2.html">Geri�n (1)</a></td></tr>
<tr><td><A HREF="dore10.html">Geri�n (2)</A></td></tr>
<tr><td><A HREF="botticelli2.html">Sedutores</A></td></tr>
<tr><td><A HREF="dore11.html">Simon�acos</A></td></tr>
<tr><td><A HREF="dore12.html">Fuga dos diabos</A></td></tr>
<tr><td><A HREF="dore13.html">Ladr�es</A></td></tr>
<tr><td><A HREF="botticelli3.html">Maus conselheiros</A></td></tr>
<tr><td><A HREF="dore14.html">Bertran de Born</A></td></tr>
<tr><td><A HREF="dore15.html">Anteu</A></td></tr>
<tr><td><A HREF="dore16.html">Antenora</A></td></tr>
<tr><td><A HREF="vellutello.html">L�cifer</A></td></tr></table> 

</p><p style="text-align:center; line-height: 200%"><B>MAPAS</B><br>
<table border="1" cellspacing=0 cellpadding=2 class=ref>
<tr><td><A HREF="botticelli1.html">Inferno (1)</A></td></tr>
<tr><td><A HREF="mapa6.html">Inferno (2)</A></td></tr> 
<tr><td><A HREF="bartolomeo.html">Inferno (3)</A></td></tr> 
<tr><td><A HREF="mapa1.html">Inferno Superior</A></td></tr>
<tr><td><A HREF="mapa2.html">Cidade de Dite</A></td></tr>
<tr><td><A HREF="mapa7.html">S�timo c�rculo</A></td></tr>
<tr><td><A HREF="mapa3.html">Malebolge</A></td></tr>
<tr><td><A HREF="mapa4.html">Lago C�cito</A></td></tr>
<tr><td><A HREF="mapa5.html">Terra e Inferno</A></td></tr></table></p></DIV>

<p style="font-size: 11px; text-align: center">Copyright &copy 1999<br>Helder da Rocha</p>


<% String img_livro="inf"; %>
<%@include file="../navbar_map.jsp" %><map name="livros">

</BODY>
</HTML>
