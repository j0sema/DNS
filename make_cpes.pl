
@clientes = qw ( bbva volvo sabmiller inditex cemex telefonica santander allianz mapfre dhl nokia caixa aena ferrovial avianca nh oracle google amazon vestas mercadona icex mahou corona ford iberia  );

@indices = ( 1 ... 5000);

@ciudades = qw ( madrid rio london paris frankfurt miami lima buenosaires newyork barcelona roma moscu varsovia amsterdam bruselas montevideo mexico bogota leon sevilla milan viena dublin niza napoles bilbao sanfrancisco quito santiago caracas saopaulo puertorico cuba zaragoza);

foreach $i (@indices){

$nombre = "cpe".$i;
$cliente = $clientes[rand @clientes];
$ciudad = $ciudades[rand @ciudades];
   print "$nombre,$ciudad,$cliente\n";
}

