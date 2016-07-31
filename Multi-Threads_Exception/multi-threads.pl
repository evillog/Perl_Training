use 5.010;
use strict;
use warnings;
use Thread::Semaphore;

my $semaphore2 = Thread::Semaphore->new(0);
my $semaphore3 = Thread::Semaphore->new(0);

my @threads = ();
my $count2 = 0;
my $count3 = 0;

{
	while($count1<5)
	{
		$semaphore1->down(1);
		my $tid = threads->tid();
		say "$tid";
		$count1 += 1;
		$semaphore2->up(1);	
}

	
{
	while($count2<5)
	{
		$semaphore2->down(1);
		my $tid = threads->tid();
		say "$tid";
		#print "$tid\n";
		$count2 += 1;
		$semaphore3->up(1);	
	}
}
	
	
{
	while($count3<5)
	{
		$semaphore3->down(1);
		my $tid = threads->tid();
		say "$tid";
		#print "$tid\n";
		$count3 += 1;
		$semaphore1->up(1);	
	}
}


push @threads, threads->create(\&sub1);
push @threads, threads->create(\&sub2);
push @threads, threads->create(\&sub3);

{
	$threads[$i]->join();
}