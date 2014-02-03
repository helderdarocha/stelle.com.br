##########################################################################################
#
# COOKIE.PL - Versão 1.0 - por Helder da Rocha (helder@ibpinet.net)
#
# As principais funcoes desta biblioteca sao:
#
#	&ReadCookies - para ler todos os cookies
#  &MakeCookieHeader - para criar um cookie
#
# Para usar esta biblioteca, simplesmente a coloque junto com o programa CGI
# que irá criar ou ler cookies, e importe-a usando require:
#
# require "cookie.pl";
#
# Depois é só usar os métodos abaixo. Observe as limitações dos cookies (tamanho de 2k,
# máximo de 20 por domínio, 300 por browser). Este programa não verifica isto.
#
# 1. Exemplo de uso &ReadCookies - lê cookies e os coloca em vetor associativo
#                                  escolhido pelo programador (funciona da mesma forma
#                                  que o &ReadParse do cgi-lib c/ 1 argumento:
#
#	&ReadCookies(\%crackers);
#
#  $cookie1 = $crackers{'nome1'};		 # obtem o valor, informando-se o nome
#  $cookie2 = $crackers{'nome2'};
#
# 2. Exemplo com &MakeCookieHeader - Cria cabeçalho de cookie. Pode ser chamada várias
# 										       vezes, mas sempre ANTES de imprimir o fim do cabeçalho
# 												 (antes do 'print &PrintHeader' da biblioteca cgi-lib.pl
#                                    ou antes de QUALQUER linha em branco ("xxx xxx \n\n").
#                                    Deve ser chamada como o &PrintHeader, precedida de print:
#
# A função deve ter no minimo dois argumentos. A sintaxe geral é:
# 
# print &MakeCookieHeader("nome", "valor", tempo_de_vida_em_dias, "caminho", "dominio", 1);
#
# NOME E VALOR (mínimo para cookies temporários em única localidade)
# Os dois primeiros campos (obrigatórios) contém o nome e valor do cookie (que podem conter
# espaços, etc. 
#
# COOKIES PERSISTENTES
# O tempo de vida é um número de ponto-flutuante que representa o número de dias
# que o cookie vai durar. So o número for negativo, será criado um anti-cookie (que dizimará
# qualquer outro cookie do mesmo nome que ele encontrar). É um campo opcional. Se não estiver
# presente, o cookie durará apenas até o fim da sessão. 
# 
# CAMINHO OU LOCALIDADE
# O quarto campo informa o caminho do # diretório abaixo do qual o cookie é válido. Se ausente, 
# o cookie valerá apenas no diretório # atual. Este campo é obrigatório para cookies persistentes
# ou não que seja criados em um lugar (por exemplo, o diretório cgi-bin/) e lidos em outro lugar
# (por exemplo, através de JavaScript em um diretório de documentos qualquer como o "/"). Se o 
# cookie não for persistente, deve-se usar 'undef' no lugar do número de dias. 
#
# DOMÍNIO
# O penúltimo campo informa o domínio abaixo do qual o cookie é válido. Deve ter no mínimo dois
# pontos (pode começar por ponto, por exemplo: .abc.com). Os campos anteriores, se não definidos,
# deverão conter o vaor 'undef'. Não é feita verificação de domínio (ou caminho), portanto, tenha
# cuidado em informar um domínio válido.
#
# COOKIES EM CONEXÃO SEGURA
# O último campo, se presente, deve conter um número positivo, e indica que o cookie só deve ser 
# criado ou enviado em uma conexão segura. Se a conexão não for segura, ele não é criado ou enviado
# para o servidor pelo browser (mesmo que o domínio e caminho coincidam).
#
# EXEMPLOS:
#
# a) Exemplo para cookie temporario:
#
#  print &MakeCookieHeader("usuario", "josé");
#
# b) Cookie persistente que durara 15 dias:
#
#  print &MakeCookieHeader("usuario", "joao", 15);
#
# c) Cookie com duracao de 15 dias, no dominio abc.com.br, no caminho / e seguro:
#
#  print &MakeCookieHeader("usuario", "joao", 15, "/", ".abc.com.br", 1);
#
# d) Parâmetros não utilizados devem ser preenchidos com undef:
#
#  print &MakeCookieHeader("usuario", "joao", undef, undef, ".abc.com.br");	  
#  print &MakeCookieHeader("usuario", "joao", undef, "/");
#  


######################################### LEIA COOKIES: ReadCookies #############
# Esta função lê todos os cookies e os coloca em um vetor associativo (hash)
# Deve ser chamada da forma:
#    &ReadCookies(\%nome_do_vetor);
#
# Você pode escolher qualquer nome para o vetor associativo. Exemplo:
#	  &ReadCookies(\%dados);
# fará com que os pares nome/valor sejam armazenados no vetor asociativo %dados.
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
# Esta função devolve o cabeçalho que spode ser usado para criar um cookie.
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
# A chamada deve ser feita ANTES do fim do cabeçalho! 
#
# ADVERTÊNCIA: esta subrotina NAO verifica se o dominio e o caminho sao validos!
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
# FUNÇÕES AUXILIARES
#
# As subrotinas abaixo são usadas pelas subrotinas acima
#
###############################

# Função que converte texto especial dos pares nome/valor em %hexadecimal
sub escape {  
	local($cookie, $value) = @_;
	$cookie =~ s/([^A-Za-z0-9])/&charToHex($1)/eg;
	$value =~ s/([^A-Za-z0-9])/&charToHex($1)/eg;
	return ($cookie, $value);
}

# Função que converte ã em %E3 ou qualquer caractere fora da faixa [A-Za-z0-9] em %hh
sub charToHex {
	local ($char) = @_;
	$upper = "%".(sprintf("%2x", unpack("C", $char)));
	return "\U$upper";
}

# Função que gera uma data GMT (RFC 850) 'n' dias afastada (antes ou depois) do dia atual.
# Formato da data é Sunday, 24-Apr-2000 23:45:59 GMT
sub genDataGMT {
	local ($diasDeVida) = @_;	# número de dias

	# dias e meses em inglês para criar a data RFC850
	@days=('Sunday','Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday','Saturday');
	@months=('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');

	$dataMiliseg = time + 24 * 3600 * $dias;	# time retorna AGORA em milissegundos desde 1/1/1970

	# gmtime é vetor com data UTC. Tem 9 elementos. 
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