var purhome;
carregadas = false;
function loadImages() {
	purhome = new Image();
	purhome.src = "../../../imagens/purhome_b.gif";
	purhome.apagada = document.images["purhome"].src;
	purhome.acesa = purhome.src;
	setTimeout("carregadas = true",1000);
}
function acende() {
	if (carregadas) {
		document.purhome.src = purhome.acesa;
	}
}
function apaga() {
	if (carregadas) {
		document.purhome.src = purhome.apagada;
	}
}
function getCookieV1(nome) {
	ini = document.cookie.indexOf(nome);
	if (ini == -1) return "";
	eq =  document.cookie.indexOf("=", ini);
	fim = document.cookie.indexOf(";", eq);
	if (fim == -1) fim = document.cookie.length;
	return unescape(document.cookie.substring(eq+1, fim));
}
function tiraMarca() {
	document.cookie = "continua=sim; path=/";
	page = getCookie('nomearq').split("|");
	livro = page[0].toLowerCase();
	open("/pt/"+livro+"/"+livro+".html", "_top");
}

function checkRef() { /*
	if (document.referrer.indexOf("uol.com.br") != -1) {
		document.cookie = "ref=uol; path=//";
		document.links[0].href = "http://sites.uol.com.br/hlsr/dante/index.html";
	}
	if (getCookie("ref") == "uol") {
		document.links[0].href = "http://sites.uol.com.br/hlsr/dante/index.html";
	} */
}
