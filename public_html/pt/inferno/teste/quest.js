// Vencimento do cookie em 30 dias
expiry = (new Date((new Date()).getTime() + 3600*24*1000*30)).toGMTString();
death  = (new Date((new Date()).getTime() - 3600*24*1000*30)).toGMTString();
path = "/pt/inferno/";

MAX = 30;
numIni = document.URL.indexOf("q=") + 2;
numFin = document.URL.indexOf("&", numIni);
if (numFin == -1) numFin = document.URL.length;
pagNum = parseInt(document.URL.substring(numIni, numFin), 10);
prox = (pagNum < MAX) ? (pagNum + 1) : (pagNum);
ante = (pagNum > 1)   ? (pagNum - 1) : (pagNum);

/* Retorna uma pagina, dado o numero */
function pagina(num) {
	return "q.jsp?q="+num;
}

/* Adiciona uma alternativa marcada */
function addMark(question, letter, teste) { 
    removeMark(question, teste);
	resp = getCookie(teste); // 1:a,2:c,4:a ...
	if (resp == null) {
		resp = question + ":" + letter + ",";
	} else {
		resp += question + ":" + letter + ",";
	}
	resp = escape(resp);
	document.cookie = teste+"="+resp+"; path="+path+"; expires="+expiry;
}

function setCookie(nome, valor) {
	nome = escape(nome);
	valor = escape(valor);
	document.cookie = nome+"="+valor+"; path="+path+"; expires="+expiry;
}

/* Retorna o conteúdo de um cookie identificado pelo nome */
function getCookie(nome) {
	cooks = document.cookie;
	if ((iniNome = cooks.indexOf(nome+"=")) >= 0) {
		inicio = cooks.indexOf("=", iniNome) + 1;
		fim = cooks.indexOf(";", inicio);
		if (fim == -1) fim = cooks.length;
		return unescape(cooks.substring(inicio, fim));
	} else return null;
}

/* Retorna o conteúdo uma opcao selecionada */
function getMark(question, teste) {
	resp = getCookie(teste);
	if (resp == null) return null;
	if ((q = resp.indexOf(question + ":")) >= 0) {
		inicio = resp.indexOf(":", q) + 1;
		fim = resp.indexOf(",", inicio);
		if (fim == -1) fim = resp.length;
		return resp.substring(inicio, fim);
	} else return null;
}

/* Desmarca uma opcao */
function removeMark(question, teste) {
	resp = getCookie(teste);
	if (resp == null) return null;
	if ((fimPrefixo = resp.indexOf(question)) >= 0) {
		iniSufixo = resp.indexOf(",", fimPrefixo) + 1;
		prefixo = resp.substring(0,fimPrefixo);
		sufixo = resp.substring(iniSufixo, resp.length);
		resp = prefixo + sufixo;
		document.cookie = teste+"="+escape(resp)+"; path="+path;
	} else return null;
}

/* Mata um cookie */
function killCookie(nome) {
	document.cookie = nome+"=empty; expires="+death+"; path=" + path;
}

function killAll() {
	c = document.cookie.split(";");
	for (i = 0; i < c.length; i++) {
		nv = c[i].split("=");
		n = nv[0];
		killCookie(n);
	}
}

function mark(teste, quest, ckbox, aonde) {
	valores = "";
    someChecked = false;
	for (i = 0; i < ckbox.length; i++) {
		if (ckbox[i].checked) {
            someChecked = true;
			if (valores == "") {
				valores = ckbox[i].value;
			} else {
				valores += "|" + ckbox[i].value;
			}
		}
	}
	if (valores != "") {
		addMark(quest, valores, teste);
	}
	if (aonde == -1) {
		location.href = pagina(ante);
	} else if (aonde == 0 && someChecked) {
		history.go(0);
	} else if (aonde == 1) {
		location.href = pagina(prox);
	} else {
        ;
    }
}

function check(page, q_obj, teste) {
    quest = "" + page;
	m = getMark(quest, teste);
    sel = 100;
	if (m != null) {
        if (m == 'a') sel = 0;
        if (m == 'b') sel = 1;
        if (m == 'c') sel = 2;
        if (m == 'd') sel = 3;
        if (m == 'e') sel = 4;
        if (sel != 100)
		    q_obj[sel].checked = true;
	}
}

function prtMk(i, teste) {
	quest = "" + i;
	m = getMark(quest, teste);
	if (m != null) {
		document.write(m);
	} else document.write("&nbsp;");
}

var recent = "";    // letter to be tested when two funcs are called in a row
function prtMkTab(i, teste) {
	quest = "" + i;
	m = getMark(quest, teste);
    sty = img = "";
    if (recent != m && recent != "") {
        sty = "style='background: rgb(90%,80%,70%); color: red; font-weight: bold'";
        img = "<img src='eks.gif' width=12 height=12 alt='errado!'>";
    } else if (recent == m && recent != ""){
        img = "<img src='chk.gif' width=12 height=12 alt='certo!'>";
    }
	if (m != null) {
		document.write("<td class=resposta "+sty+">letra&nbsp;("+m+") "+img+"</td>");
	} else document.write("<td class=resposta "+sty+"> ---- </td>");
}

function prtSolTab(i, gabarito) {
    quest = "" + i;
	m = getMark(quest, gabarito);
	if (m != null) {
        recent = m;
		document.write("<td class=solucao align=center><a href='r.jsp?q="+i+"'>letra&nbsp;("+m+")</a></td>");
	} else document.write("<td class=solucao align=center> xxxx </td>");
}

function prtMks(qini, qfin, teste) {
	for (i = qini; i <= qfin; i++) {
		quest = "" + i;
		m = getMark(quest, teste);
		if (m != null) {
			document.write("<td class=resposta align=center>"+m+"</td>");
		} else document.write("<td class=resposta align=center> &nbsp; </td>");
	}
}
	
function getCookieWithPlus(c) {
	str = getCookie(c);
	if (str != null) 
		return (str.split("+")).join(" ");
	else return null;
}

function getMarks(nota) {
	str = getCookieWithPlus(nota); // nota
	if (str == null) return null;
	trn = str.split("&");
	teste = trn[0];
	resps = trn[1];
	notat = trn[2];
	resps = escape(resps);
	document.cookie = teste + "=" + resps + "; path=" + path;
	killCookie(nota);
	return notat;
}