 function enviar(f, grupo) {
	f.respostas.value = getCookie(grupo); 
	f.grupo.value = grupo;   
	sim = conf = false;
	if (f.respostas.value.split(",").length < 10) {
		sim = confirm("Voc� n�o fez as 10 quest�es do teste. Deseja enviar mesmo assim?");  
		conf = true;
	} else {
		sim = true;
	}
	if (sim == true) {
		if (conf == false) {
			if(confirm("Enviar quest�es?")) {
				f.submit();
			}
		} else {
			f.submit();
		}
	}
 }
 function esvaziar(f, numgrupo) {
	if (confirm("Voc� tem certeza que deseja apagar as op��es que selecionou?")) {
		killCookie("dante" + numgrupo);
		killCookie("gab" + numgrupo);
		killCookie("nota" + numgrupo);
		killCookie("notatemp");
		location.reload();
	}
 }
