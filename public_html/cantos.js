// Scripts para Canto
    browser = navigator.appName;
	version = parseInt(navigator.appVersion);
	cookiePath="/";
	root = "/";
	var isIE3, isNS4, sep="";
	if (browser == 'Microsoft Internet Explorer' && version <= 3) {
		isIE3 = true;
	}
	if (browser == 'Netscape' && version == 4) {
		isNS4 = true;
	}
    
	romanos = new Array ("", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X",
	                     "XI", "XII", "XIII", "XIV", "XV", "XVI", "XVII", "XVIII", "XIX", "XX",
						 "XXI", "XXII", "XXIII", "XXIV", "XXV", "XXVI", "XXVII", "XXVIII", "XXIX", "XXX",
						 "XXXI", "XXXII", "XXXIII", "XXXIV");

    if (!isNS4) {
        document.write("<style>table.m1 {position: relative; left: 30px;}\n");
        document.write("h1.titulo {margin-top: 16px}\n");
        document.write(".m2 {position: relative; left: 30px; top: 15px}\n");
        document.write(".bot {position: relative; left: -40px; top: 15px}</style>");
    } else {
        document.write("<style>div.menu {position: relative; top: 7px;}\n");
        document.write(".bot {position: relative; left: -48px; top: 20px}</style>");
    }

    
    function getCookie(nome) {
		ini = document.cookie.indexOf(nome + "=");
		if (ini == -1) return null;
		eq =  document.cookie.indexOf("=", ini);
		fim = document.cookie.indexOf(";", eq);
		if (fim == -1) fim = document.cookie.length;
		return unescape(document.cookie.substring(eq+1, fim));
	}
    
    function getCookies() {
      cookies = document.cookie.split("; ");
      for (i = 0; i < cookies.length; i++) {
         cookies[i] = cookies[i].split("=");
         cookies[i][0] = unescape(cookies[i][0]); // nome
         cookies[i][1] = unescape(cookies[i][1]); // valor
      }
      return cookies;
    }
   
	function statusMarcador(c, diretorio, arquivo) {
    
        if (getCookie("marcada") == arquivo + "_"+ c +".html") {
		    if (((getCookie("nomearq")).split("|")[0]).toLowerCase() == diretorio) {
			    return true;
		    } else {
                return false;
            }
	    }
        return false;
    }
    
	function desmarcar() {
		if (confirm("Tirar marcador desta página?")) {
	    	document.cookie = "marcada=dead; expires=" + genData(-100) + ";path=" + cookiePath;
			location.reload();
		}
	}
		
    function genData(dias) {
		agora = (new Date()).getTime();
		depois = new Date(agora + (3600*24*dias*1000));
		return depois.toGMTString();
	}
    
	function viaMail(livro, secao, c) {
		document.cookie="nomearq=" + escape(livro + "|" + secao + "|") + c;
		w = open("viaemail.html", "viamail", "height=350,width=300");
	}
    
	function marcador(livro, secao, c, arquivo) {
		document.cookie="marcada=" + arquivo + "_" + c + ".html;expires="+genData(90)+";path="+cookiePath;
		document.cookie="nomearq=" + escape(livro + "|" + secao + "|") + c + ";expires=" + genData(90) + ";path="+cookiePath;
		w = open("marcar.html", "marcador", "height=300,width=300");
	}
    
    function proximo(prefixo, c) {
        pagina(prefixo, c + 1);
    }
    
    function anterior(prefixo, c) {
        pagina(prefixo, c - 1);
    }
    
    function pagina(prefixo, c) {
        location.href = prefixo + "_" + c + ".html";
    }

	// E-mail functions
    function init(f, p0, p1, p2) {
	     if (email != null) {
            f.destinatario.value = email;
         } else {
            f.destinatario.value = "";
         }
		 f.dir_txt.value = root+"pt/" + p0.toLowerCase() + "/txt/";
		 if (p1.toLowerCase() == "notas do canto") {
		 	f.notas.checked = true;
			f.texto.checked = false;
		 } else if (p1.toLowerCase() == "canto") {
		    f.notas.checked = true;
			f.texto.checked = true;
		 }
    }

	function verifica(f, numcanto) {
	  f.sel.value = numcanto;
      if (f.destinatario.value.length < 1) {          
         alert("Digite seu e-mail!");
         f.destinatario.focus();
         f.destinatario.select();
      } else if (f.destinatario.value.lastIndexOf("@") == -1) {
         alert("Formato ilegal para E-mail");
         f.destinatario.focus();
         f.destinatario.select();
      } else if (!f.texto.checked && !f.notas.checked) {
         alert("Escolha o texto a ser enviado!");
      } else {
	     document.cookie="email=" + f.destinatario.value;
	  	 f.submit();
	  }
	}