
@puertos =  ( 1 ... 10000);
@pes =  ( 1 ... 500);
@tipos = qw (ethernet gigabitethernet pos sonet serial);
@bws = qw ( 100 1000 10000 25000  );

foreach $i (@puertos){

$nombre = "p".$i;
$pe = "pe".$pes[rand @pes];
$tipo = $tipos[rand @tipos];
$bw = $bws[rand @bws];
   print "$nombre,$pe,$tipo,$bw\n";
}

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

