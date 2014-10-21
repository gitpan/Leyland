package Leyland::Logger::LogDispatch;

# ABSTRACT: Use Log::Dispatch as your app's logger

use Moose;
use namespace::autoclean;
use Log::Dispatch;

=head1 NAME

Leyland::Logger::LogDispatch - Use Log::Dispatch as your app's logger

=head1 VERSION

version 0.001

=head1 SYNOPSIS

	# in the config hash-ref of app.psgi:
	my $config = {
		...
		logger => {
			class => 'LogDispatch',
			opts => {
				outputs => [
					[ 'File',   min_level => 'debug', filename => "myapp.$ENV{PLACK_ENV}.log", newline => 1 ],
					[ 'Screen', min_level => 'warning', newline => 1 ],
				],
			}
		},
		...
	};

=head1 DESCRIPTION

This module provides L<Leyland> applications with logging capabilities
from L<Log::Dispatch>. To use Log::Dispatch for logging, your application's
config hash-ref (defined in C<app.psgi>) should have a "logger" key with
information on how to create the logger. Look at the L</"SYNOPSIS"> for
an example.

=head1 CONSUMES

L<Leyland::Logger>

=head1 ATTRIBUTES

=head2 obj

The L<Log::Dispatch> object used.

=cut

has 'obj' => (is => 'ro', isa => 'Log::Dispatch', writer => '_set_obj');

with 'Leyland::Logger';

=head1 OBJECT METHODS

=head2 init( \%opts )

Initializes the Log::Dispatch object with options passed from the app's
config hash.

=cut

sub init {
	my ($self, $opts) = @_;

	$self->_set_obj(Log::Dispatch->new(%$opts));
}

=head2 log( { level => $level, message => $msg } )

Logs a message of a certain level.

=cut

sub log {
	my ($self, $msg) = @_;

	$self->obj->log(level => $msg->{level}, message => $msg->{message});
}

=head1 AUTHOR

Ido Perlmuter, C<< <ido at ido50.net> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-Leyland at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Leyland>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

	perldoc Leyland::Logger::LogDispatch

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Leyland>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Leyland>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Leyland>

=item * Search CPAN

L<http://search.cpan.org/dist/Leyland/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2010-2011 Ido Perlmuter.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

__PACKAGE__->meta->make_immutable;