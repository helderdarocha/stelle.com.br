<!-- This document was created with HomeSite 2.5 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
	<TITLE>Barra de Navegação</TITLE>
        <BASE TARGET="comedia">
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
	function setnav() {
		document.sel.originais.selectedIndex = eval(parent.comedia.canto);
	}
	//--></script>
</HEAD>
<BODY onload="loadImages('../inf.gif','../pur.gif','../par.gif'); setnav(); checkRef()" bgcolor="400000" text="white" link="yellow" vlink="orange">
<div align=center>
<P style="text-align:center"><A class="mainlink" HREF="../../index.html" target="_top"><img src="../../imagens/homeicon.gif" width=120 height=41 border="0" alt="Volta para a página principal"></A><br>
<p><img src="../pur.gif" width=120 height=81 border=0 usemap="#livros" name="tomos" alt="Escolha um livro">
</div>

<DIV  style="text-align:center"><P>
<form name=sel>
<p style="text-align:center"><b>POEMA ORIGINAL</b></p>
<p style="text-align:center">
<select onchange="parent.comedia.location.href=this.options[this.selectedIndex].value" name=originais>
<OPTION VALUE="javascript:void(0)">Exibir ...</OPTION>
<OPTION VALUE="purgatorio_1.html">Canto I</OPTION>
<OPTION VALUE="purgatorio_2.html">Canto II</OPTION>
<OPTION VALUE="purgatorio_3.html">Canto III</OPTION> 
<OPTION VALUE="purgatorio_4.html">Canto IV</OPTION>
<OPTION VALUE="purgatorio_5.html">Canto V</OPTION>
<OPTION VALUE="purgatorio_6.html">Canto VI</OPTION>
<OPTION VALUE="purgatorio_7.html">Canto VII</OPTION>
<OPTION VALUE="purgatorio_8.html">Canto VIII</OPTION>
<OPTION VALUE="purgatorio_9.html">Canto IX</OPTION>
<OPTION VALUE="purgatorio_10.html">Canto X</OPTION>
<OPTION VALUE="purgatorio_11.html">Canto XI</OPTION>
<OPTION VALUE="purgatorio_12.html">Canto XII</OPTION>
<OPTION VALUE="purgatorio_13.html">Canto XIII</OPTION>
<OPTION VALUE="purgatorio_14.html">Canto XIV</OPTION>
<OPTION VALUE="purgatorio_15.html">Canto XV</OPTION>
<OPTION VALUE="purgatorio_16.html">Canto XVI</OPTION>
<OPTION VALUE="purgatorio_17.html">Canto XVII</OPTION>
<OPTION VALUE="purgatorio_18.html">Canto XVIII</OPTION>
<OPTION VALUE="purgatorio_19.html">Canto XIX</OPTION>
<OPTION VALUE="purgatorio_20.html">Canto XX</OPTION>
<OPTION VALUE="purgatorio_21.html">Canto XXI</OPTION>
<OPTION VALUE="purgatorio_22.html">Canto XXII</OPTION>
<OPTION VALUE="purgatorio_23.html">Canto XXIII</OPTION>
<OPTION VALUE="purgatorio_24.html">Canto XXIV</OPTION>
<OPTION VALUE="purgatorio_25.html">Canto XXV</OPTION>
<OPTION VALUE="purgatorio_26.html">Canto XXVI</OPTION>
<OPTION VALUE="purgatorio_27.html">Canto XXVII</OPTION>
<OPTION VALUE="purgatorio_28.html">Canto XXVIII</OPTION>
<OPTION VALUE="purgatorio_29.html">Canto XXIX</OPTION>
<OPTION VALUE="purgatorio_30.html">Canto XXX</OPTION>
<OPTION VALUE="purgatorio_31.html">Canto XXXI</OPTION>
<OPTION VALUE="purgatorio_32.html">Canto XXXII</OPTION>
<OPTION VALUE="purgatorio_33.html">Canto XXXIII</OPTION>
</select></p>
<P class=ref><A HREF="javascript: open('notas_' + eval(parent.comedia.canto) + '.html', 'comedia')">Notas<br>explicativas</A></P>
<P class=ref><A HREF="javascript: open('canto_' + eval(parent.comedia.canto) + '.html', 'comedia')">Texto<br>em prosa</A></P>
</form><hr>

<% String img_livro="pur"; %>
<%@include file="../navbar_map.jsp" %><map name="livros">

</BODY>
</HTML>
