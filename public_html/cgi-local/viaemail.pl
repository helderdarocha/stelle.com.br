#!/usr/local/bin/perl

$mailprog = '/usr/lib/sendmail';
$userdir = '/home/stelle/public_html';

require "cgi-lib.pl";

# @referers allows forms to be located only on servers which are defined 
# in this field.  This fixes a security hole in the last version which 
# allowed anyone on any server to use your FormMail script.

@referers = ('stelle.com.br','argonavis.com.br');

&check_url;
&ReadParse(\%dados);
&process;

sub check_url {

   if ($ENV{'HTTP_REFERER'}) {
      foreach $referer (@referers) {
         if ($ENV{'HTTP_REFERER'} =~ /$referer/i) {
            $check_referer = '1';
	    last;
         }
      }
   }
   else {
      $check_referer = '1';
   }

   if ($check_referer != 1) {
      print "Bad!";
   }

}

sub process {

	$sel = $dados{'sel'};
	$texto = $dados{'texto'};
	$notas = $dados{'notas'};
	$livro = $dados{'livro'};

	if ($texto eq "texto") {
		$texto_sel = "canto_".$sel.".txt";
		$nome_texto = $livro.": Canto ".$sel;
		&sendMail;
	}
	if ($notas eq "notas") {
		$texto_sel = "notas_".$sel.".txt";
		$nome_texto = $livro.": Notas do Canto ".$sel;
		&sendMail;
	}
	&returnHtml;

}

sub returnHtml {

     print "Content-type: text/html\n\n";

	  print <<HTML;

<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">
<html><head>
	<title>Mensagem Enviada</title>
	<LINK REL=\"STYLESHEET\" HREF=\"/pt/default.css\">
	<style>
	\.reset {font-size: 9pt; font-family: tahoma, sans-serif; background: rgb(30\%, 30\%, 30\%); color: white}
	</style>
</head>
<body><div>
<h1 align=center style=\"font-size: 20pt\">Arquivo(s) Enviado(s)</h1>
<p style=\"font-size: 12pt; text-indent: 0px; text-align: center\">O(s) texto(s) que você selecionou 
foram enviados para
<b>$destinatario</b> por correio eletrônico.</p>
<form>
<div align=center>
<input type=button value=\"Fechar esta Janela\" onclick=\"self.close()\" class=reset>
</div>
</form></div>
</body></html>

HTML

}

sub sendMail {

	$destinatario = $dados{'destinatario'};
	$dir_txt = $userdir.$dados{'dir_txt'};	
	
   open(MAIL,"|$mailprog -t");

   print MAIL "To: $destinatario\n";
   print MAIL "From: A Divina Comedia de Dante <divina.comedia\@stelle.com.br> \n";
   print MAIL "Subject: $nome_texto\n\n";

	print MAIL "Este é o arquivo que você solicitou em http://www.stelle.com.br/\n\n";

	if (open (FILE, $dir_txt.$texto_sel)) {
		while($linha = <FILE>) {
			print MAIL $linha;
		}
		close (FILE);
	}
   print MAIL "\n------------ Fim do Arquivo --------------\n";
   close (MAIL);
}


