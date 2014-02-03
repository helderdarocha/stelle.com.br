sorteio = Math.floor(Math.random() * 2);
cookiePath = "/";
//document.cookie = "ref=ibpinet; path=/helder/dante/";
browser = navigator.appName;
version = parseInt(navigator.appVersion);

var isIE3, isNS4, sep="";
if (browser == 'Microsoft Internet Explorer' && version <= 3) {
	isIE3 = true;
}
if (browser == 'Netscape' && version == 4) {
	isNS4 = true;
}

function avisoIE3() {
	mensagem = "ATENÇÃO: Você está usando um navegador versão 3 ou anterior (1997). ";
	mensagem += "Este site utiliza recursos que poderão ";
	mensagem += "IMPEDIR A VISUALIZAÇÃO DO SEU CONTEÚDO em browsers muito antigos.";
	mensagem += "Se possível, atualize seu browser com uma versão nova.";
	alert (mensagem);
}	

inferno = null;
paraiso = null;
purgato = null;
carregadas = false;
function loadImages() {
	inferno = new Image();
	inferno.src = "tomo_inf_b.gif";
	inferno.acesa = inferno.src;
	inferno.apagada = document.images["inferno"].src;
	paraiso = new Image();
	paraiso.src = "tomo_par_b.gif";
	paraiso.acesa = paraiso.src;
	paraiso.apagada = document.images["paraiso"].src;
	purgato = new Image();
	purgato.src = "tomo_pur_b.gif";
	purgato.acesa = purgato.src;
	purgato.apagada = document.images["purgato"].src;
	setTimeout("carregadas = true",1000);
}

function acende(nome) {
	if (carregadas) {
		document.images[nome].src = eval(nome + ".acesa");
	}
}

function apaga(nome) {
	if (carregadas) {
		document.images[nome].src = eval(nome + ".apagada");
	}
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
	location.href="pt/"+livro+"/"+livro+".html";
}
