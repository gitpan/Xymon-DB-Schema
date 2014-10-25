package Xymon::DB::Schema;
use base qw/DBIx::Class::Schema/;
use strict;

BEGIN {
    our $VERSION     = '0.03';
}

__PACKAGE__->load_classes(qw/ host hoststatus Application LuLocation LuApplication virtAssetNo luHobbitPage luAssetType HobbitPages/);
  
1;
  

=head1 NAME

Xymon::DB::Schema - Group of Schemas for Xymon

=head1 SYNOPSIS

  use Xymon::DB::Schema;



=head1 DESCRIPTION

Load DBIx::Class table classes for Xymon Database application.

=head1 USAGE

	use Xymon::DB::Schema;
	
	my $db = Xymon::DB::Schema->connect( 
			"DBI:Sybase:server=testsql2005;database=Hobbit", "hobbit", "hobpass",
			{PrintError => 0}
			);
	
	if($db) {

		my $hosts = $db->resultset('host')->search(
			{
				hobbit => 1,
				recordstatus => 'Complete',
			},
			{
				'join'	=> 'LuLocation',
				'+select' => 'LuLocation.region',
				'+as' => 'region',
				 order_by => 'hostname ASC' 
			},
		)->hashref_pk;
	} else {
    	die "Unable for connect to server $DBI::errstr";
	}
	
	print $hosts->{$hostname}->{location} . "\n";
	
See DBIx::Class for more details on queries.

=head1 BUGS



=head1 SUPPORT



=head1 AUTHOR

    David Peters
    CPAN ID: DAVIDP
    davidp@electronf.com
    http://www.electronf.com

=head1 COPYRIGHT

This program is free software; you can redistribute
it and/or modify it under the same terms as Perl itself.

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

DBIx::Class, perl(1).

=cut
