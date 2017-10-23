
@indices = ( 1 ... 500);
@ciudades = qw ( madrid rio london paris frankfurt miami lima buenosaires newyork barcelona roma moscu varsovia amsterdam bruselas montevideo mexico bogota leon sevilla milan viena dublin niza napoles bilbao sanfrancisco quito santiago caracas saopaulo puertorico cuba zaragoza);

foreach $i (@indices){

$nombre = "pe".$i;
$ciudad = $ciudades[rand @ciudades];
   print "$nombre,$ciudad\n";
}

