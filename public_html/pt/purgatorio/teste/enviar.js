 function enviar(f, grupo) {
	f.respostas.value = getCookie(grupo); 
	f.grupo.value = grupo;   
	sim = conf = false;
	if (f.respostas.value.split(",").length < 10) {
		sim = confirm("Você não fez as 10 questões do teste. Deseja enviar mesmo assim?");  
		conf = true;
	} else {
		sim = true;
	}
	if (sim == true) {
		if (conf == false) {
			if(confirm("Enviar questões?")) {
				f.submit();
			}
		} else {
			f.submit();
		}
	}
 }
 function esvaziar(f, numgrupo) {
	if (confirm("Você tem certeza que deseja apagar as opções que selecionou?")) {
		killCookie("dante" + numgrupo);
		killCookie("gab" + numgrupo);
		killCookie("nota" + numgrupo);
		killCookie("notatemp");
		location.reload();
	}
 }
