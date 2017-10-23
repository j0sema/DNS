
@clientes = qw ( bbva volvo sabmiller inditex cemex telefonica santander allianz mapfre dhl nokia caixa aena ferrovial avianca nh oracle google amazon vestas mercadona icex mahou corona ford iberia  );

@ciudades = qw ( madrid rio london paris frankfurt miami lima buenosaires newyork barcelona roma moscu varsovia amsterdam bruselas montevideo mexico bogota leon sevilla milan viena dublin niza napoles bilbao sanfrancisco quito santiago caracas saopaulo puertorico cuba zaragoza);

@bw = qw ( 5 10 20 30 40 50 60 70 80);

foreach $i (1...10000){

   $nombre = "a".$i;
   $cliente = $clientes[rand @clientes];
   $ciudad = $ciudades[rand @ciudades];
   $bw = $bw[rand @bw];
   print "$nombre,$cliente,$ciudad,$bw\n";
}


#@asignaciones = (
#   {
#      nombre => "a1",
#      cliente => "bbva",
#      ciudad => "madrid",
#      bw => "10",
#
#   }
#); 



