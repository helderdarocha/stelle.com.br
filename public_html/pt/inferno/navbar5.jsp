<!-- This document was created with HomeSite 2.5 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
	<TITLE>Barra de Navegação</TITLE>
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
	select, option {background: rgb(20%,0%,0%); color: rgb(100%,90%,0%);}
	</STYLE>
	<script src="../navbar.js"></script>
    <script>
	function setnav() {
		document.sel.originais.selectedIndex = eval(parent.comedia.canto);
	}
	//--></script>
</HEAD>
<BODY onload="loadImages('../inf.gif','../pur.gif','../par.gif'); setnav(); checkRef()" bgcolor="400000" text="white" link="yellow" vlink="orange">
<div align=center>
<P style="text-align:center"><A class="mainlink" HREF="../../index.html" target="_top"><img src="../../imagens/homeicon.gif" width=120 height=41 border="0" alt="Volta para a página principal"></A><br>
<p><img src="../inf.gif" width=120 height=81 border=0 usemap="#livros" name="tomos" alt="Escolha um livro">
</div>

<DIV  style="text-align:center"><P>
<form name=sel>
<p style="text-align:center"><b>POEMA ORIGINAL</b></p>
<p style="text-align:center">
<select onchange="parent.comedia.location.href=this.options[this.selectedIndex].value" name=originais>
<OPTION VALUE="javascript:void(0)">Exibir ...</OPTION>
<OPTION VALUE="inferno_1.html">Canto I</OPTION>
<OPTION VALUE="inferno_2.html">Canto II</OPTION>
<OPTION VALUE="inferno_3.html">Canto III</OPTION> 
<OPTION VALUE="inferno_4.html">Canto IV</OPTION>
<OPTION VALUE="inferno_5.html">Canto V</OPTION>
<OPTION VALUE="inferno_6.html">Canto VI</OPTION>
<OPTION VALUE="inferno_7.html">Canto VII</OPTION>
<OPTION VALUE="inferno_8.html">Canto VIII</OPTION>
<OPTION VALUE="inferno_9.html">Canto IX</OPTION>
<OPTION VALUE="inferno_10.html">Canto X</OPTION>
<OPTION VALUE="inferno_11.html">Canto XI</OPTION>
<OPTION VALUE="inferno_12.html">Canto XII</OPTION>
<OPTION VALUE="inferno_13.html">Canto XIII</OPTION>
<OPTION VALUE="inferno_14.html">Canto XIV</OPTION>
<OPTION VALUE="inferno_15.html">Canto XV</OPTION>
<OPTION VALUE="inferno_16.html">Canto XVI</OPTION>
<OPTION VALUE="inferno_17.html">Canto XVII</OPTION>
<OPTION VALUE="inferno_18.html">Canto XVIII</OPTION>
<OPTION VALUE="inferno_19.html">Canto XIX</OPTION>
<OPTION VALUE="inferno_20.html">Canto XX</OPTION>
<OPTION VALUE="inferno_21.html">Canto XXI</OPTION>
<OPTION VALUE="inferno_22.html">Canto XXII</OPTION>
<OPTION VALUE="inferno_23.html">Canto XXIII</OPTION>
<OPTION VALUE="inferno_24.html">Canto XXIV</OPTION>
<OPTION VALUE="inferno_25.html">Canto XXV</OPTION>
<OPTION VALUE="inferno_26.html">Canto XXVI</OPTION>
<OPTION VALUE="inferno_27.html">Canto XXVII</OPTION>
<OPTION VALUE="inferno_28.html">Canto XXVIII</OPTION>
<OPTION VALUE="inferno_29.html">Canto XXIX</OPTION>
<OPTION VALUE="inferno_30.html">Canto XXX</OPTION>
<OPTION VALUE="inferno_31.html">Canto XXXI</OPTION>
<OPTION VALUE="inferno_32.html">Canto XXXII</OPTION>
<OPTION VALUE="inferno_33.html">Canto XXXIII</OPTION>
<OPTION VALUE="inferno_34.html">Canto XXXIV</OPTION>
</select></p>
<P class="ref"><A HREF="javascript: open('notas_' + eval(parent.comedia.canto) + '.html', 'comedia')">Notas<br>explicativas</A></P>
<P class="ref"><A HREF="javascript: open('canto_' + eval(parent.comedia.canto) + '.html', 'comedia')">Texto<br>em prosa</A></P>
</form>

<% String img_livro="inf"; %>
<%@include file="../navbar_map.jsp" %><map name="livros">

</BODY>
</HTML>
