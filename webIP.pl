#!/usr/bin/perl

$fileName="./webserver/debugSERVER1_121002.txt";
scanRoutine();


while (($key, $value) = each(%hashIP))
{
	$val=sprintf("%.6d",$value);
	if($value > 10)
	{
		print "$val=$key\n";		
	}
}

while (($key, $value) = each(%hashURL))
{
	$val=sprintf("%.6d",$value);
	if($value > 0)
	{
		if($key =~ /booking\-flow\.form/){
			#print "$val=$key\n";
		}
	}
}

sub scanRoutine
{
	open(FILEH,"$fileName");
	while(<FILEH>)
	{
		@col=split(/\"/);
		@tmp=split(/\?/,$col[1]);
		@tmp2=split(/\ /,$tmp[0]);
		$url=$col[1];
		#print "$url * ";
		@tmp3 = split(/\ /,$col[6]);
		$session=$tmp3[1];

		@col=split(/\"/);
		@tmp=split(/\s+/,$col[0]);
		@tmp4=split(/\:/,$tmp[0]);
		$ip=$tmp4[1];

		#print "$ip\n";

		$hashURL{$url} += 1;
		$hashIP{$ip} += 1;
		
	}
	close FILEH;
	#print "$fileName process\n";
}
