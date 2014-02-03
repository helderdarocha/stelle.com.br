#!/usr/local/bin/perl
 ##############################################################################
 # Simple Search                 Version 1.0                                  #
 # Copyright 1996 Matt Wright    mattw@worldwidemart.com                      #
 # Created 12/16/95              Last Modified 12/16/95                       #
 # Scripts Archive at:           http://www.worldwidemart.com/scripts/        #
 ##############################################################################
 # COPYRIGHT NOTICE                                                           #
 # Copyright 1996 Matthew M. Wright  All Rights Reserved.                     #
 #                                                                            #
 # Simple Search may be used and modified free of charge by anyone so long as #
 # this copyright notice and the comments above remain intact.  By using this #
 # code you agree to indemnify Matthew M. Wright from any liability that      #  
 # might arise from it's use.                                                 #  
 #                                                                            #
 # Selling the code for this program without prior written consent is         #
 # expressly forbidden.  In other words, please ask first before you try and  #
 # make money off of my program.                                              #
 #                                                                            #
 # Obtain permission before redistributing this software over the Internet or #
 # in any other medium.  In all cases copyright and header must remain intact.#
 ##############################################################################
 # Define Variables							     #
 
 $basedir = '/home/stelle/public_html/';
 $baseurl = 'http://www.stelle.com.br/';
 $title = "A Divina ComÈdia";
 $title_url = 'http://www.stelle.com.br/';
 $search_url = 'http://www.stelle.com.br/search.html';
 $andy = "checked";
 $debug = "";
 $search = "";

 # Done									     #
 ##############################################################################
 
 # Parse Form Search Information
 &parse_form;
 &build_files_array;
 
 # Get Files To Search Through
 &get_files;
 
 # Search the files
 &search;
 
 # Print Results of Search
 &return_html;
 
 
 sub parse_form {
 
    # Get the input
    read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
 
    # Split the name-value pairs
    @pairs = split(/&/, $buffer);
 
    foreach $pair (@pairs) {
       ($name, $value) = split(/=/, $pair);
 
       $value =~ tr/+/ /;
       $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
 
       $FORM{$name} = $value;
    }
 }
 
 sub build_files_array {
   $sl_inf = $sl_pur = $sl_par = $sl_tod = $ck_can = $cl_not = $ck_poe = $ck_out = "";
   @files = ();
	@files_poema = split (/:/, $FORM{'poema'});
	$files_cantos = $FORM{'cantos'};
	$files_notas = $FORM{'notas'};
	$files_outros = $FORM{'outros'};
	@dir = split (/:/, $FORM{'secoes'});

	if ($FORM{'secoes'} =~ /paraiso/ && $FORM{'secoes'} =~ /inferno/) {
		$sl_tod = "selected";
	} elsif ($FORM{'secoes'} =~ /purgatorio/) {
		$sl_pur = "selected";
	} elsif ($FORM{'secoes'} =~ /paraiso/) {
		$sl_par = "selected";
	} elsif ($FORM{'secoes'} =~ /inferno/) {  
		$sl_inf = "selected";
	}

	if ($files_cantos) {
	   $ck_can = "checked";
	   for ($idx1 = 0; $idx1 < 3; $idx1 = $idx1 + 1) {
			if ($dir[$idx1]) {
				$cantos[$idx1] = $dir[$idx1].$files_cantos;
			}
		}
	}
	if ($files_notas) {
	   $ck_not = "checked";
	   for ($idx2 = 0; $idx2 < 3; $idx2 = $idx2 + 1) {
			if ($dir[$idx2]) {
				$notas[$idx2] = $dir[$idx2].$files_notas;
			}
		}
	}
	if (@files_poema) {
	   $ck_poe = "checked";
	   for ($idx3 = 0; $idx3 < 3; $idx3 = $idx3 + 1) {
			if ($dir[$idx3]) {
			   @radic = split(/\//, $dir[$idx3]);
				$file_poema = $radic[2] . "_*.html";
				$poemas[$idx3] = $dir[$idx3].$file_poema;
			}
		}
	}
	if ($files_outros) {
	   $ck_out = "checked";
	   for ($idx4 = 0; $idx4 < 4; $idx4 = $idx4 + 1) {
			if ($dir[$idx4]) {
				$all[$idx4] = $dir[$idx4].$files_outros;
			}
		}
	}

	#$debug = "";
	@files = (@cantos, @notas, @poemas, @all);
	#foreach $file (@files) {
	#   $debug = $debug . "<br>" . $file;
	#}
	
	#$debug = $dir[0]."<br>".$dir[1]."<br>".$dir[2]."<br>Um:".$files_poema[0]."<br>Dois:".$files_poema[1]."<br>TrÍs:".$files_poema[2];
 }

 sub get_files {
 
    chdir($basedir);
    foreach $file (@files) {
       $ls = `ls $file`;
       @ls = split(/\s+/,$ls);
       foreach $temp_file (@ls) {
          if (-d $file) {
             $filename = "$file$temp_file";
             if (-T $filename) {
                push(@FILES,$filename);
             }
          }
          elsif (-T $temp_file) {
             push(@FILES,$temp_file);
          }
       }
    }
 }
 
 sub search {
 
    @terms = split(/\s+/, $FORM{'terms'});

    foreach $FILE (@FILES) {
       open(FILE,"$FILE");
		 open(FILE,"$FILE");
       @LINES = <FILE>;
       close(FILE);
       $string = join(' ',@LINES);
       $string =~ s/\n//g;
		 $string =~ s/<style>(.|\n)*<\/style>/ /ig;
		 $string =~ s/<script>(.|\n)*<\/script>/ /ig;
		 $string =~ s/<(([^>])*)>/ /g;
		 $string =~ s/[ ]+/ /g;
       if ($FORM{'boolean'} eq 'E') {

		    $andy = "checked"; $ory = "";
          foreach $term (@terms) {
			       if ($term eq 'ante' || $term eq 'para' || $term eq 'por'  || $term eq 'que'	 
					     || $term eq 'uma' || $term eq 'com' || $term eq 'contra' || $term eq 'desde'		
						  || $term eq 'entre' || $term eq 'para' || $term eq 'perante' || $term eq 'ele'	  
						  || $term eq 'ela' || $term eq 'depois' || $term eq 'antes' || $term eq 'porÈm'	  
						  || $term eq 'mas' || length($term) <= 3) {
						  $x = 0;
					 } elsif (!($string =~ /$term/i)) {
					    $string =~ s/([Û”Ù‘ı’Ú“ˆ÷])/o/g;
						 $term =~ s/([Û”Ù‘ı’Ú“ˆ÷])/o/g;
						 $string =~ s/([·¡‚¬„√‡¿‰ƒ])/a/g;
						 $term =~ s/([·¡‚¬„√‡¿‰ƒ])/a/g;
						 $string =~ s/([È…Í ÎÀË»])/e/g;
						 $term =~ s/([È…Í ÎÀË»])/e/g;
						 $string =~ s/([ÌÕÏÃÓŒÔœ])/i/g;
						 $term =~ s/([ÌÕÏÃÓŒÔœ])/i/g;
						 $string =~ s/([˙⁄˘Ÿ˚€˘Ÿ])/u/g;
						 $term =~ s/([˙⁄˘Ÿ˚€˘Ÿ])/u/g;
						 $string =~ s/([Á«])/c/g;
						 $term =~ s/([ÁC])/c/g;
						 $string =~ s/([Ò—])/n/g;
						 $term =~ s/([Ò—])/n/g;
						 if (!($string =~ /$term/i)) {
                      $include{$FILE} = 'no';
						 } else {
						 	$include{$FILE} = 'yes';
					      $ind = index($string, $term);
 							$posi = $ind - 60;
							if ($posi < 0) { $posi = 0; }
							$sel_string = substr($string, $posi, 120);
						   $sel_string =~ s/$term/<b>$term<\/b>/ig;
							$sels{$FILE} = $sel_string;
						 }
   		          last;
                }
                else {
                   $include{$FILE} = 'yes';
					    $ind = index($string, $term);
 						 $posi = $ind - 60;
						 if ($posi < 0) { $posi = 0; }
						 $sel_string = substr($string, $posi, 120);
						 $sel_string =~ s/$term/<b>$term<\/b>/ig;
						 $sels{$FILE} = $sel_string;
                }
             }
             
       }
       elsif ($FORM{'boolean'} eq 'OU') {
		    $andy = ""; $ory = "checked";
          foreach $term (@terms) {
                if ($term eq 'ante' || $term eq 'para' || $term eq 'por'  || $term eq 'que'	 
					     || $term eq 'uma' || $term eq 'com' || $term eq 'contra' || $term eq 'desde'		
						  || $term eq 'entre' || $term eq 'para' || $term eq 'perante' || $term eq 'ele'	  
						  || $term eq 'ela' || $term eq 'depois' || $term eq 'antes' || $term eq 'porÈm'	  
						  || $term eq 'mas' || length($term) <= 3) {
						  $x = 0;
					 } elsif ($string =~ /$term/i) {
                   $include{$FILE} = 'yes';
					    $ind = index($string, $term);
 						 $posi = $ind - 60;
						 if ($posi < 0) { $posi = 0; }
						 $sel_string = substr($string, $posi, 120);
						 $sel_string =~ s/$term/<b>$term<\/b>/ig;
						 $sels{$FILE} = $sel_string;
                   last;
                }
                else {	  
					    $string =~ s/([Û”Ù‘ı’Ú“ˆ÷])/o/g;
						 $term =~ s/([Û”Ù‘ı’Ú“ˆ÷])/o/g;
						 $string =~ s/([·¡‚¬„√‡¿‰ƒ])/a/g;
						 $term =~ s/([·¡‚¬„√‡¿‰ƒ])/a/g;
						 $string =~ s/([È…Í ÎÀË»])/e/g;
						 $term =~ s/([È…Í ÎÀË»])/e/g;
						 $string =~ s/([ÌÕÏÃÓŒÔœ])/i/g;
						 $term =~ s/([ÌÕÏÃÓŒÔœ])/i/g;
						 $string =~ s/([˙⁄˘Ÿ˚€˘Ÿ])/u/g;
						 $term =~ s/([˙⁄˘Ÿ˚€˘Ÿ])/u/g;
						 $string =~ s/([Á«])/c/g;
						 $term =~ s/([ÁC])/c/g;
						 $string =~ s/([Ò—])/n/g;
						 $term =~ s/([Ò—])/n/g;
						 if (!($string =~ /$term/i)) {
                      $include{$FILE} = 'no';
						 } else {
						 	$include{$FILE} = 'yes';
					      $ind = index($string, $term);
 						   $posi = $ind - 60;
						   if ($posi < 0) { $posi = 0; }
						   $sel_string = substr($string, $posi, 120);
						   $sel_string =~ s/$term/<b>$term<\/b>/ig;
						   $sels{$FILE} = $sel_string;
							last;
						 }

                }
             }

       }
       if ($string =~ /<title>(.*)<\/title>/i) {
          $titles{$FILE} = "$1";
       }
       else {
          $titles{$FILE} = "$FILE";
       }
    }
 }
       
 sub return_html {
    print "Content-type: text/html\n\n";
	 print <<HT;
<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">

<HTML>
<HEAD>
	<TITLE>A Divina ComÈdia - Inferno: Busca</TITLE>
	<script><!--
	if (parent.nav) {
		parent.nav.location.href=\"/pt/navbar.jsp\";
	}
	//--></script>
	<style>
	\.button {font-size: 9pt; font-weight: bold; font-family: tahoma, sans-serif; background: maroon; color: yellow}
	\.text {font-family: tahoma, sans-serif; font-weight: bold; background: rgb(100\%, 90\%, 80\%); color: maroon}
	\.reset {font-size: 9pt; font-weight: bold; font-family: tahoma, sans-serif; background: transparent; color: maroon}
	\.primeiro, p, li, ol {font-size: 12pt}
	\.radio {color: red}
	select {font-family: tahoma, sans-serif; font-weight: bold; background: rgb(100\%, 100\%, 80\%); color: black}
	\.inf {color: maroon}
	\.pur {color: green}
	\.par {color: navy}
	</style>
	
<LINK REL=\"STYLESHEET\" HREF=\"http://www.stelle.com.br/pt/default.css\">
</HEAD>

<BODY><TABLE WIDTH=450><TR><TD>
<p class=minimenu><table width=\"100%\" border=\"0\" cellspacing=0 cellpadding=0>
<tr>
<td align=left width=\"33%\"><a href=\"/pt/dante.html\">Vida de Dante</a></td>
<td align=\"center\" width=\"33%\"><a href=\"/pt/../index.html\" target=\"_top\">P·gina Principal</a></td>
<td align=\"right\" width=\"33%\"><a href=\"/pt/comedia.html\">Divina Com&eacute;dia</a></td>
</tr></table><hr><p></p>
<H1>Resultados da Busca</H1>		 $debug
<P class=primeiro>P·ginas com as palavras:  
HT

	 $i = 0;
    foreach $term (@terms) {
       print "<b>$term</b>";
       $i++;
       if (!($i == @terms)) {
          print " ".$FORM{'boolean'}." ";
       }
    }
	 print "<br>(preposiÁıes, artigos e palavras com 3 letras ou menos s„o ignoradas)";
	 $num = 0;
	 foreach $key (keys %include) {
       if ($include{$key} eq 'yes') {
          $num++;
       }
    }
    print "</P>\n </center>\n<P class=primeiro style=\"font-size: 14pt\">Resultados (".$num." p·ginas encontradas):\n";
    print "<ol>\n";
    foreach $key (keys %include) {
       if ($include{$key} eq 'yes') {
          print "<li style=\"font-size: 12pt\"><a href=\"$baseurl$key\">$titles{$key}</a>: $sels{$key}</li>\n";
       }
    }
    print "</ol></P>\n";
	 print <<HTML;
<h2 style=\"text-align: left\"><hr>Nova busca</h2>
<form method=POST action=\"http://www.stelle.com.br/cgi-local/search.pl\">
<p class=lista>Procura por: 
<select name=secoes>
<option value=\"pt/inferno/:pt/purgatorio/:pt/paraiso/:pt/\" $sl_tod>Todo o site</option>
<option value=\"pt/inferno/\" class=inf $sl_inf>Inferno</option>
<option value=\"pt/purgatorio/\" class=pur $sl_pur>PurgatÛrio</option>
<option value=\"pt/paraiso/\" class=par $sl_par>ParaÌso</option>
</select><br>em
<input type=checkbox name=cantos class=text value=\"canto_*.html\" $ck_can>Cantos 
<input type=checkbox name=notas class=text  value=\"notas_*.html\" $ck_not>Notas 
<input type=checkbox name=poema class=text $ck_poe value=\"inferno_*.html:purgatorio_*.html:paraiso_*.html\">Poema (italiano) 
<input type=checkbox name=outros class=text $ck_out value=\"*.html\">Outros textos</p>
<p style=\"text-align: left; text-indent: 0px\">Palavras-chave:<br>
<input type=text class=text name=\"terms\" size=30 value=\"$FORM{terms}\"> 
<input type=submit class=button value=\"Procurar\">
<input type=reset class=reset value=\"Limpar\">
<br><i>OpÁıes</i>:
<input type=radio class=radio name=boolean value=E $andy> E-lÛgico 
<input type=radio class=radio name=boolean value=OU $ory> OU-lÛgico
<input type=hidden name=case value=Insensitive> </p>
</form>
<p class=minimenu><br><hr><table width=\"100%\" border=\"0\" cellspacing=0 cellpadding=0>
<tr>
<td align=left width=\"33%\"><a href=\"/pt/dante.html\">Vida de Dante</a></td>
<td align=\"center\" width=\"33%\"><a href=\"/pt/../index.html\" target=\"_top\">P·gina Principal</a></td>
<td align=\"right\" width=\"33%\"><a href=\"/pt/comedia.html\">Divina Com&eacute;dia</a></td>
</tr></table><p></p>

</TD></TR></TABLE></BODY>
</HTML>

HTML

 }
    
 