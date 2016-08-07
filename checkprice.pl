
my $aws='"c:\Program Files\Amazon\AWSCLI\aws.exe" ec2 ';
my %all_prices;
for (`$aws describe-regions`)
{
	chop;
	my @data=split(/\t/);
	print $data[2]."\n";
	my $region=$data[2];
	
	for (`$aws describe-availability-zones --region $region`)
	{
		chop;
		my @zones_=split(/\t/);
		my $zone=$zones_[3];
		my @prices;
		for (`$aws describe-spot-price-history --instance-types g2.2xlarge --availability-zone $zone --region $region --product-description "Linux/UNIX"`)
		{
			chop;
			my @prices_=split(/\t/);
			my $price=$prices_[4];
			push @prices, $price;
		}
		my @sortedPrice=sort { $a <=> $b } @prices;
		print "$zone: $sortedPrice[0]\n";
		$all_prices{$sortedPrice[0]}="$region:$zone";

	}
}
for ( sort {$a<=>$b} keys %all_prices) {
	my ($region, $zone)=(split(/:/, $all_prices{$_}));
	print "$_: $region, $zone\n";
}