
@interfaces = (2 ... 25000);
@puerto = (1 ... 10000  );
@cpe = (1 ... 5000);
@bw = qw ( 5 10 20 30 40 50 );

   $file ="cpes.txt";
   open(my $fh, "<", $file) or die "Can't open < $file : $!";
   while (<$fh>){
   chop;
     @orden = split /\,/,$_;
       $cliente{$orden[0]} = $orden[2];
      };
   close $fh;

   
   $file ="puertos.txt";
   open(my $fh, "<", $file) or die "Can't open < $file : $!";
   while (<$fh>){
   chop;
     @orden1 = split /\,/,$_;
     $pe{"$orden1[0]"} = $orden1[1];
#       print $pe{"$orden1[0]"}."\n";
#       print  $orden1[2]."\n";
      };
   close $fh;

foreach $i (@interfaces){
   $nombre = i.$i;
   $puerto = p.$puerto[rand @puerto];
   $cpe = cpe.$cpe[rand @cpe];
   $bw = $bw[rand @bw];
   print "$nombre,si,$puerto,".$pe{"$puerto"}.",$cpe,".$cliente{"$cpe"}.",$bw,10,0,10,10,10,10,10,50\n";
}
