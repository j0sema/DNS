
@clientes = qw ( bbva volvo sabmiller inditex cemex telefonica santander allianz mapfre dhl nokia caixa aena ferrovial avianca nh oracle google amazon vestas mercadona icex mahou corona ford iberia  );

@interfaces = ( 2 ... 25000);
@bw = qw ( 5 10 20 30 40 50 60 70 80);
@day1 = (2 ... 350  );
@day2 = qw ( 10 15 30 90 100 );


foreach $i (1...50000){

$cliente = $clientes[rand @clientes];
$interface = "i".$interfaces[rand @interfaces];
$bw = $bw[rand @bw];
$day1 = $day1[rand @day1];
$day2 = $day1 + $day2[rand @day2];
   print "$i,crear,$cliente,$interface,$bw,$day1,$day2,ok,10\n";
}
