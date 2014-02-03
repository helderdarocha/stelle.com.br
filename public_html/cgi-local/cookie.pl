##########################################################################################
#
# COOKIE.PL - Vers�o 1.0 - por Helder da Rocha (helder@ibpinet.net)
#
# As principais funcoes desta biblioteca sao:
#
#	&ReadCookies - para ler todos os cookies
#  &MakeCookieHeader - para criar um cookie
#
# Para usar esta biblioteca, simplesmente a coloque junto com o programa CGI
# que ir� criar ou ler cookies, e importe-a usando require:
#
# require "cookie.pl";
#
# Depois � s� usar os m�todos abaixo. Observe as limita��es dos cookies (tamanho de 2k,
# m�ximo de 20 por dom�nio, 300 por browser). Este programa n�o verifica isto.
#
# 1. Exemplo de uso &ReadCookies - l� cookies e os coloca em vetor associativo
#                                  escolhido pelo programador (funciona da mesma forma
#                                  que o &ReadParse do cgi-lib c/ 1 argumento:
#
#	&ReadCookies(\%crackers);
#
#  $cookie1 = $crackers{'nome1'};		 # obtem o valor, informando-se o nome
#  $cookie2 = $crackers{'nome2'};
#
# 2. Exemplo com &MakeCookieHeader - Cria cabe�alho de cookie. Pode ser chamada v�rias
# 										       vezes, mas sempre ANTES de imprimir o fim do cabe�alho
# 												 (antes do 'print &PrintHeader' da biblioteca cgi-lib.pl
#                                    ou antes de QUALQUER linha em branco ("xxx xxx \n\n").
#                                    Deve ser chamada como o &PrintHeader, precedida de print:
#
# A fun��o deve ter no minimo dois argumentos. A sintaxe geral �:
# 
# print &MakeCookieHeader("nome", "valor", tempo_de_vida_em_dias, "caminho", "dominio", 1);
#
# NOME E VALOR (m�nimo para cookies tempor�rios em �nica localidade)
# Os dois primeiros campos (obrigat�rios) cont�m o nome e valor do cookie (que podem conter
# espa�os, etc. 
#
# COOKIES PERSISTENTES
# O tempo de vida � um n�mero de ponto-flutuante que representa o n�mero de dias
# que o cookie vai durar. So o n�mero for negativo, ser� criado um anti-cookie (que dizimar�
# qualquer outro cookie do mesmo nome que ele encontrar). � um campo opcional. Se n�o estiver
# presente, o cookie durar� apenas at� o fim da sess�o. 
# 
# CAMINHO OU LOCALIDADE
# O quarto campo informa o caminho do # diret�rio abaixo do qual o cookie � v�lido. Se ausente, 
# o cookie valer� apenas no diret�rio # atual. Este campo � obrigat�rio para cookies persistentes
# ou n�o que seja criados em um lugar (por exemplo, o diret�rio cgi-bin/) e lidos em outro lugar
# (por exemplo, atrav�s de JavaScript em um diret�rio de documentos qualquer como o "/"). Se o 
# cookie n�o for persistente, deve-se usar 'undef' no lugar do n�mero de dias. 
#
# DOM�NIO
# O pen�ltimo campo informa o dom�nio abaixo do qual o cookie � v�lido. Deve ter no m�nimo dois
# pontos (pode come�ar por ponto, por exemplo: .abc.com). Os campos anteriores, se n�o definidos,
# dever�o conter o vaor 'undef'. N�o � feita verifica��o de dom�nio (ou caminho), portanto, tenha
# cuidado em informar um dom�nio v�lido.
#
# COOKIES EM CONEX�O SEGURA
# O �ltimo campo, se presente, deve conter um n�mero positivo, e indica que o cookie s� deve ser 
# criado ou enviado em uma conex�o segura. Se a conex�o n�o for segura, ele n�o � criado ou enviado
# para o servidor pelo browser (mesmo que o dom�nio e caminho coincidam).
#
# EXEMPLOS:
#
# a) Exemplo para cookie temporario:
#
#  print &MakeCookieHeader("usuario", "jos�");
#
# b) Cookie persistente que durara 15 dias:
#
#  print &MakeCookieHeader("usuario", "joao", 15);
#
# c) Cookie com duracao de 15 dias, no dominio abc.com.br, no caminho / e seguro:
#
#  print &MakeCookieHeader("usuario", "joao", 15, "/", ".abc.com.br", 1);
#
# d) Par�metros n�o utilizados devem ser preenchidos com undef:
#
#  print &MakeCookieHeader("usuario", "joao", undef, undef, ".abc.com.br");	  
#  print &MakeCookieHeader("usuario", "joao", undef, "/");
#  


######################################### LEIA COOKIES: ReadCookies #############
# Esta fun��o l� todos os cookies e os coloca em um vetor associativo (hash)
# Deve ser chamada da forma:
#    &ReadCookies(\%nome_do_vetor);
#
# Voc� pode escolher qualquer nome para o vetor associativo. Exemplo:
#	  &ReadCookies(\%dados);
# far� com que os pares nome/valor sejam armazenados no vetor asociativo %dados.
# Para recuperar um cookie, use:
#    $valor = $dados{'nome_cookie'};
#
sub ReadCookies {
  local (*cookies) = @_;
  local ($i, $nome, $valor);	   

  if ($ENV{'HTTP_COOKIE'}) {
  	  @cookies = split(/; /,$ENV{'HTTP_COOKIE'});

     foreach $i (0 .. $#cookies) {
       $cookies[$i] =~ s/\+/ /g;
       ($nome, $valor) = split(/=/, $cookies[$i], 2); 
       $nome =~ s/%(..)/pack("c", hex($1))/ge;
       $valor =~ s/%(..)/pack("c", hex($1))/ge;
       $cookies{$nome} = $valor;
     }
     return scalar(@cookies);
  } else {
  	  return "";
  }
}

######################################### CRIA COOKIES: MakeCookieHeader #############
# Esta fun��o devolve o cabe�alho que spode ser usado para criar um cookie.
# Deve ser chamada da forma:
#    print &MakeCookieHeader("nome", "valor", tempo_de_vida_em_dias, "caminho", "dominio", 1);
#                                                     												 ^
#                                                                      6o. campo: cookie seguro = 1, 
#                                                                      inseguro = 0 ou ausente
# Exemplos:
#    print &MakeCookieHeader("usuario", "joao", 15, "/", ".abc.com.br", 1);
#    print &MakeCookieHeader("usuario", "joao");
#    print &MakeCookieHeader("usuario", "joao", 15);
#    print &MakeCookieHeader("usuario", "joao", undef, "/");
#
# A chamada deve ser feita ANTES do fim do cabe�alho! 
#
# ADVERT�NCIA: esta subrotina NAO verifica se o dominio e o caminho sao validos!
# 
sub MakeCookieHeader {
	local ($key, $val, $dias, $path, $domain, $secure) = @_;
	if ($key){
		($key, $val) = &escape($key, $val);
		$headString = "$key=$val";
	} else {
		return "";
	}

	if ($dias){
		$expires = &genDataGMT($dias);
		$headString .= "; expires=$expires";
	}
	if ($path){
		$headString .= "; path=$path";
	}
	if ($domain){
		$headString .= "; domain=$domain";
	}
	if ($secure){
		$headString .= "; secure";
	}
	return "Set-Cookie: $headString\n";
}

###############################################################################
# FUN��ES AUXILIARES
#
# As subrotinas abaixo s�o usadas pelas subrotinas acima
#
###############################

# Fun��o que converte texto especial dos pares nome/valor em %hexadecimal
sub escape {  
	local($cookie, $value) = @_;
	$cookie =~ s/([^A-Za-z0-9])/&charToHex($1)/eg;
	$value =~ s/([^A-Za-z0-9])/&charToHex($1)/eg;
	return ($cookie, $value);
}

# Fun��o que converte � em %E3 ou qualquer caractere fora da faixa [A-Za-z0-9] em %hh
sub charToHex {
	local ($char) = @_;
	$upper = "%".(sprintf("%2x", unpack("C", $char)));
	return "\U$upper";
}

# Fun��o que gera uma data GMT (RFC 850) 'n' dias afastada (antes ou depois) do dia atual.
# Formato da data � Sunday, 24-Apr-2000 23:45:59 GMT
sub genDataGMT {
	local ($diasDeVida) = @_;	# n�mero de dias

	# dias e meses em ingl�s para criar a data RFC850
	@days=('Sunday','Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday','Saturday');
	@months=('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');

	$dataMiliseg = time + 24 * 3600 * $dias;	# time retorna AGORA em milissegundos desde 1/1/1970

	# gmtime � vetor com data UTC. Tem 9 elementos. 
	# Contem: 0: segundo, 1: minuto, 2: hora, 3: diaDoMes, 4: mes, 5: ano, 6: diaDaSemana
	$diaDaSemana = $days[(gmtime($dataMiliseg))[6]];	# obtem dia do vetor @days.
	$diaDoMes = (gmtime($dataMiliseg))[3];				   # obtem data (numero do dia do mes)
   if ($diaDoMes < 10) {										# converte para dois digitos (se nao tiver)
	   $diaDoMes = "0".$diaDoMes;							   # ex: 5 se transforma em 05
   }
	$mes = $months[(gmtime($dataMiliseg))[4]];
	$ano = (gmtime($dataMiliseg))[5] + 1900;	  			# ano volta com dois digitos (0 a 99)

	return "$diaDaSemana, $diaDoMes-$mes-$ano 00:00:00 GMT";
}

1;