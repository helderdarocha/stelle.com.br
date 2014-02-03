<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
	<TITLE>Barra Nav Figuras</TITLE>
	<STYLE>
	BODY {background-color: rgb(0%,20%,0%); color: rgb(90%,100%,0%);
              background-image: url(../../imagens/pur_back_bar.jpg)}
	BODY, P, TD {font-family: tahoma, sans-serif; font-size: 12px; color: rgb(90%,100%,0%);}
	A:link {color: rgb(90%,100%,0%); font-weight: bold; text-decoration: none}
	A:visited {color: rgb(50%,100%,0%); font-weight: bold; text-decoration: none}
	P {text-align: center}
	P.ref {line-height: 100%; margin-top: 7px; margin-bottom: 7px;
	        padding: 1px; border-style: outset; border-width: 1px; border-color: green;
			background-color: rgb(10%,25%,10%); width: 100%}
	A.mainlink:visited {color: rgb(90%,100%,0%); text-decoration: none}
	.marc {font-size: 11px; text-align: right; line-height: 100%; font-family: tahoma, sans-serif}
	a:hover {color: rgb(100%,100%,70%);}
	select, option {background: rgb(0%,20%,0%); color: rgb(90%,100%,0%);}
	</STYLE>
    <script src="../navbar.js"></script>
	<script>
	if(navigator.appName != "Netscape") {
		document.write("<STYLE>TABLE.ref TD {line-height: 100%; margin-top: 7px; margin-bottom: 7px;padding: 1px; border-style: outset; border-width: 1px; border-color: green;background-color: rgb(10%,25%,10%);}</STYLE>");
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
	document.cookie = "nav=txt";  // menu com texto é default
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
<P style="text-align:center"><A class="mainlink" HREF="../../index.html" target="_top"><img src="../../imagens/homeicon.gif" width=120 height=41 border="0" alt="Volta para a página principal"></A><br>
<p><img src="../pur.gif" width=120 height=81 border=0 usemap="#livros" name="tomos" alt="Escolha um livro">
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
<tr><td><a href="mapa1.html">O Purgatório</a></td></tr>
<tr><td><a href="mapa2.html">Relógio de Dante</a></td></tr>
<tr><td><A HREF="dore17.html">Catão</A></td></tr>
<tr><td><a href="dore33.html">O barqueiro</a></td></tr>
<tr><td><A HREF="dore18.html">Excomungados</A></td></tr>
<tr><td><a href="dore26.html">Vale dos Príncipes</a></td></tr>
<tr><td><A HREF="dore19.html">Sonho da águia</A></td></tr>
<tr><td><a href="dore28.html">Porta de São Pedro</a></td></tr>
<tr><td><A HREF="dore20.html">Orgulhosos</A></td></tr>
<tr><td><A HREF="dore21.html">Invejosos</A></td></tr>
<tr><td><A HREF="dore22.html">Iracundos</A></td></tr>
<tr><td><a href="dore27.html">Preguiçosos</a></td></tr>
<tr><td><A HREF="dore23.html">Avarentos</A></td></tr>
<tr><td><A HREF="dore24.html">Gulosos</A></td></tr>
<tr><td><a href="dore32.html">Luxuriosos</a></td></tr>
<tr><td><A HREF="dore25.html">Paraíso Terrestre</A></td></tr>
<tr><td><a href="dore29.html">A procissão</a></td></tr>
<tr><td><a href="dore30.html">O gigante e a prostituta</a></td></tr>
<tr><td><a href="dore31.html">O rio Eunoé</a></td></tr>
</table></p></DIV>

<p style="font-size: 11px; text-align: center">Copyright &copy 1999<br>Helder da Rocha</p>

<% String img_livro="pur"; %>
<%@include file="../navbar_map.jsp" %><map name="livros">

</BODY>
</HTML>
