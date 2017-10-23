
# version 1.0
# interfaces o puertos  son enlaces fisicos, con bw fisico, tipo de bw, y shaping
# subinterfaces son instancias virtuales de un interface con un shaping (cir ¡ eir?) y qos
# un cliente puede tener un interface entero o un subinterface
# un interface puede ser compartido por varios clientes
# un interface o subinterface tiene un interface o subinterface al otro extremo  cpe con un shaping
# un cpe esta en casa de cliente
# un pe tiene multiples interfaces fisicos para cilentes
# hacer la red es crear pes, crear interfaces, crear cpes, crear accesos
# no consideramos los troncales ni las conexiones entre pes
# version 1.0, acepta ordenes y las planifica, de cambios de ancho de banda simulando Bod
# tambien acepta peticiones nuevas y las asigna considerando que la suma de bw de los interfaces de un puerto mas la nueva
# asignacion quepa en el puerto.
# ademas asigna el pe en funcion del pop donde se pide el circuito
# ha generado arrays de puertos y hashes de puertos y pes
# ideas para versiones siguientes, añadir:
# - enlaces de backbone, bblinks de 10G
# - enlaces LSP entre nodos o pes
# - ASs o vpns de clientes
# - flujos de trafico o ocupaciones, con origen y destino
# - planes de direccionamiento o direccionamiento y routing entre sedes, mascara en funcion de numero de equipos, rangos por sedes
#   y anuncios de redes por sede
#   (para esto ultimo se pueden usar modulos)
# - funcion de SPF shortest path entre nodos o flujos y los bblinks den cabida a LSPs
# simular que los LSPs sobre bblinks tienen una ocupacion y ver que pasa, recalculo ante eventos de link down, bblonk down y reroute
# los lsps entre los phy links disponibles ante evento de link down
# Usar esto para jugar en github, perl98guy, dns, dirty network simulator
# usar includes y funciones, limpiando el codigo, para que quede mas legible, dentro de la chapuza
# hacer un bucle de lectura alfinal y de modeo intercativo generar
# - report de ocupacion
# - orden de bod
# - nueva asignacion de interface
# - completar la asignacion de interface creando el CPE
# - mejorar la salida del debug para que sea mas legible

$iface_index=25000;

@pes = (
    {
       nombre  => "pe1",
       ciudad     => "madrid",
    },
  );

@cpes = (
    {
       nombre  => "cpe1",
       ciudad     => "madrid",
       cliente     => "bbva",
    },
  );

@puertos = (
    {
       nombre  => "p1",
       pe     => "pe1",
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
  );

@asignaciones = (
   {
      nombre => "a1",
      cliente => "bbva",
      ciudad => "madrid",
      bw => "10",

   }
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
 

Lee_pes("pes.txt");
Lee_cpes("cpes.txt");
Lee_puertos("puertos.txt");
Lee_interfaces("interfaces.txt");
Lee_ordenes("orders.txt");
# orders en lugar de orders2 para asignaciones

## code

foreach $p (@puertos){
   $puerto = $p->{"nombre"};
   $$puerto{"bw"} = $p->{"bw"};
   $pe = $p->{"pe"};
   push @$pe , $puerto;
}

# el array con nombre de pe tienen la lista de los puertos en el pe.


@days = (1 .. 365);
open (OUTFILE, ">salida.csv");
foreach $i (@ifaces){
   $interface = $i->{"nombre"};
   $puerto = $i->{"puerto"};
   $$interface{"puerto"} = $i->{"puerto"};
   $$interface{"pe"} = $i->{"pe"};
   print OUTFILE "$interface,";
   push @$puerto, $interface;
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

# el array con nombre de puerto tienen la lista de los interfaces en el puerto.

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


print "Vamos con las asignaciones .....\n";

Lee_asignaciones ("asignaciones.txt");
print "leidas ".(scalar @asignaciones)."  asignaciones\n";
print "disponibles ".(scalar @pes)." PEs \n";

foreach $a (@asignaciones){

          $estado{$a->{"nombre"}} = "no";

#      print "order ".$a->{"nombre"}." en ".$a->{"ciudad"}."\n";

   foreach $pe (@pes){
     
       next if ($estado{$a->{"nombre"}} eq "si");

#      print "PE ".$pe->{"nombre"}." en ".$pe->{"ciudad"}."\n";
       $ppe = $pe->{"nombre"};
       if ($a->{"ciudad"} eq $pe->{"ciudad"}){
             print "asignado PE ".$pe->{"nombre"}." en ".$pe->{"ciudad"}." para ".$a->{"nombre"}." \n";
          foreach $ppp (@$ppe){
             $bandw = 0;
             next if ($estado{$a->{"nombre"}} eq "si");
             print "       evaluando puerto $ppp en el PE: ".$pe->{"nombre"}."\n";
             foreach $iii (@$ppp){
                next if ($estado{$a->{"nombre"}} eq "si");
                print "         interface es:".$iii."\n";
                print "         bw del interface es:".$$iii{"1"}."\n";
# hash de interfaces por dia, no he creado uno de interface (bw)
                $bandw = $$iii{"1"} + $bandw;
             }
print "--------------------------------------------------------------\n";
print "valores de variables de debug:\n";
print "dolar bandw en el puerto, suma de interfaces:".$bandw." \n";
print "dolar a flecla bw a incluir                 :".$a->{"bw"}." \n";
print "dolar ppp bw en el puerto                   :".$$ppp{"bw"}." \n";
print "--------------------------------------------------------------\n";
             if (($bandw + $a->{"bw"}) < $$ppp{"bw"}){
                print "         asignado el puerto $ppp, creando interface\n";
                $entrada =
                      {
                       nombre  => "i".($iface_index++),
                       dedicado     => "si",
                       puerto     => $ppp,
                       pe     => $ppe,
                       cpe     => "pendiente",
                       cliente     => $a->{"cliente"},
                       bw     => $a->{"bw"},
                       cir => 10,
                       eir => 10,
                       quos1 => 10,
                       quos2 => 10,
                       quos3 => 10,
                       quos4 => 10,
                       quos5 => 10,
                       quos6 => 50,
                      };
                   push @ifaces, $entrada;

                $interfaz = "i".$iface_index;
                print "            creado interface: $interfaz\n";
                push @$ppp,$interfaz;
                $estado{$a->{"nombre"}} = "si";
             }
          }
     }
   }
}

   print "salida:\n";
   print @p59;
   print "-------\n";

   #selecciona los pes en el pop
   #   para cada pe, recorre sus interfaces de menor a mayor ocupacion
   #   hay que hacer un hash de arrays para los puertos de un pe, y un hash de array para los interfaces de un puerto
   #      viendo si encaja el bw
   #      si encaja, crea un interface (contador global ++ de interface)
   #      imprime la asignacion
   #      imprime el nuevo interface


sub Lee_ordenes{
   $file =shift;
   open(my $fh, "<", $file) or die "Can't open < $file : $!";
   while (<$fh>){
     chomp;
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
   close $fh;
}

sub Lee_asignaciones{
   $file =shift;
   open(my $fh, "<", $file) or die "Can't open < $file : $!";
   while (<$fh>){
     chomp;
     @orden = split /\,/,$_;
      $entrada = 
      {  
       nombre  => $orden[0],
       cliente     => $orden[1],
       ciudad     => $orden[2],
       bw     => $orden[3],
      };
   push @asignaciones, $entrada;
   }
   close $fh;
}

sub Lee_pes{
   $file =shift;
   open(my $fh, "<", $file) or die "Can't open < $file : $!";
   while (<$fh>){
     chomp;
     @orden = split /\,/,$_;
      $entrada = 
      {  
       nombre  => $orden[0],
       ciudad     => $orden[1],
      };
   push @pes, $entrada;
   }
   close $fh;
}

sub Lee_cpes{
   $file =shift;
   open(my $fh, "<", $file) or die "Can't open < $file : $!";
   while (<$fh>){
     chomp;
     @orden = split /\,/,$_;
      $entrada = 
      {  
       nombre  => $orden[0],
       ciudad     => $orden[1],
       cliente     => $orden[2],
      };
   push @cpes, $entrada;
   }
   close $fh;
}
sub Lee_puertos{
   $file =shift;
   open(my $fh, "<", $file) or die "Can't open < $file : $!";
   while (<$fh>){
     chomp;
     @orden = split /\,/,$_;
      $entrada = 
      {  
       nombre  => $orden[0],
       pe     => $orden[1],
       tipo     => $orden[2],
       bw     => $orden[3],
      };
   push @puertos, $entrada;
   }
   close $fh;
}
sub Lee_interfaces{
   $file =shift;
   open(my $fh, "<", $file) or die "Can't open < $file : $!";
   while (<$fh>){
     chomp;
     @orden = split /\,/,$_;
      $entrada = 
      {  
       nombre  => $orden[0],
       dedicado     => $orden[1],
       puerto     => $orden[2],
       pe     => $orden[3],
       cpe     => $orden[4],
       cliente     => $orden[5],
       bw     => $orden[6],
       cir => $orden[7],
       eir => $orden[8],
       quos1 => $orden[8],
       quos2 => $orden[8],
       quos3 => $orden[8],
       quos4 => $orden[8],
       quos5 => $orden[8],
       quos6 => $orden[8],
      };
   push @ifaces, $entrada;
   }
   close $fh;
}

sub Print_ports{
   $dia = shift;
   foreach $pp (@puertos){
      $ppuerto= $pp->{"nombre"};
      print "\npuerto ".$pp->{"nombre"}." ".$pp->{"bw"}." ".$$ppuerto{"$dia"}."\n";
  }
}
