	inferno = null;
	paraiso = null;
	purgato = null;
	id = null;
	carregadas = false;
	root="/";
	cookiePath = root;
    
	function loadImages(inf, pur, par) {
		inferno = new Image();
		inferno.src = inf;
		inferno.acesa = inferno.src;
		paraiso = new Image();
		paraiso.src = par;
		paraiso.acesa = paraiso.src;
		purgato = new Image();
		purgato.src = pur;
		purgato.acesa = purgato.src;
		setTimeout("carregadas = true",1000);
	}
	function getCookie(nome) {
		ini = document.cookie.indexOf(nome);
		if (ini == -1) return "";
		eq =  document.cookie.indexOf("=", ini);
		fim = document.cookie.indexOf(";", eq);
		if (fim == -1) fim = document.cookie.length;
		return unescape(document.cookie.substring(eq+1, fim));
	}
	function tiraMarca() {
		document.cookie = "continua=sim; path="+cookiePath;
		page = getCookie('nomearq').split("|");
		livro = page[0].toLowerCase();
		open(root+"pt/" + livro+"/"+livro+".html", "_top");
	}
	
	function checkRef() {
		/*if (document.referrer.indexOf("uol.com.br") != -1) {
			document.cookie = "ref=uol; path="+cookiePath;
			document.links[0].href = "http://sites.uol.com.br/hlsr/dante/index.html";
		}
		if (getCookie("ref") == "uol") {
			document.links[0].href = "http://sites.uol.com.br/hlsr/dante/index.html";
		}*/
	} 
	function acende(nome) {
		if (carregadas) {
			if (id != null) clearTimeout(id);
			document.tomos.src = eval(nome + ".acesa");
		}
	}
	function apaga(img_apaga) {
		id = setTimeout("document.tomos.src = '"+ img_apaga +"'", 2000);
	}