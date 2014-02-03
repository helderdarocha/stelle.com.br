<!-- This document was created with HomeSite 2.5 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
        <BASE TARGET="comedia">
	<TITLE>Barra de Navegação</TITLE>
	<STYLE>
	BODY {background-color: rgb(0%,0%,20%); color: rgb(70%,70%,100%);
              background-image: url(../../imagens/par_back_bar.jpg)}
	BODY, P, TD {font-family: tahoma, sans-serif; font-size: 12px; color: rgb(70%,70%,100%);}
	A:link {color: rgb(70%,70%,100%); font-weight: bold; text-decoration: none}
	A:visited {color: rgb(40%,50%,100%); font-weight: bold; text-decoration: none}
	P {text-align: center}
	P.ref {line-height: 100%; margin-top: 7px; margin-bottom: 7px;
	        padding: 1px; border-style: outset; border-width: 1px; border-color: blue;
			background-color: rgb(10%,10%,25%); width: 100%}
	A.mainlink:visited {color: rgb(70%,70%,100%); text-decoration: none}
	.marc {font-size: 11px; text-align: right; line-height: 100%; font-family: tahoma, sans-serif}
	a:hover {color: rgb(80%,80%,100%);}
	select, option {background: rgb(0%,0%,20%); color: rgb(70%,70%,100%);}
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
<p><img src="../par.gif" width=120 height=81 border=0 usemap="#livros" name="tomos" alt="Escolha um livro">
</div>

<DIV  style="text-align:center"><P>
<form name=sel>
<p style="text-align:center"><b>POEMA ORIGINAL</b></p>
<p style="text-align:center">
<select onchange="parent.comedia.location.href=this.options[this.selectedIndex].value" name=originais>
<OPTION VALUE="javascript:void(0)">Exibir ...</OPTION>
<OPTION VALUE="paraiso_1.html">Canto I</OPTION>
<OPTION VALUE="paraiso_2.html">Canto II</OPTION>
<OPTION VALUE="paraiso_3.html">Canto III</OPTION> 
<OPTION VALUE="paraiso_4.html">Canto IV</OPTION>
<OPTION VALUE="paraiso_5.html">Canto V</OPTION>
<OPTION VALUE="paraiso_6.html">Canto VI</OPTION>
<OPTION VALUE="paraiso_7.html">Canto VII</OPTION>
<OPTION VALUE="paraiso_8.html">Canto VIII</OPTION>
<OPTION VALUE="paraiso_9.html">Canto IX</OPTION>
<OPTION VALUE="paraiso_10.html">Canto X</OPTION>
<OPTION VALUE="paraiso_11.html">Canto XI</OPTION>
<OPTION VALUE="paraiso_12.html">Canto XII</OPTION>
<OPTION VALUE="paraiso_13.html">Canto XIII</OPTION>
<OPTION VALUE="paraiso_14.html">Canto XIV</OPTION>
<OPTION VALUE="paraiso_15.html">Canto XV</OPTION>
<OPTION VALUE="paraiso_16.html">Canto XVI</OPTION>
<OPTION VALUE="paraiso_17.html">Canto XVII</OPTION>
<OPTION VALUE="paraiso_18.html">Canto XVIII</OPTION>
<OPTION VALUE="paraiso_19.html">Canto XIX</OPTION>
<OPTION VALUE="paraiso_20.html">Canto XX</OPTION>
<OPTION VALUE="paraiso_21.html">Canto XXI</OPTION>
<OPTION VALUE="paraiso_22.html">Canto XXII</OPTION>
<OPTION VALUE="paraiso_23.html">Canto XXIII</OPTION>
<OPTION VALUE="paraiso_24.html">Canto XXIV</OPTION>
<OPTION VALUE="paraiso_25.html">Canto XXV</OPTION>
<OPTION VALUE="paraiso_26.html">Canto XXVI</OPTION>
<OPTION VALUE="paraiso_27.html">Canto XXVII</OPTION>
<OPTION VALUE="paraiso_28.html">Canto XXVIII</OPTION>
<OPTION VALUE="paraiso_29.html">Canto XXIX</OPTION>
<OPTION VALUE="paraiso_30.html">Canto XXX</OPTION>
<OPTION VALUE="paraiso_31.html">Canto XXXI</OPTION>
<OPTION VALUE="paraiso_32.html">Canto XXXII</OPTION>
<OPTION VALUE="paraiso_33.html">Canto XXXIII</OPTION>
</select></p>
<!--
<P class=ref><A HREF="javascript: open('notas_' + eval(parent.comedia.canto) + '.html', 'comedia')">Notas<br>explicativas</A></P>
<P class=ref><A HREF="javascript: open('canto_' + eval(parent.comedia.canto) + '.html', 'comedia')">Texto<br>em prosa</A></P>
-->
</form>

<map name="livros">
  <area shape="rect" coords="0,58,119,80" href="/pt/paraiso/paraiso.html" alt="Paraíso" onmouseover="acende('paraiso')" onmouseout="apaga('../par.gif')" target="_top">
  <area shape="rect" coords="0,35,119,58" href="/pt/purgatorio/purgatorio.html" alt="Purgatório" onmouseover="acende('purgato')" onmouseout="apaga('../par.gif')" target="_top">
  <area shape="rect" coords="0,0,119,34" href="/pt/inferno/inferno.html" alt="Inferno" onmouseover="acende('inferno')" onmouseout="apaga('../par.gif')" target="_top">
</map>

</BODY>
</HTML>
