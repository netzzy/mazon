
my $aws='"c:\Program Files\Amazon\AWSCLI\aws.exe" ec2 ';
my %all_prices;
for (`$aws describe-regions`)
{
	chop;
	my @data=split(/\t/);
	print $data[2]."\n";
	my $region=$data[2];
	
	for (`$aws describe-instance-status --region $region`)
	{
		print;

	}
}
