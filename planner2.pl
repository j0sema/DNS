
# interfaces o puertos  son enlaces fisicos, con bw fisico, tipo de bw, y shaping
# subinterfaces son instancias virtuales de un interface con un shaping (cir ¡ eir?) y qos
# un cliente puede tener un interface entero o un subinterface
# un interface puede ser compartido por varios clientes
# un interface o subinterface tiene un interface o subinterface al otro extremo  cpe con un shaping
# un cpe esta en casa de cliente
# un pe tiene multiples interfaces fisicos para cilentes
# hacer la red es crear pes, crear interfaces, crear cpes, crear accesos
# no consideramos los troncales ni las conexiones entre pes
# pe:
#   nombre
#    ciudad
#    puertos  hash
#    interfaces hash
#
## cpe
#   nombre
#   ciudad
#   cliente
#
## accesos:
#   pe
#   nombre
#   
## clientes
#
## puertos
#   pe
#   name
#   tipo
#   bw
#
## interfaces 
#   dedicado
#   cliente
#   shaping
#   cir
#   eir
#   quos1
#   quos2
#   quos3
#   quos4
#   quos5
#   quos6


@pes = (
    {
       nombre  => "pe1",
       ciudad     => "madrid",
    },
    {
       nombre => "pe2",
       ciudad    => "london",
    },

    {
       nombre => "pe3",
       ciudad    => "rio",
    },
  );

@cpes = (
    {
       nombre  => "cpe1",
       ciudad     => "madrid",
       cliente     => "bbva",
    },
    {
       nombre => "cpe2",
       ciudad    => "london",
       cliente     => "bbva",
    },

    {
       nombre => "cpe3",
       ciudad    => "rio",
       cliente     => "bbva",
    },
    {
       nombre => "cpe4",
       ciudad    => "rio",
       cliente     => "bbva",
    },
    {
       nombre => "cpe5",
       ciudad    => "madrid",
       cliente     => "volvo",
    },
    {
       nombre => "cpe6",
       ciudad    => "london",
       cliente     => "volvo",
    },
    {
       nombre => "cpe7",
       ciudad    => "madrid",
       cliente     => "volvo",
    },
    {
       nombre => "cpe8",
       ciudad    => "rio",
       cliente     => "volvo",
    },
  );

@puertos = (
    {
       nombre  => "p1",
       pe     => "pe1",
       tipo  => "ethernet",
       bw     => "100",
    },
    {
       nombre  => "p2",
       pe     => "pe1",
       tipo  => "ethernet",
       bw     => "100",
    },

    {
       nombre  => "p3",
       pe     => "pe1",
       tipo  => "ethernet",
       bw     => "100",
    },

    {
       nombre  => "p4",
       pe     => "pe2",
       tipo  => "ethernet",
       bw     => "100",
    },

    {
       nombre  => "p5",
       pe     => "pe2",
       tipo  => "ethernet",
       bw     => "100",
    },

    {
       nombre  => "p6",
       pe     => "pe3",
       tipo  => "ethernet",
       bw     => "100",
    },

    {
       nombre  => "p7",
       pe     => "pe3",
       tipo  => "ethernet",
       bw     => "100",
    },

    {
       nombre  => "p8",
       pe     => "pe3",
       tipo  => "ethernet",
       bw     => "100",
    },
  );


@ifaces = (
    {
       nombre  => "i1",
       dedicado => "si",
       puerto => "p1",
       pe => "pe1",
       cpe => "p1",
       cliente => "bbva",
       bw => "10",
       cir => "10",
       eir => "0",
       quos1     => "10",
       quos2     => "10",
       quos3     => "10",
       quos4     => "10",
       quos5     => "10",
       quos6     => "50",
    },
    {
       nombre  => "i2",
       dedicado => "si",
       puerto => "p1",
       pe => "pe1",
       cpe => "p1",
       cliente => "volvo",
       bw => "30",
       cir => "10",
       eir => "0",
       quos1     => "10",
       quos2     => "10",
       quos3     => "10",
       quos4     => "10",
       quos5     => "10",
       quos6     => "50",
    },

    {
       nombre  => "i3",
       dedicado => "si",
       puerto => "p1",
       pe => "pe1",
       cpe => "p1",
       cliente => "volvo",
       bw => "20",
       cir => "10",
       eir => "0",
       quos1     => "10",
       quos2     => "10",
       quos3     => "10",
       quos4     => "10",
       quos5     => "10",
       quos6     => "50",
    },

    {
       nombre  => "i4",
       dedicado => "si",
       puerto => "p4",
       pe => "pe2",
       cpe => "p1",
       cliente => "bbva",
       bw => "40",
       cir => "10",
       eir => "0",
       quos1     => "10",
       quos2     => "10",
       quos3     => "10",
       quos4     => "10",
       quos5     => "10",
       quos6     => "50",
    },

    {
       nombre  => "i5",
       dedicado => "si",
       puerto => "p5",
       pe => "pe2",
       cpe => "p1",
       cliente => "volvo",
       bw => "50",
       cir => "10",
       eir => "0",
       quos1     => "10",
       quos2     => "10",
       quos3     => "10",
       quos4     => "10",
       quos5     => "10",
       quos6     => "50",
    },

    {
       nombre  => "i6",
       dedicado => "si",
       puerto => "p6",
       pe => "pe3",
       cpe => "p1",
       cliente => "bbva",
       bw => "10",
       cir => "10",
       eir => "0",
       quos1     => "10",
       quos2     => "10",
       quos3     => "10",
       quos4     => "10",
       quos5     => "10",
       quos6     => "50",
    },

    {
       nombre  => "i7",
       dedicado => "si",
       puerto => "p7",
       pe => "pe3",
       cpe => "p1",
       cliente => "bbva",
       bw => "30",
       cir => "10",
       eir => "0",
       quos1     => "10",
       quos2     => "10",
       quos3     => "10",
       quos4     => "10",
       quos5     => "10",
       quos6     => "50",
    },

    {
       nombre  => "i8",
       dedicado => "si",
       puerto => "p8",
       pe => "pe3",
       cpe => "p1",
       cliente => "volvo",
       bw => "80",
       cir => "10",
       eir => "0",
       quos1     => "10",
       quos2     => "10",
       quos3     => "10",
       quos4     => "10",
       quos5     => "10",
       quos6     => "50",
    },

    {
       nombre  => "i9",
       dedicado => "si",
       puerto => "p2",
       pe => "pe3",
       cpe => "p1",
       cliente => "bbva",
       bw => "70",
       cir => "10",
       eir => "0",
       quos1     => "10",
       quos2     => "10",
       quos3     => "10",
       quos4     => "10",
       quos5     => "10",
       quos6     => "50",
    },


  );

@orders = (
    {  
       number  => "1",
       accion     => "crear",
       cliente     => "bbva",
       interface     => "i1",
       bw     => "20",
       day1     => "20",
       day2     => "50",
       resultado => "ok",
       coste => "10",
    },

  );
 

Lee_ordenes("orders.txt");

#
#
#husband=fred friend=barney
#you could use either of the following two loops:
#while ( <> ) {
#    $rec = {};
#    for $field ( split ) {
#        ($key, $value) = split /=/, $field;
#        $rec->{$key} = $value;
#    }
#    push @AoH, $rec;
#}
#
#while ( <> ) {
#    push @AoH, { split /[\s=]+/ };
#}
#
#ou can set a key/value pair of a particular hash as follows:
#
#$AoH[0]{husband} = "fred";
#To capitalize the husband of the second array, apply a substitution:
#$AoH[1]{husband} =~ s/(\w)/\u$1/;
#You can print all of the data as follows:
#for $href ( @AoH ) {
#    print "{ ";
#    for $role ( keys %$href ) {
#         print "$role=$href->{$role} ";
#    }
#    print "}\n";
#}
#and with indices:
#for $i ( 0 .. $#AoH ) {
#    print "$i is { ";
#    for $role ( keys %{ $AoH[$i] } ) {
#         print "$role=$AoH[$i]{$role} ";
#    }
#    print "}\n";
#
#
#
## code

foreach $p (@puertos){
   $puerto = $p->{"nombre"};
   $$puerto{"bw"} = $p->{"bw"};
}

@days = (1 .. 365);
open (OUTFILE, ">salida.csv");
foreach $i (@ifaces){
   $interface = $i->{"nombre"};
   $puerto = $i->{"puerto"};
   $$interface{"puerto"} = $i->{"puerto"};
   $$interface{"pe"} = $i->{"pe"};
   print OUTFILE "$interface,";
   foreach $d (@days){
      $$interface{"$d"}= $i->{"bw"};
      $$puerto{"ocupacion"}+= $i->{"bw"};
      $$puerto{"$d"}+= $i->{"bw"};
      print OUTFILE $i->{"bw"}.",";
   }
   print OUTFILE "\n";
}
print OUTFILE "\n";
print OUTFILE "\n";

foreach $p (@puertos){
   $puerto = $p->{"nombre"};
   $pe = $p->{"pe"};
   print OUTFILE "$puerto,";
   foreach $d (@days){
      print OUTFILE $$puerto{"$d"}.",";
   }
   print OUTFILE "\n";
}
close (OUTFILE);

print "int 1 dia 1: ".$i1{"1"}." \n";

foreach $o (@orders){
   $ordnum = $o->{"number"};
   $inte = $o->{"interface"};
   $cliente = $o->{"cliente"};
   $bw = $o->{"bw"};
   $day1 = $o->{"day1"};
   $day2 = $o->{"day2"};
   $puerto = $$inte{"puerto"} ;
   $pe = $$inte{"pe"} ;
   
#   print $ordnum , " ", $inte, " ", $bw, " ", $day1, " ", $day2, "\n";

   foreach $dd ($day1 .. $day2){

# aqui que no sume mas de 10 o de lo que hay en el puerto disponible del interface
# atualizar el estado tras cada orden (act_puerto)

      if ($bw + $$puerto{"$dd"} > $$puerto{"bw"}){
         print "orden $ordnum del cliente $cliente viola el maximo pidiendo $bw en el interface $inte del puerto $puerto del PE $pe\n" if  ($ordstatus{"$ordnum"} ne "ko");
         $ordstatus{"$ordnum"} = "ko";
# que pasa si no controlamos?
#         $$inte{$dd}=$bw;
#         $$puerto{$dd} += $bw;
         $o->{"resultado"}= "ko" ;
      }
      else{
#         $$inte{"bw"}=$bw;
         $$inte{$dd}=$bw;
         $$puerto{$dd} += $bw;
         $o->{"resultado"}= "ok" ;
#         print "\n".$$inte{$dd}."\n";
      }
#Print_ports("$dd");
   }
}


@days = (1 .. 365);
open (OUTFILE, ">salida3.csv");
foreach $i (@ifaces){
   $interface = $i->{"nombre"};
   print OUTFILE "$interface,";
   foreach $d (@days){
      print OUTFILE $$interface{"$d"}.",";
   }
   print OUTFILE "\n";
}
print OUTFILE "\n";
print OUTFILE "\n";

foreach $p (@puertos){
   $puerto = $p->{"nombre"};
   $pe = $p->{"pe"};
   print OUTFILE "$puerto,";
   foreach $d (@days){
      print OUTFILE $$puerto{"$d"}.",";
   }
   print OUTFILE "\n";
}

close (OUTFILE);

print "int 1 dia 1: ".$i1{"1"}." \n";








sub Lee_ordenes("orders.txt"){
   $file =shift;
   open(my $fh, "<", $file) or die "Can't open < $file : $!";
   while (<$fh>){
     @orden = split /\,/,$_;
      $entrada = 
      {  
       number  => $orden[0],
       accion     => $orden[1],
       cliente     => $orden[2],
       interface     => $orden[3],
       bw     => $orden[4],
       day1     => $orden[5],
       day2     => $orden[6],
       resultado => $orden[7],
       coste => $orden[8],
      };
   push @orders, $entrada;
   }
}

sub Print_ports{
   $dia = shift;
   foreach $pp (@puertos){
      $ppuerto= $pp->{"nombre"};
      print "\npuerto ".$pp->{"nombre"}." ".$pp->{"bw"}." ".$$ppuerto{"$dia"}."\n";
  }
}
